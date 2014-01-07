class UserPrivacy < ActiveRecord::Base
  belongs_to :user

  def self.defaults
    {
      email: false,
      gallery: true,
      activity: true
    }
  end
end
