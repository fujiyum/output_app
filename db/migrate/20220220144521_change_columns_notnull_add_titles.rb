class ChangeColumnsNotnullAddTitles < ActiveRecord::Migration[5.2]
  def change
    change_column_null :titles, :google_books_api_id, :false
  end
end
