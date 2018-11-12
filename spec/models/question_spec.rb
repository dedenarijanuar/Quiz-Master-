require 'rails_helper'

RSpec.describe Question, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
  	subject.content = "5x5=?"
  	subject.answer = '25'
    subject.save
    expect(subject).to be_valid
  end

  it "is not valid without a answer" do
  	subject.content = "5x5=?"
    subject.save
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
  	subject.answer = '5'
    subject.save
    expect(subject).to_not be_valid
  end

  it "is not valid " do
    subject.save
    expect(subject).to_not be_valid
  end
end