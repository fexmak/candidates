//encuentra el valor de la barra de progreso
$(document).ready(function () {

	var PROGRESS_PERCENTAGE = Object.freeze({
		progress: {
			'newCandidate': {
				percentage: '0%',
				color: 'progress-bar-striped active progress-bar-default'
			},
			'firstCall': {
				percentage: '20%',
				color: 'progress-bar-striped active progress-bar-info'
			},
			'firstInterview': {
				percentage: '40%',
				color: 'progress-bar-striped active progress-bar-info'
			},
			'techInterview': {
				percentage: '60%',
				color: 'progress-bar-striped active progress-bar-info'
			},
			'healthTests': {
				percentage: '80%',
				color: 'progress-bar-striped active progress-bar-info'
			},
			'hired': {
				percentage: '100%',
				color: 'progress-bar-success'
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
		$('#statusBar').css('width', value).attr('class', 'progress-bar ' + color);
	}
	
	$('.toggle-description').click(function (e) {
		e.stopPropagation();
		var target = $(e.target);
		if(target.parent().is('button'))
			target = target.parent();
		var jQSelector = '#' + target.prev().html() + 'Desc';
		var targetDesc = $(jQSelector);
		var hidden = false;
		if(targetDesc.css('display') == 'none')
			hidden = true;
		$('.descTextarea').hide();
		if(hidden) targetDesc.show();
	});

	$(':checkbox').change(function () {
		var thisCheckbox = $(this);
		var nextCheckbox = thisCheckbox.parent().parent().next().children('.checkbox').children(':checkbox').first();

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
