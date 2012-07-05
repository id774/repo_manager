# -*- coding: utf-8 -*-
class Svn < ActiveRecord::Base
  SVN_DIR    = "/var/lib/svn"
  SVN_CREATE = "/var/www/bin/svn_create.sh"
  SVN_DELETE = "/var/www/bin/svn_delete.sh"

  class << self
    def dir
      SVN_DIR
    end

    def create
      SVN_CREATE
    end

    def delete
      SVN_DELETE
    end

    def generate(id)
      if /[a-z][a-zA-Z0-9_-]+$/ =~ id
        unless /\./ =~ id
          system(self.create + " " + id)
        else
         false
        end
      else
        false
      end
    end

    def destroy(id)
      if /[a-zA-Z0-9_-]+$/ =~ id
        system(self.delete + " " + id)
      else
        false
      end
    end
  end
end
