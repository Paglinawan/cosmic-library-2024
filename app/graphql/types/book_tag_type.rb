module Types
  class BookTagType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false
    field :label_en, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
