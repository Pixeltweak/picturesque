class CreateUserPrivacies < ActiveRecord::Migration
  def change
    create_table :user_privacies do |t|
      t.references :user, index: true
      t.string :key
      t.boolean :value

      t.timestamps
    end
  end
end
