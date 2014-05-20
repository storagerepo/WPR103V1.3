/***************************************************************************

 * Product Name				: AJ MATRIX DNA

 * Version 				: V 3.1

 * Release Date				: Saturday, October 31, 2009

 * Copyright				: (C) 2009 AJ Square Inc

 * Email				: info@ajsquare.com

 * Company URL				: www.ajsquare.com

 ***************************************************************************/

/****************************************************************************
* Licence Agreement: 

 *     This program is a Commercial licensed software. You are not authorized to redistribute it and/or modify/and or sell it under any publication either user and enterprise versions of the License (or) any later version is applicable for the same. If you have received this software without a license, you must not use it, and you must destroy your copy of it immediately. If anybody illegally uses this software, please contact info@ajsquare.com.

*****************************************************************************/

function saveContent() {
	tinyMCE.setContent(document.getElementById('htmlSource').value);
	tinyMCE.closeWindow(window);
}

function onLoadInit() {
	tinyMCEPopup.resizeToInnerSize();

	// Remove Gecko spellchecking
	if (tinyMCE.isGecko)
		document.body.spellcheck = tinyMCE.getParam("gecko_spellcheck");

	document.getElementById('htmlSource').value = tinyMCE.getContent(tinyMCE.getWindowArg('editor_id'));

	resizeInputs();

	if (tinyMCE.getParam("theme_advanced_source_editor_wrap", true)) {
		setWrap('soft');
		document.getElementById('wraped').checked = true;
	}
}

function setWrap(val) {
	var s = document.getElementById('htmlSource');

	s.wrap = val;

	if (tinyMCE.isGecko || tinyMCE.isOpera) {
		var v = s.value;
		var n = s.cloneNode(false);
		n.setAttribute("wrap", val);
		s.parentNode.replaceChild(n, s);
		n.value = v;
	}
}

function toggleWordWrap(elm) {
	if (elm.checked)
		setWrap('soft');
	else
		setWrap('off');
}

var wHeight=0, wWidth=0, owHeight=0, owWidth=0;

function resizeInputs() {
	var el = document.getElementById('htmlSource');

	if (!tinyMCE.isMSIE) {
		 wHeight = self.innerHeight - 60;
		 wWidth = self.innerWidth - 16;
	} else {
		 wHeight = document.body.clientHeight - 60;
		 wWidth = document.body.clientWidth - 16;
	}

	el.style.height = Math.abs(wHeight) + 'px';
	el.style.width  = Math.abs(wWidth) + 'px';
}
