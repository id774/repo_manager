class Repo < ActiveRecord::Base

  class << self
    def hostname
      HOSTNAME
    end

    def username
      USERNAME
    end

    def password
      PASSWORD
    end

    def basic_auth
      BASIC_AUTH
    end
  end

end
