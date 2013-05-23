# -*- coding: utf-8 -*-

class GitsController < ApplicationController
  before_filter :authenticate if RailsApp::Application.config.basic_auth

  def show
    @repo = params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @repo }
    end
  end

  def destroy
    if request.delete?
      if Git.destroy(params[:id])
        flash[:notice] = "Git リポジトリ " + params[:id] + " は正常に削除されました"
      end
    end

    respond_to do |format|
      format.html { redirect_to(repos_url) }
      format.xml  { head :ok }
    end
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == RailsApp::Application.config.username &&
      password == RailsApp::Application.config.password
    end
  end
end
