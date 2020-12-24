class AddSubCategoryIdToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :sub_category_id, :integer
   
  end
end
