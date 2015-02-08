class User < ActiveRecord::Base
  validates_presence_of     :first_name, :last_name, :user_name, :location, :photo_url, :bio
  validates_length_of       :user_name, { maximum: 50 }
  validates_uniqueness_of  :user_name
end
