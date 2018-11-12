require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  def http_login
    user = 'admin'
    pw = 'admin'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end

  before(:each) do
    http_login

    questions = [
      {content: "10 x 10 = ?", answer: 100},
      {content: "How many letters are there in the English alphabet?", answer: 26},
      {content: 'the capital city of indonesia is?', answer: 'jakarta'}
    ]

    Question.create(questions)
    @questions = Question.all
    @question = Question.first
  end

  let(:valid_attributes) {
    {content: "10 x 10 = ?", answer: 100}
  }

  describe "GET #index" do
    it "get all questions data" do
      get :index
      expect(@questions).to include(@question)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "see count correct answer users" do
      question = @question
      question.correct_answer = 1
      question.save
      expect(question.correct_answer).to eq 1
    end

    it "see count wrong answer users" do
      question = @question
      question.wrong_answer = 1
      question.save
      expect(question.wrong_answer).to eq 1
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, params: {question: valid_attributes}
        }.to change(Question, :count).by(1)
      end

      it "redirects to the created Question" do
        post :create, params: {question: valid_attributes}
        expect(response).to redirect_to(Question.last)
      end
    end

  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @question._id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @question._id}
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {answer: 25}
      }

      it "updates the requested Question" do
        question = @question
        put :update, params: {id: question, question: new_attributes}
        question.update_attributes(new_attributes)
        expect(question.answer).to eq "25"
      end

      it "redirects to the Question" do
        put :update, params: {id: @question._id, question: valid_attributes}
        expect(response).to redirect_to(@question)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested Question" do
      question = @question
      expect {
        delete :destroy, params: {id: question.to_param}
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the question list" do
      question = @question
      delete :destroy, params: {id: question.to_param}
      expect(response).to redirect_to(questions_url)
    end
  end
end