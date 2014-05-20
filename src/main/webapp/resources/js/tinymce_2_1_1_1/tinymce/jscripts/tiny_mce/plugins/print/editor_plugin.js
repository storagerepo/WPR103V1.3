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

tinyMCE.importPluginLanguagePack('print');var TinyMCE_PrintPlugin={getInfo:function(){return{longname:'Print',author:'Moxiecode Systems AB',authorurl:'http://tinymce.moxiecode.com',infourl:'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/print',version:tinyMCE.majorVersion+"."+tinyMCE.minorVersion}},getControlHTML:function(cn){switch(cn){case"print":return tinyMCE.getButtonHTML(cn,'lang_print_desc','{$pluginurl}/images/print.gif','mcePrint')}return""},execCommand:function(editor_id,element,command,user_interface,value){switch(command){case"mcePrint":tinyMCE.getInstanceById(editor_id).contentWindow.print();return true}return false}};tinyMCE.addPlugin("print",TinyMCE_PrintPlugin);