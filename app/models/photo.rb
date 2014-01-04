class Photo < ActiveRecord::Base

  TOTAL_SIDEBAR_COUNT = 5
  MORE_BY_AUTHOR_COUNT = 3

  include PublicActivity::Common

  belongs_to :user
  has_many :comments
  has_many :votes

  # Allow users to "like" pictures
  acts_as_votable

  # Allow users to comment on pictures
  acts_as_commentable

  # Keep track of photo tags
  acts_as_taggable

  # Count page views
  is_impressionable counter_cache: true, unique: true

  # Image uploading
  has_attached_file :image,
                    styles: {
                      thumb: "260x160#",
                      tile: "275x180#",
                      display: "840x1200>",
                      tiny_thumb: "50x50>"
                    },
                    convert_options: { thumb: "-quality 75 -strip" }

  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  }

  def more_by_author
    @more_by_author ||= self.user.photos.includes(:user)
                                        .limit(MORE_BY_AUTHOR_COUNT)
                                        .where('id > :id OR id < :id ', { id: self.id })
  end

  def self.popular_photos
    @popular_photos ||= limit(TOTAL_SIDEBAR_COUNT)
                        .order(impressions_count: :desc, created_at: :desc)
                        .includes(:user)
                        .sample((TOTAL_SIDEBAR_COUNT - MORE_BY_AUTHOR_COUNT)).reverse
  end
end
