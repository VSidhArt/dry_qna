module DryQna
  module Repos
    class QuestionRepo < ROM::Repository[:questions]
      struct_namespace DryQna

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def all
        questions.to_a
      end
    end
  end
end
