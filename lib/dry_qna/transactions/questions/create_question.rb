module DryQna
  module Transactions
    module Questions
      class CreateQuestion
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.questions.create_question"]
        include Import["repos.question_repo"]

        def call(input)
          values = yield validate(input)
          question = yield persist(values)

          Success(question)
        end

        def validate(input)
          create_question.call(input).to_monad
        end

        def persist(result)
          Success(question_repo.create(result.values))
        end
      end
    end
  end
end
