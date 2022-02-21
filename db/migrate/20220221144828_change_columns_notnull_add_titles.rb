class ChangeColumnsNotnullAddTitles < ActiveRecord::Migration[5.2]
  def change
    change_column :titles, :google_books_api_id, :string, null: false 
  end
end
