# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Git, 'git' do
  fixtures :all

  context 'Git.dir を参照する場合' do
    it "GIT_DIR 定数の値が返る" do
      Git.dir.should be_true
      Git.dir.should == '/var/lib/git'
    end
  end

  context 'Git.create を参照する場合' do
    it "GIT_CREATE 定数の値が返る" do
      Git.create.should be_true
      Git.create.should == '/var/www/bin/git_create.sh'
    end
  end

  context 'Git.delete を参照する場合' do
    it "GIT_DELETE 定数の値が返る" do
      Git.delete.should be_true
      Git.delete.should == '/var/www/bin/git_delete.sh'
    end
  end

end
