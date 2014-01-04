class AddImpressionsCountToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :impressions_count, :integer
  end
end
