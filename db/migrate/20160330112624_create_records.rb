class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.date :started_at
      t.integer :duration

      t.timestamps null: false
    end
  end
end
