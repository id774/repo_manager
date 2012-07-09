# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe ActionView::Helpers::FormTagHelper, '二重押し防止機能' do
  fixtures :all
  include ActionView::Helpers::FormTagHelper

  context '送信ボタンがクリックされた場合' do
    describe '送信すると' do
      it "例外が発生しない" do
        lambda {
          ActionView::Helpers::FormTagHelper.submit_tag
        }.should_not raise_exception(Errno::ENOENT)
      end

      it "ボタンがクリック不能になる" do
        expect = "<input data-disable-with=\"処理中...\" name=\"commit\" type=\"submit\" />"
        submit_tag.should == expect
      end
    end
  end
end
