module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def headerable?
    %w(
      sessions
    ).exclude?(controller_name)
  end

  def footerable?
    %w(
      sessions
    ).exclude?(controller_name)
  end
end
