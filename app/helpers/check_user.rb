helpers do
  def same_user?
    session[:user_id] == @entry.user_id
  end
end
