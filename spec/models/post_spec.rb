require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { FactoryBot.create(:post) }

  it 'should be valid with all attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without content' do
    post.content = nil
    expect(post).to_not be_valid
  end

  # it 'is not valid without tags' do
  #   post.tags = []
  #   expect(post).to_not be_valid
  #   expect(post.errors.full_messages.first).to eq("Tags can't be blank")
  # end

  it 'is not valid with duplicated title in the same day' do
    new_post = FactoryBot.build(:post, title: post.title)
    expect(new_post).to_not be_valid
  end
end
