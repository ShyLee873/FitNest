require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  
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

  it "has some title" do
    expect(rendered).to have_text "New Group"
    expect(rendered).to have_text "Create"
    expect(rendered).to have_text "Back"
    expect(rendered).to have_text "Senior?"
    expect(rendered).to have_text "Group name"
  end

  it 'has input with placeholder' do
    assert_select "input[placeholder=?]", "Enter a new group name"
    assert_select "input[placeholder=?]", "What type of activity?"
    assert_select "textarea[placeholder=?]", "Tell us a little about your group"
  end

end