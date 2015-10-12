class CreateUserCharacters < ActiveRecord::Migration
  def change
    create_table :user_characters do |t|
      t.references :user
      t.references :character

      t.timestamps
    end
  end
end