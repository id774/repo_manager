# -*- coding: utf-8 -*-

class ReposController < ApplicationController
  #before_filter :authenticate

  # GET /repos
  # GET /repos.xml
  def index
    @git_repos = Dir::entries(GIT_DIR).sort
    @svn_repos = Dir::entries(SVN_DIR).sort
    @repos = @git_repos + @svn_repos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repos }
    end
  end

  # GET /repos/new
  # GET /repos/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /repos
  # POST /repos.xml
  def create
    if request.post?
      unless params[:new_git_field].blank?
        if /[a-z][a-zA-Z0-9_-]+$/ =~ params[:new_git_field]
          unless /\./ =~ params[:new_git_field]
            result = system(GIT_NEW_SH + " " + params[:new_git_field])
            if result
              flash[:notice] = params[:new_git_field] + ' は正常に生成されました'
            end
          end
        end
      end
      unless params[:new_svn_field].blank?
        if /[a-z][a-zA-Z0-9_-]+$/ =~ params[:new_svn_field]
          unless /\./ =~ params[:new_svn_field]
            result = system(SVN_NEW_SH + " " + params[:new_svn_field])
            if result
              flash[:notice] = params[:new_svn_field] + ' は正常に生成されました'
            end
          end
        end
      end
    end
    redirect_to(:action => 'index')
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "your_username" &&
      password == "your_password"
    end
  end
end
