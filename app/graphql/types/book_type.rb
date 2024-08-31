module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :title_en, String, null: false
    field :comment, String
    field :comment_en, String
    field :author, String, null: false
    field :author_en, String, null: false
    field :publisher, Types::PublisherType, null: false
    field :quote, String
    field :quote_en, String
    field :review_star, Integer
    field :country, Types::CountryType, null: false
    field :year, Integer, null: false
    field :is_public, Boolean, null: false
    field :is_classic, Boolean, null: false
    field :is_favorite, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :book_tags, [Types::BookTagType], null: true
  end
end
