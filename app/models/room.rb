class Room < ApplicationRecord
  extend FriendlyId

  validates_presence_of :title
  validates_presence_of :slug

  has_many :reviews, dependent: :destroy
  belongs_to :user

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [ :slugged, :history ]

  scope :most_recent, -> { order(created_at: :desc) }

  def complete_name
    "#{title}, #{location}"
  end

  def self.search(query)
    if query.present?
      where([ "location LIKE :query OR title LIKE :query OR description LIKE :query", query: "%#{query}%" ])
    else
      all
    end
  end
end
