/**
* GNU General Public License.

* This file is part of ZeusCart V2.3.

* ZeusCart V2.3 is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* ZeusCart V2.3 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with Foobar. If not, see <http://www.gnu.org/licenses/>.
*
*/
// JavaScript Document


function GetXmlHttpObject()
{
	if (window.XMLHttpRequest)
		return (new XMLHttpRequest());
	else if (window.ActiveXObject)
		return (new ActiveXObject("Microsoft.XMLHTTP"));
}

function ajaxpaging(url,divid)
{ 

	var xmlHttp = false;
	xmlHttp=GetXmlHttpObject();

	if (xmlHttp==null)
		alert ("Browser does not support HTTP Request");
	else
	{
		if(document.getElementById('loading-mask')!=null)
		{
		var loadingdiv = document.getElementById('loading-mask');	
		loadingdiv.style.display = "block";		
		}
		
			xmlHttp.onreadystatechange=
			function ()
				{				
				/*if(xmlHttp.readyState<4 )
				{
				document.getElementById('bgnew_id').style.display='block';
				document.getElementById('ajaxloader').style.display='block';
				}*/	
				if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
				{
				document.getElementById(divid).innerHTML=xmlHttp.responseText;
				//alert(innerHTML=xmlHttp.responseText);
				}
		};
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}
	
}
function toggle(toggleId, e)
{
	if (!e)
	e = window.event;
	if (!document.getElementById)	return false;
	
	var body = document.getElementById(toggleId);
	
	if (!body)	return false;
	
	if (body.style.display == "none")
		body.style.display = "block";
	else	body.style.display = "none";
	
	if (e)
	{
	// Stop the event from propagating, which would cause the regular HREF link to be followed, ruining our hard work.
		e.cancelBubble = true;
		if (e.stopPropagation)	e.stopPropagation();
	}
}


function submitSearchOnEnter(variable)
{
  var keyCode;
  //get whatever key was just pressed
  //try to account for different methods of getting
  //event keys depending on implementation
  if(window.event)
  {
      keyCode = window.event.keyCode;
  }
  else if(variable)
  {
      keyCode = variable.which;
  }

  //if the key was the enter key, perform the necessary function
  if(keyCode == 13) //13 = enter key
  {
      //here is where you process the form item or call a function to do that
      loadorder(); //call search
  }
}




