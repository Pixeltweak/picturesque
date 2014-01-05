class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  include PublicActivity::Common

  belongs_to :commentable, polymorphic: true

  default_scope -> { order('created_at ASC') }

  # NOTE: Comments belong to a user
  belongs_to :user
  belongs_to :photo, touch: true

  def formatted_text
    BlueCloth.new(self.comment).to_html
  end
end
