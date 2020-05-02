module DryQna
  module Contracts
    module Questions
      class CreateAnswer < Dry::Validation::Contract
        params do
          required(:text).filled(:string, max_size?: 300)
        end
      end
    end
  end
end
