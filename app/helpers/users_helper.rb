module UsersHelper

  def login(user)
    session[:user_id] = user.id
  end

  def owned?(user)
    user.user_id == (user.try(:id) || user)
  end

  def logout
    session.clear
  end

end
