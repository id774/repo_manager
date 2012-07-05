# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationController, 'アプリケーション全体' do
  fixtures :all

  context 'にアクセスする場合' do
    describe '存在しないアドレスにアクセスすると' do
      it "ルーティングエラーが発生する" do
        lambda{get 'hoge'}.should raise_error ActionController::RoutingError
      end
    end
  end

end
