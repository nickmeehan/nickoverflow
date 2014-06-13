function AnswerVotesController(view) {
	this.view = view;
}

AnswerVotesController.prototype = {
	init: function() {
		this.bindListeners();
	},
	bindListeners: function() {
		var $answerVotesSelector = this.view.getVoteSelector();
		$answerVotesSelector.on('ajax:success', this.view.updateVoteCount.bind(this.view))
	},
	show: function(a, b, c) {
		console.log(a)
		console.log(b)
		console.log(c)		
	}
}