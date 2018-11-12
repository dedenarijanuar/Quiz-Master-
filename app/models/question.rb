class Question
  include Mongoid::Document
  field :content, type: String
  field :answer, type: String
  field :correct_answer, type: Integer
  field :wrong_answer, type: Integer
  validates :content, :answer, presence: true

  def correct_answer_text
  	"#{self.correct_answer} Users" if correct_answer
  end

   def wrong_answer_text
  	"#{self.wrong_answer} Users" if wrong_answer
  end
end
