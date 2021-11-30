class CreateZipCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code, null: false, limit: 5

      t.timestamps
    end
  end
end
