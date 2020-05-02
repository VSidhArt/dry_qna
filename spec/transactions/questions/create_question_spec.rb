require 'spec_helper'

RSpec.describe DryQna::Transactions::Questions::CreateQuestion do
  let(:question_repo) { double("QuestionRepo") }
  let(:question) { DryQna::Question.new(id: 1, title: "Title") }

  subject { described_class.new(question_repo: question_repo) }

  context "with valid input" do
    let(:input) do
      {
        title: "Title",
        description: "Desc",
      }
    end

    it "creates a question" do
      expect(question_repo).to receive(:create) { question }
      result = subject.call(input)
      expect(result).to be_success
      expect(result.success).to eq(question)
    end
  end

  context "with invalid input" do
    let(:input) do
      {
        title: "Title",
      }
    end

    it "does not create a question" do
      expect(question_repo).not_to receive(:create)
      result = subject.call(input)
      expect(result).to be_failure
      expect(result.failure.errors[:description]).to include("is missing")
    end
  end
end
