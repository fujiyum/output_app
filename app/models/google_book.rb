class GoogleBook
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Validations

    attribute :googlebooksapi_id, :string
    attribute :image_id, :string
    attribute :title_name, :string

    validates :googlebooksapi_id, presence: true
    validates :title_name, presence: true

    class << self
        include GoogleBooksApi

        def new_from_item(item)
            @item = item
            @volume_info = @item['volumeInfo']
            new(
                googlebooksapi_id: @item['id'],
                image_id: image_url,
                title_name: @volume_info['title'],
                )
        end

        def new_from_id(googlebooksapi_id)
            url = url_of_creating_from_id(googlebooksapi_id)
            item = get_json_from_url(url)
            new_from_item(item)
        end

        def search(keyword)
            url = url_of_searching_from_keyword(keyword)
            json = get_json_from_url(url)
            items = json['items']
            return [] unless items

            items.map do |item|
                GoogleBook.new_from_item(item)
            end
        end

        private

        def image_url
            @volume_info['imageLinks']['smallThumbnail'] if @volume_info['imageLinks'].present?
        end
    end

    def save
        return false unless valid?

        title = build_title
        return false unless title.valid?

        ActiveRecord::Base.transaction do
            title.remote_image_url = image if image.present?
            title.save
        end
        true
    end

  def find_book_or_save
    if Title.find_by(googlebooksapi_id: googlebooksapi_id) || save
      Title.find_by(googlebooksapi_id: googlebooksapi_id)
    else
      false
    end
  end

  private

  def build_book
    Title.new(
      googlebooksapi_id: googlebooksapi_id,
      published_at: published_at,
      title_name: title,
    )
  end

end
