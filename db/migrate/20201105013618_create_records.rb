class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :number, null: false, index: { unique: true }
      t.string :court, null: false
      t.string :actor, null: false
      t.string :defendant, null: false
      t.text :summary, null: false

      t.timestamps
    end
  end
end
