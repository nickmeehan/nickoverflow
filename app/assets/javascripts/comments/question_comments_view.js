function QuestionCommentsView() {
  this.containerSelector = '.container';
  this.questionCommentSelector = '.question_holder form#new_comment';
  this.questionCommentsHolderSelector = '.question_comments_holder';
  this.questionCommentsErrorsSelector = '.new_question_comment_errors'
}

QuestionCommentsView.prototype = {
  getContainer: function() {
    return $(this.containerSelector);
  },
  getQuestionCommentSelector: function() {
    return $(this.questionCommentSelector);
  },
  getQuestionCommentsHolder: function() {
    return $(this.questionCommentsHolderSelector)
  },
  appendNewQuestionComment: function(event, data) {
    var questionCommentsHolder = this.view.getQuestionCommentsHolder();
    questionCommentsHolder.append(data)
  },
  getNewQuestionCommentErrorsSelector: function() {
    return $(this.questionCommentsErrorsSelector)
  },
  appendNewQuestionCommentErrors: function(event, data) {
    console.log(event);
    console.log(data);
  }
}