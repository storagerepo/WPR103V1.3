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
	var html = document.getElementById("frmData").contentWindow.document.body.innerHTML;

	if (html == ''){
		tinyMCEPopup.close();
		return false;
	}

	tinyMCEPopup.execCommand('mcePasteWord', false, html);
	tinyMCEPopup.close();
}

function onLoadInit() {
	tinyMCEPopup.resizeToInnerSize();

	// Fix for endless reloading in FF
	window.setTimeout('createIFrame();', 10);
}

function createIFrame() {
	document.getElementById('iframecontainer').innerHTML = '<iframe id="frmData" name="frmData" class="sourceIframe" src="blank.htm" height="280" width="400" frameborder="0" style="background-color:#FFFFFF; width:100%;" dir="ltr" wrap="soft"></iframe>';
}

var wHeight=0, wWidth=0, owHeight=0, owWidth=0;

function initIframe(doc) {
	var dir = tinyMCE.selectedInstance.settings['directionality'];

	doc.body.dir = dir;

	// Remove Gecko spellchecking
	if (tinyMCE.isGecko)
		doc.body.spellcheck = tinyMCE.getParam("gecko_spellcheck");

	resizeInputs();
}

function resizeInputs() {
	if (!tinyMCE.isMSIE) {
		wHeight = self.innerHeight - 80;
		wWidth = self.innerWidth - 18;
	} else {
		wHeight = document.body.clientHeight - 80;
		wWidth = document.body.clientWidth - 18;
	}

	var elm = document.getElementById('frmData');
	if (elm) {
		elm.style.height = Math.abs(wHeight) + 'px';
		elm.style.width  = Math.abs(wWidth) + 'px';
	}
}
