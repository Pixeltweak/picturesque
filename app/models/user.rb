class User < ActiveRecord::Base
  # Authorization
  rolify

  # Allow a user to follow and be followed
  acts_as_followable
  acts_as_follower

  # Allow a user to like photos
  acts_as_voter

  # Count page views
  is_impressionable counter_cache: true, unique: true

  # Relationships
  has_many :photos

  # Authentication
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  # Avatar uploading
  has_attached_file :avatar, styles: {
    large: "200x200#",
    medium: "100x100#",
    thumb: "30x30#"
  }, default_url: "/assets/:style/default_avatar.png"

  validates_attachment :avatar, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  }

  # Photo tagging
  acts_as_tagger

  # User activity
  def activity
    PublicActivity::Activity.order("created_at desc").where(owner_id: self.id, owner_type: "User")
  end

  def page_views
    self.impressionist_count
  end

  def first_name
    @first_name ||= self.name.split(" ")[0]
  end

  def total_photo_likes
    self.photos.includes(:votes).map {|photo| photo.votes.size }.reduce(0, :+)
  end
end
