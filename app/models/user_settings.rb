class UserSettings < ActiveRecord::Base
  belongs_to :user

  def list_privacy_preferences
    ['']
  end
end
