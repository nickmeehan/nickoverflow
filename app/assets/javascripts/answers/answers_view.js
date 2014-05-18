function AnswersView() {
  this.addAnswerSelector = ".new_answer";
  this.answerFeed = ".answer_feed"
}

AnswersView.prototype = {
  getAddAnswer: function() {
    return $(this.addAnswerSelector)
  },
  getAnswerFeed: function() {
    return this.answerFeed
  },
  appendNewAnswerForm: function(a, b, c, d) {
    console.log(a)
    console.log(b)
    console.log(c)
    console.log(d)
  }
}