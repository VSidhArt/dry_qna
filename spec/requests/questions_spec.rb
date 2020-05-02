require "web_helper"

RSpec.describe "/questions" do
  context "POST /" do
    context "with valid input" do
      let(:input) do
        {
          title: "Title",
          description: "Desc",
        }
      end

      it "succeeds" do
        post_json "/questions", input
        expect(last_response.status).to eq(200)
        question = parsed_body
        expect(question["id"]).not_to be_nil
        expect(question["title"]).to eq("Title")
        expect(question["description"]).to eq("Desc")
      end
    end

    context "with invalid input" do
      let(:input) do
        {
          title: "Title"
        }
      end

      it "returns an error" do
        post_json "/questions", input
        expect(last_response.status).to eq(422)
        question = parsed_body
        expect(question["errors"]["description"]).to include("is missing")
      end
    end
  end
end
