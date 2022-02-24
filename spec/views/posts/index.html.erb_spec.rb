require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @user = create :user
    post1 = create :post, user_id: @user.id
    post2 = create :post, user_id: @user.id
    @posts = @user.posts
    render
  end

  it "renders a list of posts" do
    assert_select "tr>th", text: "Title".to_s, count: 1
    assert_select "tr>th", text: "Content".to_s, count: 1
    assert_select "tr>th", text: "User".to_s, count: 1
    assert_select "tr>th", text: nil.to_s, count: 1
  end

  it "has title Posts" do
    expect(rendered).to have_text "Posts"
  end
  it "has Show, Edit, Destroy, New Post links" do
    expect(rendered).to have_link("Show")
    expect(rendered).to have_link("Edit")
    expect(rendered).to have_link("Destroy")
    expect(rendered).to have_link("New Post")
  end
end
