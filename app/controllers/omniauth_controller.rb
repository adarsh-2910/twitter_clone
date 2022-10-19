class OmniauthController < ApplicationController
    def stripe_connect
        binding.pry
        @user = User.find_for_stripe_connect(request.env['omniauth.auth'], current_user)
        set_notice_and_redirect
      end
  
      private
  
      def set_notice_and_redirect          
        if @user.persisted?
            flash[:notice] = 'Successfully signed in'
            set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
          else
            session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
      end
    # def google_oauth2
    # @user = User.create_from_provider_data(request.env['omniauth.auth'])
    #     if @user.persisted?
    #         sign_in_and_redirect @user
    #         # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    #     else
    #         flash[:error] = 'There was a problem signing you in through Google. Please register or try signing later'
    #         redirect_to new_user_registration_url 
    #     end    
    # end
    
    # def failure
    #     flash[:error] = 'There was problem signing you user. Please register or try signing later.'
    #     redirect_to new_user_registration_url
    # end     
end
