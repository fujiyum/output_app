class CreateGoogleBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :google_books do |t|

      t.timestamps
    end
  end
end
