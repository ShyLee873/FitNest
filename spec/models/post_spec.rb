require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new 
  post = user.posts.new(title: "Nick", content: "Miller")
  it "is valid with valid attributes" do
  
    post.title = "Anything"
    post.content = "Anything"
    expect(post).to be_valid
  end

  it "is not valid without a title" do
      subject.title=nil
      expect(subject).to_not be_valid
  end
  it "is not valid without a content" do
      subject.content=nil 
      expect(subject).to_not be_valid
  end
  
  
end
