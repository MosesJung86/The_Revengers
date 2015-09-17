class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.references :commenter
      t.references :question

      t.timestamps null: false
    end
  end
end

# removed comma after timestamps
# added missing end
