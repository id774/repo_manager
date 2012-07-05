class Repo < ActiveRecord::Base
  HOSTNAME      = "your_hostname"
  USERNAME      = "your_username"
  PASSWORD      = "your_password"
  BASIC_AUTH    = false

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
