class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.integer :title_id
      t.string :input
      t.string :terget

      t.timestamps
    end
  end
end
