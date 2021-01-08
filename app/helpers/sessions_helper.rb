module SessionsHelper

  def remember_user(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget_user(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # 現在ログインしているユーザーを返す
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end
    end
  end

  def current_owner
    if (owner_id = session[:owner_id])
      @current_owner ||= Owner.find_by(id: owner_id)
    elsif (owner_id = cookies.signed[:owner_id])
      owner = Owner.find_by(id: owner_id)
      if owner && owner.authenticated?(cookies[:remember_token])
        session[:owner_id] = owner.id
        @current_owner = owner
      end
    end
  end

  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget_user
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
  end

  def log_out
    forget(current_owner)
    session.delete(:owner_id)
  end

  def login?
    if session[:user_id] == nil
      strore_location
      flash[:danger] = "ログインしてください"
      redirect_to u_login_path
    end
  end

  def redirect_back_or_root
    redirect_to(session[:forwarding_url] || root_path )
    session.delete(:forwarding_url)
  end

  def strore_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
