class RenameTergetColumnToInputs < ActiveRecord::Migration[5.2]
  def change
    rename_column :inputs, :terget, :target
  end
end
