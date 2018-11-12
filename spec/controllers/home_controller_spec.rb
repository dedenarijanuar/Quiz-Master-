require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  def log_in(user)
	post login_path, params: {session: {email: user.email, password: 'test'} }
  end

  before(:each) do
  	Question.delete_all
  	User.create({email: "test@gmail.com", password: 'test', password_confirmation: 'test'})
    @user = User.first

    questions = [
      {content: "10 x 10 = ?", answer: 100}
    ]

    Question.create(questions)
    @questions = Question.all

  end

  describe "GET #index" do
    it "show all question after login" do
      get :index
      user = User.first
      question = @questions.first

      expect(user.email).to eq "test@gmail.com"
      expect(question.content).to eq "10 x 10 = ?"
    end

    it "post answers" do
      get :index
      user = User.first
      question = Question.first
      expect(question.answer).to eq "100"

    end


  end

end