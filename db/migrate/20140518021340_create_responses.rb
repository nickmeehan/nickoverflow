  class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :respondable_id
      t.string :respondable_type

      t.timestamps
    end
  end
end
