require "spec_helper"

RSpec.describe DryQna::Repos::AnswerRepo do
  context "#create" do
    it "creates a answer" do
      answer = subject.create(
        text: "Text",
      )

      expect(answer).to be_a(DryQna::Answer)
      expect(answer.id).not_to be_nil
      expect(answer.text).to eq("Text")
      expect(answer.created_at).not_to be_nil
      expect(answer.updated_at).not_to be_nil
    end
  end
end
