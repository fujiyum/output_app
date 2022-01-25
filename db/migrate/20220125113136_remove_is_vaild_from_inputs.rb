class RemoveIsVaildFromInputs < ActiveRecord::Migration[5.2]
  def change
    remove_column :inputs, :is_vaild, :boolean
  end
end
