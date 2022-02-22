require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = create :user
    enable_pundit(view, @user)
    render
  end


  it "renders without error" do
    expect { render }.to_not raise_error
  end

  it "has title titles About Me, Latest Posts, Get connected! Join a group, Group " do
    
    expect(rendered).to have_text "About Me"
    expect(rendered).to have_text "Latest Posts"
    expect(rendered).to have_text "Get connected! Join a group"
    expect(rendered).to have_text "Group"
  end


  it "has Back, Edit Profile, New Post links, join button" do
    expect(rendered).to have_link("New Post")
    expect(rendered).to have_link("Edit Profile")
    expect(rendered).to have_link("Back")
    assert_select "input[type=?]", "submit"
    assert_select "input[value=?]", "join"
  end



end