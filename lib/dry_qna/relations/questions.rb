module DryQna
  module Relations
    class Questions < ROM::Relation[:sql]
      schema(:questions, infer: true)
    end
  end
end
