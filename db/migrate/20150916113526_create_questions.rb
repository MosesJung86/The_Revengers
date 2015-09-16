class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title
      t.string  :description
      t.integer :vote_count, default: 0
      t.references :author
  end
end
