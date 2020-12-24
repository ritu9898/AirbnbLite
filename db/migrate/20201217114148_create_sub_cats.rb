class CreateSubCats < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_cats do |t|
      t.references :cat, null: false, foreign_key: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
