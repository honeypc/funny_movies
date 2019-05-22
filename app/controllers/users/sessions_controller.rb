# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    detect_email_to_create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    # Create new
    sign_in(resource_name, resource)
    respond_to_on_create
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def respond_to_on_create
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.json { redirect_to after_sign_in_path_for(resource_name) }
      format.any { respond_with resource, location: after_sign_in_path_for(resource) }
    end
  end

  def detect_email_to_create
    user = User.where(email: params[:user][:email]).first_or_create
    if user.new_record?
      user.password = params[:user][:password]
      user.confirmed_at = DateTime.now
      user.save
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
