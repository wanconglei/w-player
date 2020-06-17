class CreateSettings < ActiveRecord::Migration[6.0]
  def self.up
    create_table :settings do |t|
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.integer :thing_id
      t.string :thing_type, limit: 30
      t.timestamps
      t.index [:thing_type, :thing_id, :var], unique: true
    end
  end

  def self.down
    drop_table :settings
  end
end
