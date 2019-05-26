function mCheck(mail){
	if(mail.indexOf('@') == -1)
		return false;
	if(mail.substring(mail.lastIndexOf('.')+1) <= 1)
		return false;
	if(mail.charAt(mail.indexOf('@') +1)  == '.')
		return false;
	if(mail.indexOf('@') == 0)
		return false;
	if(mail.indexOf('.') == 0)
		return false;
	if(mail.charAt(mail.indexOf('@') +1)  == '.')
		return false;
		
	return true;
}//mCheck

function pCheck(pass){
	if(pass.length < 6){
		return false;
	}

	return true;
}//pCheck

function check(){
	var conf = true;
	
	if(!mCheck(reg.email1.value)){
		conf=false;
		alert("email not valid");
	}
	
	if(!pCheck(reg.password1.value)){
		conf=false;
		alert("password not valid");
	}	
}