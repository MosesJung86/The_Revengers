class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :char_type
      t.integer :health
      t.string :attack
      t.integer :defense
      t.integer :level
      t.string :special1
      t.integer :special1dmg
      t.string :special2
      t.integer :special2dmg
      t.string :picture_id
      t.boolean :current_hero
      t.string :message

      t.timestamps
    end
  end
end
