module Queries
  class FilmQuery < Queries::BaseQuery
    type Types::FilmType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Film.find(id)
    end
  end
end
