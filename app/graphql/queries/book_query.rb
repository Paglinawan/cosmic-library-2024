module Queries
  class BookQuery < Queries::BaseQuery
    type Types::BookType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Book.find(id)
    end
  end
end
