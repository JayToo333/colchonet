class RoomPresenter
def review_points
Review::POINTS
end
def stars
@room.reviews.stars
end
def total_reviews
@room.reviews.size
end
def picture_url
@room.picture_url
end
def thumb_url
@room.picture.thumb.url
end
def has_picture?
@room.picture?
end
end
