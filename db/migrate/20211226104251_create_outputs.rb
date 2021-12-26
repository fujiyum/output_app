class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.integer :input_id
      t.text :output
      t.text :feedback

      t.timestamps
    end
  end
end
