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

var TinyMCE_BBCodePlugin={getInfo:function(){return{longname:'BBCode Plugin',author:'Moxiecode Systems AB',authorurl:'http://tinymce.moxiecode.com',infourl:'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/bbcode',version:tinyMCE.majorVersion+"."+tinyMCE.minorVersion}},cleanup:function(type,content){var dialect=tinyMCE.getParam('bbcode_dialect','punbb').toLowerCase();switch(type){case"insert_to_editor":content=this['_'+dialect+'_bbcode2html'](content);break;case"get_from_editor":content=this['_'+dialect+'_html2bbcode'](content);break}return content},_punbb_html2bbcode:function(s){s=tinyMCE.trim(s);function rep(re,str){s=s.replace(re,str)};rep(/<a href=\"(.*?)\".*?>(.*?)<\/a>/gi,"[url]$1[/url]");rep(/<font.*?color=\"(.*?)\".*?class=\"codeStyle\".*?>(.*?)<\/font>/gi,"[code][color=$1]$2[/color][/code]");rep(/<font.*?color=\"(.*?)\".*?class=\"quoteStyle\".*?>(.*?)<\/font>/gi,"[quote][color=$1]$2[/color][/quote]");rep(/<font.*?class=\"codeStyle\".*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[code][color=$1]$2[/color][/code]");rep(/<font.*?class=\"quoteStyle\".*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[quote][color=$1]$2[/color][/quote]");rep(/<font.*?color=\"(.*?)\".*?>(.*?)<\/font>/gi,"[color=$1]$2[/color]");rep(/<font>(.*?)<\/font>/gi,"$1");rep(/<img.*?src=\"(.*?)\".*?\/>/gi,"[img]$1[/img]");rep(/<span class=\"codeStyle\">(.*?)<\/span>/gi,"[code]$1[/code]");rep(/<span class=\"quoteStyle\">(.*?)<\/span>/gi,"[quote]$1[/quote]");rep(/<strong class=\"codeStyle\">(.*?)<\/strong>/gi,"[code][b]$1[/b][/code]");rep(/<strong class=\"quoteStyle\">(.*?)<\/strong>/gi,"[quote][b]$1[/b][/quote]");rep(/<em class=\"codeStyle\">(.*?)<\/em>/gi,"[code][i]$1[/i][/code]");rep(/<em class=\"quoteStyle\">(.*?)<\/em>/gi,"[quote][i]$1[/i][/quote]");rep(/<u class=\"codeStyle\">(.*?)<\/u>/gi,"[code][u]$1[/u][/code]");rep(/<u class=\"quoteStyle\">(.*?)<\/u>/gi,"[quote][u]$1[/u][/quote]");rep(/<\/(strong|b)>/gi,"[/b]");rep(/<(strong|b)>/gi,"[b]");rep(/<\/(em|i)>/gi,"[/i]");rep(/<(em|i)>/gi,"[i]");rep(/<\/u>/gi,"[/u]");rep(/<u>/gi,"[u]");rep(/<br \/>/gi,"\n");rep(/<br\/>/gi,"\n");rep(/<br>/gi,"\n");rep(/<p>/gi,"");rep(/<\/p>/gi,"\n");rep(/&nbsp;/gi," ");rep(/&quot;/gi,"\"");rep(/&lt;/gi,"<");rep(/&gt;/gi,">");rep(/&amp;/gi,"&");rep(/&undefined;/gi,"'");return s},_punbb_bbcode2html:function(s){s=tinyMCE.trim(s);function rep(re,str){s=s.replace(re,str)};rep(/\n/gi,"<br />");rep(/\[b\]/gi,"<strong>");rep(/\[\/b\]/gi,"</strong>");rep(/\[i\]/gi,"<em>");rep(/\[\/i\]/gi,"</em>");rep(/\[u\]/gi,"<u>");rep(/\[\/u\]/gi,"</u>");rep(/\[url\](.*?)\[\/url\]/gi,"<a href=\"$1\">$1</a>");rep(/\[img\](.*?)\[\/img\]/gi,"<img src=\"$1\" />");rep(/\[color=(.*?)\](.*?)\[\/color\]/gi,"<font color=\"$1\">$2</font>");rep(/\[code\](.*?)\[\/code\]/gi,"<span class=\"codeStyle\">$1</span>&nbsp;");rep(/\[quote.*?\](.*?)\[\/quote\]/gi,"<span class=\"quoteStyle\">$1</span>&nbsp;");return s}};tinyMCE.addPlugin("bbcode",TinyMCE_BBCodePlugin);