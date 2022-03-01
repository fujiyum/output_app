class TitlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit]

  def new
    @title = Title.new
    if params[:keyword].present?
      require 'net/http'
      url = 'https://www.googlebooksapis.com/books/v1/volumes?q='
      request = url + params[:keyword]
      enc_str = URI.encode(request)
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      @bookjson = JSON.parse(json)
      
      count = 5
      @title = Array.new(count).map{Array.new(4)}
      count.times do |x|
        @titles[x][0] = @bookjson.dig("items", x, "volumeInfo", "title")
        @titles[x][1] = @bookjson.dig("items", x, "volumeInfo", "imageLinks", "thumbnail")
      end
    end
  end

  def create
    google_book = GoogleBook.new_from_id(create_book_params[:googlebooksapi_id])
    if (@title = google_book.find_book_or_save)
      redirect_to title_path(@title.id)
    else
      redirect_to search_titles_path, danger: 'ページの表示に失敗しました'
    end
  end

  def show
    @title = Title.find(params[:id])
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
    if @title.update(title_params)
      redirect_to titles_path
    else
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to user_path(@title.user.id)
  end

  def index
    @titles = Title.page(params[:page]).reverse_order
  end


  private

  def create_book_params
    params.permit(:googlebooksapi_id)
  end

  def search_books_params
    params.fetch(:q, keyword: '').permit(:keyword)
  end

  def correct_user
      title = Title.find(params[:id])
      user = title.user
    if current_user != user
      redirect_to root_path
    end
  end

end
