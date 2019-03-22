class ApplicationController < ActionController::Base

  def sign_in(user)
    remember_token = SecureRandom.urlsafe_base64
    remember_digest = Digest::SHA1.hexdigest(remember_token)
    user.update_attribute(:remember_digest, remember_digest)
    cookies.permanent[:remember_token] = remember_token
  end

  def current_user
    if cookies[:remember_token]
      user_digest = Digest::SHA1.hexdigest(cookies[:remember_token])
      user ||= User.find_by(remember_digest: user_digest)
    else
      nil
    end
  end

  def sign_out(user)
    cookies.delete(:remember_token)
    @current_user = nil
    user.update_attribute(:remember_digest, nil)
  end

  def signed_in
    unless current_user
      flash[:danger] = "You must be signed in."
      redirect_to root_url
    end
  end

end
