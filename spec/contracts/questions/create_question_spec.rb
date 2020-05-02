require 'spec_helper'

RSpec.describe DryQna::Contracts::Questions::CreateQuestion do
  context "given valid parameters" do
    let(:input) do
      {
        title: "Title",
        description: "Desc",
      }
    end

    let(:result) { subject.call(input) }

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "requires title" do
    let(:input) do
      {
        description: "Desc",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:title]).to include("is missing")
    end
  end

  context "requires description" do
    let(:input) do
      {
        title: "Title",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:description]).to include("is missing")
    end
  end
end
