require 'rails_helper'
RSpec.describe Group, type: :model do
    group = Group.new
  
  it "is not valid without a name" do
    group.name = nil
    expect(group).to_not be_valid
  end

  it "is not valid without a activity_type" do
    group.activity_type = nil
    expect(group).to_not be_valid
  end

  it "is not valid without a about_us" do
    group.about_us = nil
    expect(group).to_not be_valid
  end

 

  


    # subject { Group.new( name: "Rise and Climb", activity_type: "rock climbing", senior: true )}
    # it "is valid with valid attributes" do
    #     expect(subject).to be_valid
    # end
    # it "is not valid without a group name" do
    #     subject.name=nil 
    #     expect(subject).to_not be_valid
    # end
    # it "is not valid without a group activity_type" do
    #     subject.activity_type=nil
    #     expect(subject).to_not be_valid
    # end
    # it "is not valid without a selected 'senior' attribute" do
    #     subject.senior=nil 
    #     expect(subject).to_not be_valid
    # end


end

RSpec.describe Group, type: :model do
       
    it "is valid with valid attributes" do
        group = Group.new
        group.name = "Anything"
        group.about_us = "Anything"
        group.activity_type = "Something"
        group.senior = true
        group.gym_required = false
        expect(group).to be_valid
     end

 end