# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe ReposController, 'リポジトリコントローラー' do
  fixtures :all

  TEST_DIR1 = File.join(RailsApp::Application.config.git_dir, 'test_repo.git')
  TEST_DIR2 = File.join(RailsApp::Application.config.svn_dir, 'test_repo')

  before do
    FileUtils.rm_rf(TEST_DIR1) if File.exist?(TEST_DIR1)
    FileUtils.rm_rf(TEST_DIR2) if File.exist?(TEST_DIR2)
  end

  context 'にログイン無しでアクセスする場合' do
    describe '一覧表示' do
      it "リポジトリ一覧画面が表示される" do
        get 'index'
        response.should be_success
      end
    end

    describe 'リポジトリ作成' do
      it "リポジトリ作成画面が表示される" do
        get 'new'
        response.should be_success
      end
    end

    describe '作成ボタンで' do
      context 'Git リポジトリ名が指定された場合' do
        it "Git リポジトリが作成される" do
          expect = 'Git リポジトリ test_repo は正常に生成されました'
          post 'create', {
            :new_git_field => "test_repo",
            :new_svn_field => "",
          }
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          flash[:notice].should_not be_nil
          flash[:notice].should == expect
          FileTest::directory?(TEST_DIR1).should be_true
        end
      end
    end

    describe '作成ボタンで' do
      context 'SVN リポジトリ名が指定された場合' do
        it "SVN リポジトリが作成される" do
          expect = 'SVN リポジトリ test_repo は正常に生成されました'
          post 'create', {
            :new_svn_field => "test_repo",
          }
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          flash[:notice].should_not be_nil
          flash[:notice].should == expect
          FileTest::directory?(TEST_DIR2).should be_true
        end
      end
    end

  end

  after do
    FileUtils.rm_rf(TEST_DIR1) if File.exist?(TEST_DIR1)
    FileUtils.rm_rf(TEST_DIR2) if File.exist?(TEST_DIR2)
  end

end
