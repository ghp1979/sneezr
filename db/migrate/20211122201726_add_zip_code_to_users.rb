class AddZipCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zip_code, :string, limit: 5, null: false
  end
end
