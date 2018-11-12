require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
  	subject.email = "#{rand(10)}@gmail.com"
  	subject.password = 'test'
    subject.password_confirmation = 'test'
    subject.save
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
  	subject.password = "test"
    subject.save
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
  	subject.email = "test@gmail.com"
    subject.save
    expect(subject).to_not be_valid
  end

  it "is not valid " do
    subject.save
    expect(subject).to_not be_valid
  end
end