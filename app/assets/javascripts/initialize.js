$(document).ready(function() {

  new AnswersController(new AnswersView()).init();
  new QuestionCommentsController(new QuestionCommentsView()).init();

})