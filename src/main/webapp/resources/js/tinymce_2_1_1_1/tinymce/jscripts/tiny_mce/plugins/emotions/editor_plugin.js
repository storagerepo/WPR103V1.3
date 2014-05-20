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

tinyMCE.importPluginLanguagePack('emotions');var TinyMCE_EmotionsPlugin={getInfo:function(){return{longname:'Emotions',author:'Moxiecode Systems AB',authorurl:'http://tinymce.moxiecode.com',infourl:'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions',version:tinyMCE.majorVersion+"."+tinyMCE.minorVersion}},getControlHTML:function(cn){switch(cn){case"emotions":return tinyMCE.getButtonHTML(cn,'lang_emotions_desc','{$pluginurl}/images/emotions.gif','mceEmotion')}return""},execCommand:function(editor_id,element,command,user_interface,value){switch(command){case"mceEmotion":var template=new Array();template['file']='../../plugins/emotions/emotions.htm';template['width']=250;template['height']=160;template['width']+=tinyMCE.getLang('lang_emotions_delta_width',0);template['height']+=tinyMCE.getLang('lang_emotions_delta_height',0);tinyMCE.openWindow(template,{editor_id:editor_id,inline:"yes"});return true}return false}};tinyMCE.addPlugin('emotions',TinyMCE_EmotionsPlugin);