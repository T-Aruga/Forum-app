class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
