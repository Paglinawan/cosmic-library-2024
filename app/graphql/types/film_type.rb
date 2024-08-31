module Types
  class FilmType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :title_en, String, null: false
    field :comment, String
    field :comment_en, String
    field :director, String, null: false
    field :director_en, String, null: false
    field :cast, String
    field :cast_en, String
    field :review_star, Integer
    field :country, Types::CountryType, null: false
    field :year, Integer, null: false
    field :is_public, Boolean, null: false
    field :is_classic, Boolean, null: false
    field :is_favorite, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :film_tags, [Types::FilmTagType], null: true
  end
end
