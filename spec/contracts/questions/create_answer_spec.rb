require 'spec_helper'

RSpec.describe DryQna::Contracts::Questions::CreateAnswer do
  context "given valid parameters" do
    let(:input) do
      {
        text: "Title",
      }
    end

    let(:result) { subject.call(input) }

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "requires text" do
    let(:input) do
      {
        text: "",
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:text]).to include("must be filled")
    end
  end

  context "max 100 chars" do
    let(:input) do
      {
        text: str = '%0301d' % 0,
      }
    end

    let(:result) { subject.call(input) }

    it "is invalid" do
      expect(result).to be_failure
      expect(result.errors[:text]).to include("size cannot be greater than 300")
    end
  end
end
