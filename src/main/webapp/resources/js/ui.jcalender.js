/**
 * jCalendar 0.5
 *
 * Some code based on jQuery Date Picker (http://kelvinluck.com/assets/jquery/datePicker/)
 *
 * Copyright (c) 2007 Theodore Serbinski (http://tedserbinski.com)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 */
jQuery.jcalendar = function() {
	var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	var days = ['S', 'M', 'Tu', 'W', 'Th', 'F', 'S'];
	var navLinks = {p:'Prev', n:'Next', t:'Today'};
	var _firstDayOfWeek;
	var _firstDate;
	var _lastDate;
	var _selectedDate;

	var _drawCalendar = function(dateIn, a, day, month, year) {
	  var today = new Date();
	  var d;

		if (dateIn == undefined) {
			// start from this month.
			d = new Date(today.getFullYear(), today.getMonth(), 1);
			year.val(today.getFullYear());
			month.val(today.getMonth()+1);
			day.val(today.getDate());
		}
		else {
			// start from the passed in date
			d = dateIn;
		}
	}
}