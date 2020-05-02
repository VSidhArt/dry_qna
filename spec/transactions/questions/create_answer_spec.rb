require 'spec_helper'

RSpec.describe DryQna::Transactions::Answers::CreateAnswer do
  let(:answer_repo) { double("AnswerRepo") }
  let(:answer) { DryQna::Answer.new(id: 1, text: "Title") }

  subject { described_class.new(answer_repo: answer_repo) }

  context "with valid input" do
    let(:input) do
      {
        text: "Title",
      }
    end

    it "creates a answer" do
      expect(answer_repo).to receive(:create) { answer }
      result = subject.call(input)
      expect(result).to be_success
      expect(result.success).to eq(answer)
    end
  end

  context "with invalid input" do
    let(:input) do
      {
        text: "",
      }
    end

    it "does not create a answer" do
      expect(answer_repo).not_to receive(:create)
      result = subject.call(input)
      expect(result).to be_failure
      expect(result.failure.errors[:text]).to include("must be filled")
    end
  end
end
