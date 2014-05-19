function AnswerCommentsView() {
  this.containerSelector = '.container';
  this.openingDataKeySelector = '[data-answer=';
  this.closingDataKeySelector = ']';
  this.commentSelector = '.answer_holder form.new_comment';
  this.commentTextArea = 'textarea';
  this.commentIdSelector = '#comment';
  this.linkSelector = 'a';
  this.commentsHolderSelector = '.answer_comments_holder';
  this.commentsErrorSelector = '.new_answer_comment_errors';
}

AnswerCommentsView.prototype = CommentsView.prototype;