class HomeController < ApplicationController
	def index
		return redirect_to login_path unless current_user
		@questions = Question.all.sample(4)
	end

	def admin
		redirect_to questions_path
	end

	def process_question
		answers = params[:answers]
		correct = []
		wrong = []

		answers.each do |k, v|
			question = Question.find_by(_id: k)
			if question.answer == v || (question.answer.to_words == v rescue false)
				question.update_attributes(correct_answer: question.correct_answer.to_i + 1)
				correct << k
			else
				question.update_attributes(wrong_answer: question.wrong_answer.to_i + 1)
				wrong << k
			end
		end

		redirect_to result_path(correct_answer: correct.size, wrong_answer: wrong.size )

	end
end