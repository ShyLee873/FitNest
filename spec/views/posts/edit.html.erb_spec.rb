# require 'rails_helper'

# RSpec.describe "posts/edit", type: :view do

#   before(:each) do
#     @user = create :user
#     @post = create :post, postable_type = "User", postable_id= 1
#     render 
#   end

#   it "renders without error" do
#     expect { render }.to_not raise_error
#   end

#   it "renders the edit post form" do
#       assert_select "form[action=?][method=?]", post_path(@post), "post" do
#       assert_select "input[name=?]", "post[title]"
#       assert_select "textarea[name=?]", "post[content]"
#     end
#   end

#   it 'has input with placeholder' do
#     assert_select "input[placeholder=?]", "Enter title"
#   end

#   it 'has div tag' do
#     expect(rendered).to have_css 'div', count: 11
#   end

#   it "has titles 'Title' and 'Content'" do
#     expect(rendered).to have_text "Title"
#     expect(rendered).to have_text "Content"
#   end

# end
