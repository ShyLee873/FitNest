require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  before(:each) do
    # byebug
    @user = create :user
    @group = create :group
    # enable_pundit(view, @user)
    render
  end


  it "renders without error" do
    expect { render }.to_not raise_error
  end

  it "has title Groups" do
    
    expect(rendered).to have_text "Members"
    expect(rendered).to have_text "Past events"
    expect(rendered).to have_text "Create event"
    expect(rendered).to have_text "All current and upcoming events"
  end

   it "has Show, Edit, Destroy, New Post links" do
    expect(rendered).to have_link("Destroy")
    expect(rendered).to have_link("Edit")
    expect(rendered).to have_link("Back")
    expect(rendered).to have_link("Past events")
    expect(rendered).to have_link("Create event")
    expect(rendered).to have_link("All current and upcoming events")

   end

end