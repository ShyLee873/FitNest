require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    user1 = create :user
    user2 = create :user
    @users = [user1, user2]
    enable_pundit(view, @users)
    render
  end

  it "renders a list of users" do
    assert_select "tr>th", text: "Name".to_s, count: 1
    assert_select "tr>th", text: "Profile".to_s, count: 1
    assert_select "tr>th", text: "Email".to_s, count: 1
    assert_select "tr>th", text: "Actions".to_s, count: 1
  end

  it "renders without error" do
    expect { render }.to_not raise_error
  end

  it "has title Users" do
    expect(rendered).to have_text "Users"
    expect(rendered).to have_text "Profile"
    expect(rendered).to have_text "Name"
    expect(rendered).to have_text "Phone"
    expect(rendered).to have_text "Actions"
  end

  it "has Show, Edit, Destroy, New Post links" do
    expect(rendered).to have_link("Show")
    expect(rendered).to have_link("Edit")
    expect(rendered).to have_button("Destroy")

    assert_select "input[type=?]", "submit"
    assert_select "input[value=?]", "Destroy"
  end

end