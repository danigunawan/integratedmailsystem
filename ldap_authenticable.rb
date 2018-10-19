require 'net/ldap'
require 'devise/strategies/authenticatable'
# Hanya untuk test
module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable
      def authenticate!
        if params[:user]
          ldap = Net::LDAP.new
          ldap.host = '192.168.192.2'
          ldap.port = 389
          ldap.auth 'uid=' + username + ', ou=people, dc=pgn-solution, dc=co, dc=id', password

          if ldap.bind
            # user = User.find_or_create_by(username: username)
            # success!(user)
          else
            fail(:invalid_login)
          end
        end
      end

      def email
        params[:user][:username]
      end

      def password
        params[:user][:password]
      end

    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)