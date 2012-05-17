module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  private
    def clear_return_to
      session.delete(:return_to)
    end

end
