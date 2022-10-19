class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # has_many :twits       
  def self.find_for_stripe_connect(access_token, _ = nil)
    data = access_token.info
    user = User.where(email: data['email']).first_or_create(
      email: data['email'],
      password: Devise.friendly_token[0, 20],
      provider: request.env["omniauth.auth"].provider,
      uid: request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
    )
    user
  end
    # def self.create_from_provider_data(provider_data)
    #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
    #     user.email = provider_data.info.email
    #     user.password = Devise.friendly_token[0, 20]
    #   end
    # end

    # def self.create_form_provider_data()
    #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
    #     user.email = provider_data.info.email
    #     user.password = Devise.friendly_token[0, 20]
    #   end 
    # end   
    # class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
    # def stripe_connect
    #   @user = User.find_for_stripe_connect(request.env['omniauth.auth'], current_user)
    #   set_notice_and_redirect
    # end

    # private

    # def set_notice_and_redirect          
    #   if @user.persisted?
    #       flash[:notice] = 'Successfully signed in'
    #       set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
    #     else
    #       session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
    #       redirect_to new_user_registration_url
    #   end
    # end

    

has_many :twits    
end
 