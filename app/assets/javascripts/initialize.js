$(document).ready(function() {

  new AnswersController(new AnswersView()).init();
  new QuestionCommentsController(new QuestionCommentsView()).init();
  new AnswerCommentsController(new AnswerCommentsView()).init();
  new QuestionVotesController(new QuestionVotesView()).init();
  new AnswerVotesController(new AnswerVotesView()).init();
})