module DryQna
  module Repos
    class AnswerRepo < ROM::Repository[:answers]
      include Import["container"]

      struct_namespace DryQna

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }
    end
  end
end
