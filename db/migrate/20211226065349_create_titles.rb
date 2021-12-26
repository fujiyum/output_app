class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title_name
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
