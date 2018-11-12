require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    users = [
      {email: "test@gmail.com", password: 'test', password_confirmation: 'test'},
      {email: "test2@gmail.com", password: 'test', password_confirmation: 'test'},
    ]

    User.create(users)
    @users = User.all
    @user = User.first
  end

  let(:valid_attributes) {
    {email: "test@gmail.com", password: 'test', password_confirmation: 'test'}
  }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "user valid signup" do
      user = @user
      post :create, params: {user: valid_attributes}
      expect(user.email).to eq "test@gmail.com"
    end

    it "user invalid signup" do
      user = @user
      user.email = nil
      post :create, params: {user: valid_attributes.delete_if{|k,v| k == 'email'.to_sym }.merge(email: 'test3@gmail.com')}
      expect(user.email).to be_nil
    end
  end

end
