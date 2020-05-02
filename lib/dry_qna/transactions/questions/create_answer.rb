module DryQna
  module Transactions
    module Answers
      class CreateAnswer
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.questions.create_answer"]
        include Import["repos.answer_repo"]

        def call(input)
          values = yield validate(input)
          question = yield persist(values)

          Success(question)
        end

        def validate(input)
          create_answer.call(input).to_monad
        end

        def persist(result)
          Success(answer_repo.create(result.values))
        end
      end
    end
  end
end
