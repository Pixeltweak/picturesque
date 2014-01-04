class AddImpressionsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :impressions_count, :int
  end
end
