# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe ErrorMessagesHelper, 'メッセージ表示機能' do
  fixtures :all

  context 'エラーメッセージを表示する場合' do
    describe 'メッセージを受けとると' do
      it "例外が発生しない" do
        lambda {
          error_messages_for(nil)
        }.should_not raise_exception(Errno::ENOENT)
      end
    end

    describe 'メッセージを受けとると' do
      it "メッセージを表示する" do
        error_messages_for(nil).should be_nil
      end
    end

  end
end

describe ErrorMessagesHelper::FormBuilderAdditions, 'メッセージ受け渡し機能' do
  fixtures :all

  context 'エラーメッセージを表示する場合' do
    describe '空のメッセージを与えると' do
      it "例外が発生しない" do
        lambda {
          error_messages
        }.should_not raise_exception(Errno::ENOENT)
      end
    end
  end
end
