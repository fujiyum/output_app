class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :input_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
