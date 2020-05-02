module DryQna
  module Contracts
    module Questions
      class CreateQuestion < Dry::Validation::Contract
        params do
          required(:title).filled(:string).value(lt?: 100)
          required(:description).filled(:string)
        end
      end
    end
  end
end
