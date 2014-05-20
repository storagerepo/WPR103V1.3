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

/* Import plugin specific language pack */
tinyMCE.importPluginLanguagePack('nonbreaking');

var TinyMCE_NonBreakingPlugin = {
	getInfo : function() {
		return {
			longname : 'Nonbreaking space',
			author : 'Moxiecode Systems AB',
			authorurl : 'http://tinymce.moxiecode.com',
			infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/nonbreaking',
			version : tinyMCE.majorVersion + "." + tinyMCE.minorVersion
		};
	},

	getControlHTML : function(cn) {
		switch (cn) {
			case "nonbreaking":
				return tinyMCE.getButtonHTML(cn, 'lang_nonbreaking_desc', '{$pluginurl}/images/nonbreaking.gif', 'mceNonBreaking', false);
		}

		return "";
	},


	execCommand : function(editor_id, element, command, user_interface, value) {
		var inst = tinyMCE.getInstanceById(editor_id), h;

		switch (command) {
			case "mceNonBreaking":
				h = (inst.visualChars && inst.visualChars.state) ? '<span class="mceItemHiddenVisualChar">&middot;</span>' : '&nbsp;';
				tinyMCE.execInstanceCommand(editor_id, 'mceInsertContent', false, h);
				return true;
		}

		return false;
	},

	handleEvent : function(e) {
		var inst, h;

		if (!tinyMCE.isOpera && e.type == 'keydown' && e.keyCode == 9 && tinyMCE.getParam('nonbreaking_force_tab', false)) {
			inst = tinyMCE.selectedInstance;

			h = (inst.visualChars && inst.visualChars.state) ? '<span class="mceItemHiddenVisualChar">&middot;&middot;&middot;</span>' : '&nbsp;&nbsp;&nbsp;';
			tinyMCE.execInstanceCommand(inst.editorId, 'mceInsertContent', false, h);

			tinyMCE.cancelEvent(e);
			return false;
		}

		return true;
	}
};

tinyMCE.addPlugin("nonbreaking", TinyMCE_NonBreakingPlugin);
