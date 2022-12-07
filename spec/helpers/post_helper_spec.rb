require "rails_helper"

RSpec.describe PostsHelper, type: :helper do
  describe "#parse_content_at_mentions" do
    before do
      FactoryBot.create(:user, username: "test")
    end

    it "it parses the mentions correctly" do
      expect(helper.parse_content_at_mentions("I mention @test in this post")).to eq("I mention <a style=\"text-decoration: underline; color: hsl(var(--p));\" href=\"/users.#{User.last.id}\">@test</a> in this post")
    end
  end
end