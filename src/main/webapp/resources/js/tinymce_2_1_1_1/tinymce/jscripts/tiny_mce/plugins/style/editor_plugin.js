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

tinyMCE.importPluginLanguagePack('style');var TinyMCE_StylePlugin={getInfo:function(){return{longname:'Style',author:'Moxiecode Systems AB',authorurl:'http://tinymce.moxiecode.com',infourl:'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/style',version:tinyMCE.majorVersion+"."+tinyMCE.minorVersion}},getControlHTML:function(cn){switch(cn){case"styleprops":return tinyMCE.getButtonHTML(cn,'lang_style_styleinfo_desc','{$pluginurl}/images/styleprops.gif','mceStyleProps',true)}return""},execCommand:function(editor_id,element,command,user_interface,value){var e,inst;switch(command){case"mceStyleProps":TinyMCE_StylePlugin._styleProps();return true;case"mceSetElementStyle":inst=tinyMCE.getInstanceById(editor_id);e=inst.selection.getFocusElement();if(e){e.style.cssText=value;inst.repaint()}return true}return false},handleNodeChange:function(editor_id,node,undo_index,undo_levels,visual_aid,any_selection){if(node.nodeName=='BODY')tinyMCE.switchClass(editor_id+'_styleprops','mceButtonDisabled');else tinyMCE.switchClass(editor_id+'_styleprops','mceButtonNormal')},_styleProps:function(){var e=tinyMCE.selectedInstance.selection.getFocusElement();if(!e||e.nodeName=='BODY')return;tinyMCE.openWindow({file:'../../plugins/style/props.htm',width:480+tinyMCE.getLang('lang_style_props_delta_width',0),height:320+tinyMCE.getLang('lang_style_props_delta_height',0)},{editor_id:tinyMCE.selectedInstance.editorId,inline:"yes",style_text:e.style.cssText})}};tinyMCE.addPlugin("style",TinyMCE_StylePlugin);