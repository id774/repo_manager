class Git < ActiveRecord::Base

  class << self
    def dir
      GIT_DIR
    end

    def create
      GIT_CREATE
    end

    def delete
      GIT_DELETE
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
