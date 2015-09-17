class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title
      t.string  :description
      t.timestamps null: false
      t.references :author
      t.integer :views, default: 0
    end
  end
end

# removed comma after timestamps
# added missing end
