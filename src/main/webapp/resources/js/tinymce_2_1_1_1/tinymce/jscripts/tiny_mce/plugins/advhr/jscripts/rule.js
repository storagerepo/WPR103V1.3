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

function init() {
	tinyMCEPopup.resizeToInnerSize();

	var formObj = document.forms[0];
	formObj.width.value  = tinyMCE.getWindowArg('width');
	formObj.size.value   = tinyMCE.getWindowArg('size');
	formObj.insert.value = tinyMCE.getLang('lang_' + tinyMCE.getWindowArg('mceDo'),'Insert',true);
	if (tinyMCE.getWindowArg('noshade')) {
		formObj.noshade.checked = true;
	}
	if (tinyMCE.getWindowArg('width').lastIndexOf('%')!=-1) {
		formObj.width2.value = "%";
		formObj.width.value  = formObj.width.value.substring(0,formObj.width.value.length-1);
	}
}

function insertHR() {
	var formObj = document.forms[0];
	var width   = formObj.width.value;
	var size    = formObj.size.value;
	var html = '<hr';
	if (size!='' && size!=0) {
		html += ' size="' + size + '"';
	}
	if (width!='' && width!=0) {
		html += ' width="' + width;
		if (formObj.width2.value=='%') {
			html += '%';
		}
		html += '"';
	}
	if (formObj.noshade.checked==true) {
		html += ' noshade="noshade"';
	}
	html += ' />';

	tinyMCEPopup.execCommand("mceInsertContent", true, html);
	tinyMCEPopup.close();
}

function cancelAction() {
	tinyMCEPopup.close();
}
