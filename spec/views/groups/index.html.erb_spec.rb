require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    @user = create :user
    group1 = create :group
    group2 = create :group
    @groups = [group1, group2]
    enable_pundit(view, @user)
    render
  end

  it "renders a list of groups" do
    assert_select "tr>th", text: "Name".to_s, count: 1
    assert_select "tr>th", text: "Activity type".to_s, count: 1
    assert_select "tr>th", text: "Profile".to_s, count: 1
    assert_select "tr>th", text: "Senior".to_s, count: 1
    assert_select "tr>th", text: "Actions".to_s, count: 1
  end

  it "has title Groups" do
    expect(rendered).to have_text "Groups"
  end

  it "has Show, Edit, Destroy, New Post links" do
    expect(rendered).to have_link("Show")
    expect(rendered).to have_link("Edit")
    expect(rendered).to have_link("New Group")

    assert_select "input[type=?]", "submit"
    assert_select "input[value=?]", "Destroy"
  end

end