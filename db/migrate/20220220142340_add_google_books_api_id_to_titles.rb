class AddGoogleBooksApiIdToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :google_books_api_id, :string
  end

end
