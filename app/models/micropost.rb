class Micropost < ApplicationRecord
  belongs_to :user
  
  mount_uploader :img, ImgUploader
  
  validates :content, presence: true, length: {maximum: 255}
  
  #micropostは複数の投稿にお気に入りされている(1対多を表現)
  has_many :favorites
  has_many :users, through: :favorites
end
