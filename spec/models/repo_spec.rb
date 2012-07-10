# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Repo, 'リポジトリ' do
  fixtures :all

  before do
    HOSTNAME.gsub!("your_hostname", "test.server")
    USERNAME.gsub!("your_username", "test.user")
    PASSWORD.gsub!("your_password", "test.pass")
  end

  context 'ホストネームを参照する場合' do
    it "HOSTNAME 定数の値が返る" do
      Repo.hostname.should be_true
      Repo.hostname.should == 'test.server'
    end
  end

  context 'ユーザーを参照する場合' do
    it "USERNAME 定数の値が返る" do
      Repo.username.should be_true
      Repo.username.should == 'test.user'
    end
  end

  context 'パスワードを参照する場合' do
    it "USERNAME 定数の値が返る" do
      Repo.password.should be_true
      Repo.password.should == 'test.pass'
    end
  end

  context '認証設定を参照する場合' do
    it "BASIC_AUTH 定数の値が返る" do
      Repo.basic_auth.should be_false
    end
  end

end
