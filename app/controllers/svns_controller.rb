# -*- coding: utf-8 -*-

class SvnsController < ApplicationController
  #before_filter :authenticate

  # GET /svns/1
  # GET /svns/1.xml
  def show
    @repo = params[:svn_repo]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repo }
    end
  end

  # DELETE /svns/1
  # DELETE /svns/1.xml
  def delete
    if request.delete?
      if /[a-zA-Z0-9_-]+$/ =~ params[:svn_repo]
        result = system(SVN_DELETE_SH + " " + params[:svn_repo])
        if result
          flash[:notice] = params[:svn_repo] + " は正常に削除されました"
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
      username == "your_username" &&
      password == "your_password"
    end
  end
end
