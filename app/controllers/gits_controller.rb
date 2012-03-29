# -*- coding: utf-8 -*-

class GitsController < ApplicationController
  before_filter :authenticate if BASIC_AUTH

  # GET /gits/1
  # GET /gits/1.xml
  def show
    @repo = params[:git_repo]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repo }
    end
  end

  # DELETE /gits/1
  # DELETE /gits/1.xml
  def delete
    if request.delete?
      if /[a-zA-Z0-9_-]+$/ =~ params[:git_repo]
        result = system(GIT_DELETE_SH + " " + params[:git_repo])
        if result
          flash[:notice] = params[:git_repo] + " は正常に削除されました"
        end
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
      username == USERNAME &&
      password == PASSWORD
    end
  end
end
