class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.integer :vote_count, default: 0
      t.references :commenter
      t.references :question

      t.timestamps null: false
    end
  end
end
