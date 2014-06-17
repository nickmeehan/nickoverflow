function QuestionVotesController(view) {
	this.view = view;
}

QuestionVotesController.prototype = {
	init: function() {
		this.bindListeners();
	},
	bindListeners: function() {
		var $container = ContainerSelector.retrieve();
		$container.on('ajax:success', this.view.voteSelector,this.view.updateVoteCount.bind(this.view))
	}
}