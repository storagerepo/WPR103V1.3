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
	if (document.forms[0].htmlSource.value == '') {
		tinyMCEPopup.close();
		return false;
	}

	tinyMCEPopup.execCommand('mcePasteText', false, {
		html : document.forms[0].htmlSource.value,
		linebreaks : document.forms[0].linebreaks.checked
	});

	tinyMCEPopup.close();
}

function onLoadInit() {
	tinyMCEPopup.resizeToInnerSize();

	// Remove Gecko spellchecking
	if (tinyMCE.isGecko)
		document.body.spellcheck = tinyMCE.getParam("gecko_spellcheck");

	resizeInputs();
}

var wHeight=0, wWidth=0, owHeight=0, owWidth=0;

function resizeInputs() {
	if (!tinyMCE.isMSIE) {
		wHeight = self.innerHeight-80;
		wWidth = self.innerWidth-17;
	} else {
		wHeight = document.body.clientHeight-80;
		wWidth = document.body.clientWidth-17;
	}

	document.forms[0].htmlSource.style.height = Math.abs(wHeight) + 'px';
	document.forms[0].htmlSource.style.width  = Math.abs(wWidth) + 'px';
}
