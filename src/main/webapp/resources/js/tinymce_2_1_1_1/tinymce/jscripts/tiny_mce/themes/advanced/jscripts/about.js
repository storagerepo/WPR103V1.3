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
	var inst;

	tinyMCEPopup.resizeToInnerSize();
	inst = tinyMCE.selectedInstance;

	// Give FF some time
	window.setTimeout('insertHelpIFrame();', 10);

	var tcont = document.getElementById('plugintablecontainer');
	var plugins = tinyMCE.getParam('plugins', '', true, ',');
	if (plugins.length == 0)
		document.getElementById('plugins_tab').style.display = 'none';

	var html = "";
	html += '<table id="plugintable">';
	html += '<thead>';
	html += '<tr>';
	html += '<td>' + tinyMCE.getLang('lang_plugin') + '</td>';
	html += '<td>' + tinyMCE.getLang('lang_author') + '</td>';
	html += '<td>' + tinyMCE.getLang('lang_version') + '</td>';
	html += '</tr>';
	html += '</thead>';
	html += '<tbody>';

	for (var i=0; i<inst.plugins.length; i++) {
		var info = getPluginInfo(inst.plugins[i]);

		html += '<tr>';

		if (info.infourl != null && info.infourl != '')
			html += '<td width="50%" title="' + plugins[i] + '"><a href="' + info.infourl + '" target="mceplugin">' + info.longname + '</a></td>';
		else
			html += '<td width="50%" title="' + plugins[i] + '">' + info.longname + '</td>';

		if (info.authorurl != null && info.authorurl != '')
			html += '<td width="35%"><a href="' + info.authorurl + '" target="mceplugin">' + info.author + '</a></td>';
		else
			html += '<td width="35%">' + info.author + '</td>';

		html += '<td width="15%">' + info.version + '</td>';
		html += '</tr>';
	}

	html += '</tbody>';
	html += '</table>';

	tcont.innerHTML = html;
}

function getPluginInfo(name) {
	if (tinyMCE.plugins[name].getInfo)
		return tinyMCE.plugins[name].getInfo();

	return {
		longname : name,
		authorurl : '',
		infourl : '',
		author : '--',
		version : '--'
	};
}

function insertHelpIFrame() {
	var html = '<iframe width="100%" height="300" src="' + tinyMCE.themeURL + "/docs/" + tinyMCE.settings['docs_language'] + "/index.htm" + '"></iframe>';

	document.getElementById('iframecontainer').innerHTML = html;

	html = '';
	html += '<a href="http://www.moxiecode.com" target="_blank"><img src="http://tinymce.moxiecode.com/images/gotmoxie.png" alt="Got Moxie?" border="0" /></a> ';
	html += '<a href="http://sourceforge.net/projects/tinymce/" target="_blank"><img src="http://sourceforge.net/sflogo.php?group_id=103281" alt="Hosted By Sourceforge" border="0" /></a> ';
	html += '<a href="http://www.freshmeat.net/projects/tinymce" target="_blank"><img src="http://tinymce.moxiecode.com/images/fm.gif" alt="Also on freshmeat" border="0" /></a> ';

	document.getElementById('buttoncontainer').innerHTML = html;
}
