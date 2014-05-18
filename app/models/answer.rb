class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :question
  validates :content, presence: true

  has_many :comments, as: :commentable

  def self.save_answer(params, user_id)
    begin
      answer = User.find(user_id).answers.create!(params[:answer])
      Question.find(params[:question_id]).answers << answer
    rescue StandardError => e
      e.message
    end
    e == nil ? true : clean_save_answer_errors(e.message)
  end

  private

  def self.clean_save_answer_errors(error_message)
    return error_message.split(": ").last
  end
end