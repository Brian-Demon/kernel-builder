module HomeHelper
  def user_avatar(user)
    image_tag("https://github.com/#{user.username}.png", width: 50, class: "border")
  end
end
