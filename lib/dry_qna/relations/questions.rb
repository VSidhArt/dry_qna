module DryQna
  module Relations
    class Questions < ROM::Relation[:sql]
      schema(:questions, infer: true)
    end
  end
end
# user_repo = DryQna::Repos::QuestionRepo.new(DryQna::Application['container'])
