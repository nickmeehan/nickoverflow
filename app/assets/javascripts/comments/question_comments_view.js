function QuestionCommentsView() {
  this.containerSelector = '.container';
  this.openingDataKeySelector = '[data-question=';
  this.closingDataKeySelector = ']';
  this.commentSelector = '.question_holder form.new_comment';
  this.commentTextArea = 'textarea';
  this.commentIdSelector = '#comment';
  this.linkSelector = 'a';
  this.commentsHolderSelector = '.question_comments_holder';
  this.commentsErrorsSelector = '.new_question_comment_errors';
}

QuestionCommentsView.prototype = CommentsView.prototype;