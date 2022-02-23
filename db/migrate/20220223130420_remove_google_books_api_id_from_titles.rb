class RemoveGoogleBooksApiIdFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :titles, :google_books_api_id, :string
  end
end
