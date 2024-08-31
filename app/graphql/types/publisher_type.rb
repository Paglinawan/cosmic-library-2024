module Types
  class PublisherType < Types::BaseObject
    field :id, ID, null: false
    field :label, String
    field :label_en, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
