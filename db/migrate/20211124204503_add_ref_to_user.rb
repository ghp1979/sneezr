class AddRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :zip_code, foreign_key: true, null: false
  end
end
