require 'rails_helper'

RSpec.describe Event, type: :model do
  group = Group.new
  event = group.events.new

  it "is not valid without a title" do
    event.title = nil
    expect(event).to_not be_valid
  end

  it "is not valid without a body" do
    event.body = nil
    expect(event).to_not be_valid
  end

  it "is not valid without a date" do
    event.date = nil
    expect(event).to_not be_valid
  end

  it "is not valid without a longitude" do
    event.longitude = nil
    expect(event).to_not be_valid
  end

  it "is not valid without a latitude" do
    event.latitude = nil
    expect(event).to_not be_valid
  end

end

RSpec.describe Event, type: :model do
  # event { described_class.new }
  it "is valid with valid attributes" do
    group = Group.new
    event = group.events.new
    event.title = "Anything"
    event.body = "Anything"
    event.date = DateTime.now
    event.longitude = 35.45
    event.latitude = -39.78
    expect(event).to be_valid
  end

end




