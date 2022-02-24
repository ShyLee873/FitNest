require 'rails_helper'

RSpec.describe "users/new", type: :view do
  
  before(:each) do
    @user = create :user
    enable_pundit(view, @user)
    render
  end

  it "renders without error" do
    expect { render }.to_not raise_error
  end

  it "has some titles" do
    expect(rendered).to have_text "Welcome to Fitnest!"
    expect(rendered).to have_text "First name *"
    expect(rendered).to have_text "Last name *"
    expect(rendered).to have_text "Email *"
    expect(rendered).to have_text "Phone *"
  end

  it 'has input with placeholder' do
    assert_select "input[placeholder=?]", "Enter your first name"
    assert_select "input[placeholder=?]", "Enter your last name"
    assert_select "input[placeholder=?]", "Enter your email"
    assert_select "input[placeholder=?]", "Enter your phone number"
    assert_select "textarea[placeholder=?]", "Tell us a little about yourself"
  end

  it "has first, last name, email, phone fields and Back link" do
    # expect(rendered).to have_link("Show")
    expect(rendered).to have_link("Back")
    expect(rendered).to have_field("Enter your phone number")
    expect(rendered).to have_field("Enter your email")
    expect(rendered).to have_field("Enter your last name")
    expect(rendered).to have_field("Enter your first name")
    assert_select "input[type=?]", "submit"
    assert_select "input[type=?]", "text"
  end

end

