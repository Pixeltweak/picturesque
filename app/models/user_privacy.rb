class UserPrivacy < ActiveRecord::Base
  belongs_to :user
  before_save :default_privacy

  DEFAULTS = {
    email: false,
    gallery: true,
    activity: true
  }

  def default_privacy
    self.value ||= DEFAULTS[self.key]
  end
end
