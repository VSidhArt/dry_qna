module DryQna
  module Relations
    class Answers < ROM::Relation[:sql]
      schema(:answers, infer: true)
    end
  end
end
