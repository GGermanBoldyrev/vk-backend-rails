class CreateClassrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :classrooms do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
    add_index :classes, [:number, :letter, :school_id], unique: true
    add_index :classes, :school_id
  end
end
