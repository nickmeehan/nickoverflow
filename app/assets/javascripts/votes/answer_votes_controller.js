function AnswerVotesController(view) {
	this.view = view;
}

AnswerVotesController.prototype = {
	init: function() {
		this.bindListeners();
	},
	bindListeners: function() {
		$('.votes').on('ajax:success', this.show)
	},
	show: function(a, b, c) {
		console.log(a)
		console.log(b)
		console.log(c)		
	}
}