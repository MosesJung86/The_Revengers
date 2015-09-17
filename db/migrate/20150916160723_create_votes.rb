class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count, default: 0
      t.integer :votable_id
      t.string :votable_type
    end

    add_index :votes, :votable_id
  end
end
