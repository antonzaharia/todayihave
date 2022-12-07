require "rails_helper"

# Specs in this file have access to a helper object that includes
# the TagsHelper. For example:
#
# describe TagsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
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
end
