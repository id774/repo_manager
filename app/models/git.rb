class Git < ActiveRecord::Base

  class << self

    def generate(id)
      if /[a-z][a-zA-Z0-9_-]+$/ =~ id
        unless /\./ =~ id
          system(RailsApp::Application.config.git_create + " " + RailsApp::Application.config.git_dir + " " + id)
        else
         false
        end
      else
        false
      end
    end

    def destroy(id)
      if /[a-zA-Z0-9_-]+$/ =~ id
        system(RailsApp::Application.config.git_delete + " " + RailsApp::Application.config.git_dir + " " + RailsApp::Application.config.trash_dir + " " + id)
      else
        false
      end
    end

  end

end
