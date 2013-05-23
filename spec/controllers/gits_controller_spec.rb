# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe GitsController, 'Git コントローラー' do
  fixtures :all

  TEST_DIR11 = File.join(RailsApp::Application.config.git_dir, 'test_repo.git')

  before do
    FileUtils.mkdir(TEST_DIR11) unless File.exist?(TEST_DIR11)
  end

  context 'にログイン無しでアクセスする場合' do
    describe '詳細表示' do
      it "Git リポジトリ詳細画面が表示される" do
        get 'show', :id => 1
        response.should be_success
      end
    end

    describe '削除' do
      context '削除ボタンを押した場合' do
        it "リポジトリが削除される" do
          expect = 'Git リポジトリ test_repo は正常に削除されました'
          delete 'destroy', {
            :id => "test_repo"
          }
          response.should be_redirect
          response.redirect_url.should == 'http://test.host/repos'
          response.header.should have_at_least(1).items
          response.body.should have_at_least(1).items
          flash[:notice].should_not be_nil
          flash[:notice].should == expect
          FileTest::directory?(TEST_DIR11).should be_false
        end
      end
    end
  end

  after do
    #FileUtils.rm_rf(TEST_DIR11) if File.exist?(TEST_DIR11)
  end

end
