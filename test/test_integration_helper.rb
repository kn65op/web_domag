require "test_helper"
require "capybara/rails"

    module ActionController
      class IntegrationTest
        include Capybara::DSL

        def sign_in_as(user, password)
#           user = User.create(:password => password, :password_confirmation => password, :email => user)
#           user.confirmed_at = Time.now
#          user.save!
 #         user = User.create(:password => password, :password_confirmation => password, :email => user)
 #         user.confirmed_at = Time.now
 #         user.save!
          visit '/en/'
          fill_in 'user_email', :with => user
          fill_in 'user_password', :with => password
          click_link_or_button('Login')
          user
        end

         def sign_out
            click_link_or_button('Log Out')
         end
      end
    end