
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


// JavaScript Document
function startTime()
{
  var today=new Date();
  var h=today.getHours();
  var m=today.getMinutes();
  var s=today.getSeconds();
  var d=today.getDate();
  var mo=today.getMonth();
  var y=today.getFullYear();
 // add a zero in front of numbers<10
  m=checkTime(m);
  s=checkTime(s);
  var month=new Array(12);
		month[0]="Jan";
		month[1]="Feb";
		month[2]="Mar";
		month[3]="Apr";
		month[4]="May";
		month[5]="June";
		month[6]="July";
		month[7]="Aug";
		month[8]="Sep";
		month[9]="Oct";
		month[10]="Nov";
		month[11]="Dec";
  
  document.getElementById('time').innerHTML=month[mo]+" "+d+","+y+" "+h+":"+m+":"+s;
 t=setTimeout('startTime()',500);
}
function checkTime(i)
{
if (i<10)
  {
  i="0" + i;
  }
return i;
}
