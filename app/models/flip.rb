class Flip < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  def feed
    Flip.where("user_id = ?", id)
  end
end
