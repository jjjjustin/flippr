module UsersHelper
    def photo_for(user)
    photo_id = Digest::MD5::hexdigest(user.user_name)
    photo_url = "https://secure.gravatar.com/avatar/#{photo_id}"
    image_tag(photo_url, alt: user.user_name, class: "gravatar")
  end
end
