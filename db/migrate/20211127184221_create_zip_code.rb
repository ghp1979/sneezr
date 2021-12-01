class CreateZipCode < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code, length: 5
      t.timestamps
    end
  end
end
