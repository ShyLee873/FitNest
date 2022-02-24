require 'rails_helper'
RSpec.describe User, type: :model do
    subject { User.new(first_name: "Nick", last_name: "Miller", phone: 8887774561, email: "nickmiller@sample.com")}
  
    it "is not valid without a first name" do
        subject.first_name=nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a last name" do
        subject.last_name=nil 
        expect(subject).to_not be_valid
    end
    it "is not valid without a phone number" do
        subject.phone=nil 
        expect(subject).to_not be_valid
    end
    it "is not valid without an email" do
        subject.email=nil 
        expect(subject).to_not be_valid
    end
    it "is not valid if the phone number is not 10 characters" do
        subject.phone = "888777452" 
        expect(subject).to_not be_valid
    end
    it "is not valid if the phone number is not all integers" do
        phone = subject.phone.to_s.chars 
        array = phone.map(&:to_i)
        expect(array).to all (be_an(Integer))
    end
    it "is not valid if the email address doesn't have a @ character" do
        email = subject.email.chars
        expect(email).to include('@')
    end
    it "returns the correct full_name" do
        expect(subject.full_name).to eq("Nick Miller")
    end
end