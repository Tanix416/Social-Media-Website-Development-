function func1(){
    var pvalue = document.getElementById("pass1").value
    var pvalue2 = document.getElementById("cpass1").value
    if(pvalue!=pvalue2){
      alert("Password dosen't match")
      return false
    }
  }
function func2(p1)
{
    //alert(p1)
    xmlHttp=GetXmlHttpObject()
    //alert(xmlHttp);
    url="Email-check.jsp?email="+p1
    //alert(url);
    xmlHttp.onreadystatechange=stateChanged1
    xmlHttp.open("GET",url,true)
    xmlHttp.send(null)
}

function stateChanged1() 
{ 
	
	var showdata = xmlHttp.responseText; 
	//alert(showdata);
  if(showdata==1){
    document.signup.email.value="";
    document.getElementById("result1").innerHTML="<font color=red>Email not available</font>";
  }
  else{
    document.getElementById("result1").innerHTML="<font color=green>Email available</font>";
  }
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}

function func3(p1)
{
    //alert(p1)
    xmlHttp=GetXmlHttpObject()
    //alert(xmlHttp);
    url="Name-check.jsp?name="+p1
    //alert(url);
    xmlHttp.onreadystatechange=stateChanged2
    xmlHttp.open("GET",url,true)
    xmlHttp.send(null)
}

function stateChanged2() 
{ 
	
	var showdata = xmlHttp.responseText; 
	//alert(showdata);
  if(showdata==1){
    document.signup.uname.value=" ";
    document.getElementById("result2").innerHTML="<font color=red>Name not available</font>";
  }
  else{
    document.getElementById("result2").innerHTML="<font color=green>Name available</font>";
  }
}
