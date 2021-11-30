class CreateDailyReportTable < ActiveRecord::Migration[6.1]
  def change
    create_table :symptom_reports do |t|
      t.integer :sneezing, null: false
      t.integer :congestion, null: false
      t.integer :runny_nose, null: false
      t.integer :itchy_nose, null: false
      
      t.belongs_to :user
      t.timestamps
    end
  end
end
