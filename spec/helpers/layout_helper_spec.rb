# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe LayoutHelper, 'レイアウト表示支援機能' do
  fixtures :all

  context 'ビューのレイアウトをレンダリングする場合' do
    describe 'ページタイトルを与えると' do
      it "ページタイトルが表示される" do
        page_title = "一覧画面"
        helper.title(page_title).should be_true
        helper.show_title?.should be_true
      end
    end
  end

  context 'スタイルシートタグをレンダリングする場合' do
    describe 'スタイルシート名を与えると' do
      it "スタイルシートのリンクタグが表示される" do
        stylesheet_name = "application"
        lambda {
          helper.stylesheet(stylesheet_name)
        }.should be_true
      end
    end
  end

  context 'JavaScript タグをレンダリングする場合' do
    describe 'JavaScript 名を与えると' do
      it "JavaScript のリンクタグが表示される" do
        javascript_name = "test.js"
        lambda {
          helper.javascript(javascript_name)
        }.should be_true
      end
    end
  end

end
