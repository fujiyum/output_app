class AddColumnsToInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :inputs, :limit, :datetime
    add_column :inputs, :is_vaild, :boolean, default: true
  end
end
