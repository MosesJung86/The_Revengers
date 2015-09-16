class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title
      t.string  :description
      t.integer :vote_count, default: 0
      t.timestamps null: false
      t.references :author
    end
  end
end

# removed comma after timestamps
# added missing end
