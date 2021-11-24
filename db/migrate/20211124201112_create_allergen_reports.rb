class CreateAllergenReports < ActiveRecord::Migration[6.1]
  def change
    create_table :allergen_reports do |t|
      t.integer :tree_value, null: false
      t.string :tree_category, null: false
      t.integer :grass_value, null: false
      t.string :grass_category, null: false
      t.integer :ragweed_value, null: false
      t.string :ragweed_category, null: false
      t.integer :mold_value, null: false
      t.string :mold_category, null: false
      t.integer :dust_dander_value, null: false
      t.string :dust_dander_category, null: false
      t.belongs_to :zip_code, null: false
      
      t.timestamps
    end
  end
end
