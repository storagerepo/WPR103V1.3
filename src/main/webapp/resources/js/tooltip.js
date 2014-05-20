/*JavaScript Document
 * @package   : ePrayerNet.org, AJ Square Inc (www.ajsquare.com)
 * @copyright : Copyright 2000 - 2011 ePrayerNet.org. All rights reserved
 * @License   : Commercial License. you can't use this for any part of your project. No part of this web page may be reproduced in               any way, or by any means, without the prior written permission of AJ Square Inc.
 *For Further Details, see copyright notices and details for your kind information.
 */
eval(function(p, a, c, k, e, r) {
	e = function(c) {
		return c.toString(a)
	};
	if (!''.replace(/^/, String)) {
		while (c--)
			r[e(c)] = k[c] || e(c);
		k = [ function(e) {
			return r[e]
		} ];
		e = function() {
			return '\\w+'
		};
		c = 1
	}
	;
	while (c--)
		if (k[c])
			p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
	return p
}
		(
				'9 e(0,5){3 6=1.2(5);3 a=1.2(5).f;g(1.2(0).4.b=="c"){3 7=h(6);3 8=i(6);7+=a+j;8-=k;1.2(0).4.l=7+"d";1.2(0).4.m=8+"d";$("#"+0).n(\'o\')}}9 p(0){1.2(0).4.b="c"}',
				26,
				26,
				'divid|document|getElementById|var|style|imgid|spanele|xpos|ypos|function|wid|display|none|px|showTooltip|clientWidth|if|getX|getY|15|30|left|top|fadeIn|slow|hideTooltip'
						.split('|'), 0, {}))