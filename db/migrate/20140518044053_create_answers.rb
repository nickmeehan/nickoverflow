class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :answerable, polymorphic: true

      t.timestamps
    end
  end
end
