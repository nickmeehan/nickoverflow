function QuestionCommentsView() {
  this.commentSelector = '.question_holder form#new_comment';
  this.commentsHolderSelector = '.question_comments_holder';
  this.commentsErrorsSelector = '.new_question_comment_errors'
}

QuestionCommentsView.prototype = {
  getCommentSelector: function() {
    return $(this.commentSelector);
  },
  getCommentsHolder: function() {
    return $(this.commentsHolderSelector)
  },
  appendNewComment: function(event, data) {
    var commentsHolder = this.view.getCommentsHolder();
    commentsHolder.append(data)
  },
  getNewCommentErrorsSelector: function() {
    return $(this.commentsErrorsSelector)
  },
  appendNewCommentErrors: function(event, data) {
    console.log(event);
    console.log(data.responseText);
  }
}