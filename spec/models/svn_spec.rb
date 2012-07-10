# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Svn, 'svn' do
  fixtures :all

  context 'Svn.dir を参照する場合' do
    it "SVN_DIR 定数の値が返る" do
      Svn.dir.should be_true
      Svn.dir.should == '/var/lib/svn'
    end
  end

  context 'Svn.create を参照する場合' do
    it "SVN_CREATE 定数の値が返る" do
      Svn.create.should be_true
      Svn.create.should == '/var/www/bin/svn_create.sh'
    end
  end

  context 'Svn.delete を参照する場合' do
    it "SVN_DELETE 定数の値が返る" do
      Svn.delete.should be_true
      Svn.delete.should == '/var/www/bin/svn_delete.sh'
    end
  end

end
