# -*- coding: utf-8 -*-

class ReposController < ApplicationController
  before_filter :authenticate if RailsApp::Application.config.basic_auth

  def index
    @git_repos = Dir::entries(RailsApp::Application.config.git_dir).sort
    @svn_repos = Dir::entries(RailsApp::Application.config.svn_dir).sort
    @repos = @git_repos + @svn_repos

    respond_to do |format|
      format.html
      format.json { render json: @repos }
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    if request.post?
      unless params[:new_git_field].blank?
        if Git.generate(params[:new_git_field])
          flash[:notice] = 'Git リポジトリ ' + params[:new_git_field] + ' は正常に生成されました'
        end
      end
      unless params[:new_svn_field].blank?
        if Svn.generate(params[:new_svn_field])
          flash[:notice] = 'SVN リポジトリ ' + params[:new_svn_field] + ' は正常に生成されました'
        end
      end
    end
    redirect_to(:action => 'index')
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == RailsApp::Application.config.username &&
      password == RailsApp::Application.config.password
    end
  end
end
