require "spec_helper"

RSpec.describe DryQna::Repos::QuestionRepo do
  context "#create" do
    it "creates a question" do
      question = subject.create(
        title: "Title",
        description: "Desc",
      )

      expect(question).to be_a(DryQna::Question)
      expect(question.id).not_to be_nil
      expect(question.title).to eq("Title")
      expect(question.description).to eq("Desc")
      expect(question.created_at).not_to be_nil
      expect(question.updated_at).not_to be_nil
    end
  end

  context "#all" do
    before do
      subject.create(title: "Title", description: "Desc")
    end

    it "returns all questions" do
      questions = subject.all
      expect(questions.count).to eq(1)
      expect(questions.first).to be_a(DryQna::Question)
    end
  end
end
