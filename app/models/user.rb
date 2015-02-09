class User < ActiveRecord::Base
  has_many                  :flips, dependent: :destroy
  default_scope             -> { order(created_at: :desc) }
  validates_presence_of     :first_name, :last_name, :user_name, :location, :photo_url, :bio
  validates_length_of       :user_name, { maximum: 50 }
  validates_uniqueness_of   :user_name

  def feed
    Flip.where("user_id = ?", id)
  end
end
