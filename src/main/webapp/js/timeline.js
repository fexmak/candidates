//encuentra el valor de la barra de progreso
$(document).ready(function () {

	var PROGRESS_PERCENTAGE = Object.freeze({
		progress: {
			'newCandidate': {
				percentage: '0%',
				color: 'progress-bar progress-bar-default'
			},
			'firstCall': {
				percentage: '20%',
				color: 'progress-bar progress-bar-info'
			},
			'firstInterview': {
				percentage: '40%',
				color: 'progress-bar progress-bar-info'
			},
			'techInterview': {
				percentage: '60%',
				color: 'progress-bar progress-bar-info'
			},
			'healthTests': {
				percentage: '80%',
				color: 'progress-bar progress-bar-info'
			},
			'hired': {
				percentage: '100%',
				color: 'progress-bar progress-bar-success'
			}
		}
	});

	function enable(checkbox) {
		console.log("enabling")
		if (!checkbox.is(':checked')) {
			if (checkbox.is(':disabled')) {
				checkbox.removeAttr('disabled');
			}
		}
		console.log(checkbox);
	}

	function disable(checkbox) {
		console.log("disabling");
		if (!checkbox.is(':disabled')) {
			checkbox.prop('disabled', true);
		}
		console.log(checkbox);
	}

	function uncheck(checkbox) {
		console.log("unchecking")
		if (checkbox.is(':checked'))
			checkbox.removeAttr('checked');
		console.log(checkbox);
	}

	function updateProgress(value, color) {
		$('#statusBar').css('width', value).attr('class', color);
	}

	$(':checkbox').change(function () {
		var thisCheckbox = $(this);
		var nextCheckbox = thisCheckbox.parent().next().children().first();

		if (nextCheckbox.prop('class') === "progressCheckbox") {
			if (thisCheckbox.is(':checked')) {
				enable(nextCheckbox);
				disable(thisCheckbox);
			} else {
				disable(nextCheckbox);
				uncheck(nextCheckbox);
			}
		} else {
			disable(thisCheckbox);
		}

		if (thisCheckbox.is(':checked')) {
			var progressInfo = PROGRESS_PERCENTAGE.progress[thisCheckbox.prop('id')];
			updateProgress(progressInfo.percentage, progressInfo.color);
		}
	});

	$(':checkbox').not(":last").trigger('change');
});
