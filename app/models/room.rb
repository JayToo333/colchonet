class Room < ApplicationRecord
  extend FriendlyId

  validates_presence_of :title
  validates_presence_of :slug
  friendly_id :title, use: [ :slugged, :history ]

  has_many :rooms
  has_many :reviews, dependent: :destroy

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [ :slugged, :history ]

  def complete_name
    "#{title}, #{location}"
  end

  def self.search(query)
    if query.present?
      where([ "location LIKE :query OR
        title LIKE :query OR
        description LIKE :query", query: "%#{query}%" ])
    else
      scoped
    end
  end
end
