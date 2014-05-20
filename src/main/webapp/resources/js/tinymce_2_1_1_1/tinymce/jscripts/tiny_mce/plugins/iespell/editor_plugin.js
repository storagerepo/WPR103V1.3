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

tinyMCE.importPluginLanguagePack('iespell');var TinyMCE_IESpellPlugin={getInfo:function(){return{longname:'IESpell (MSIE Only)',author:'Moxiecode Systems AB',authorurl:'http://tinymce.moxiecode.com',infourl:'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/iespell',version:tinyMCE.majorVersion+"."+tinyMCE.minorVersion}},getControlHTML:function(cn){if(cn=="iespell"&&(tinyMCE.isMSIE&&!tinyMCE.isOpera))return tinyMCE.getButtonHTML(cn,'lang_iespell_desc','{$pluginurl}/images/iespell.gif','mceIESpell');return""},execCommand:function(editor_id,element,command,user_interface,value){if(command=="mceIESpell"){try{var ieSpell=new ActiveXObject("ieSpell.ieSpellExtension");ieSpell.CheckDocumentNode(tinyMCE.getInstanceById(editor_id).contentDocument.documentElement)}catch(e){if(e.number==-2146827859){if(confirm(tinyMCE.getLang("lang_iespell_download","",true)))window.open('http://www.iespell.com/download.php','ieSpellDownload','')}else alert("Error Loading ieSpell: Exception "+e.number)}return true}return false}};tinyMCE.addPlugin("iespell",TinyMCE_IESpellPlugin);