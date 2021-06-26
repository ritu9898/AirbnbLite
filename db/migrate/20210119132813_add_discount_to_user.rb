class AddDiscountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :discount, :number
  end
end
