var conf = true;

//check for non wanted chars in a given string(false=not valid)
function cCheck(name){
	var badC= "`~@#$%^&*()_+-=[]{}\|';:?/><,.";
	for(var i=0; i<badC.length; i++){
		if(name.indexOf(badC.charAt(i)) != -1)
			return false;
	}//for
	return true;
}//cCheck

//check for numbers in a given string(false=not valid)
function nCheck(name){
	var badC= "1234567890";
	for(var i=0; i<badC.length; i++){
		if(name.indexOf(badC.charAt(i)) != -1)
			return false;
	}//for
	return true;
}//nCheck

//check for valid person name(false=not valid)
function pnCheck(name){
	if(!cCheck(name) || !nCheck(name))
		return false;
	if(name < 1)
		return false;
	
	return true;
}//pnCheck

//check for valid user name(false=not valid)
function unCheck(name){
	if(!cCheck(name))
		return false;
	if(name < 2)
		return false;
	
	return true;
	
}//unCheck

//check for valid email(false=not valid)
function mCheck(mail){
	if(mail.indexOf('@') == -1)// check if @ exsist
		return false;
	if(mail.substring(mail.lastIndexOf('.')+1).length <= 1)// check for 2 chars at least after last dot
		return false;
	if(mail.charAt(mail.indexOf('@') +1)  == '.')// check for no '.' after a '@'
		return false;
	if(mail.indexOf('@') == 0)// check if '@' in the start
		return false;
	if(mail.indexOf('.') == 0)// check if '.' in the start
		return false;
	if(mail.charAt(mail.indexOf('@') -1)  == '.')// check for no '@' after a '.'
		return false;
	if(!cCheck(mail.substring(mail.lastIndexOf('.')+1)))// check for valid chars after last '.'
		return false;
	if(mail.indexOf("gay") != -1)
		alert("you blocked from this website");
		
	return true;
}//mCheck

//check for valid password(false=not valid)
function pCheck(pass){
	if(pass.length < 6){
		return false;
	}

	return true;
}//pCheck

//check for valid password confirm(false=not valid)
function pcCheck(pass, passC){
	if(pass == passC){
		return true;
	}
	
	return false;
}

//for debug
function mailTest(){
	var conf = true;
	
	if(!mCheck(reg.email1.value)){
		conf=false;
		alert("email not valid");
	}
	
	if(conf){
		alert("good");
	}else{
		alert("not good");
	}
	
}

//the main function
function allCheck(){
	//first name check
	if(!pnCheck(reg.firstname.value)){
		conf=false;
		//alert("first name not valid");
		document.getElementById("fNameError").style.display = "inline";
	}

	//last name check
	if(!pnCheck(reg.lastname.value)){
		conf=false;
		//alert("last name not valid");
		document.getElementById("lNameError").style.display = "inline";
	}	

	//user name check
	if(!unCheck(reg.username.value)){
		conf=false;
		//alert("username not valid");
		document.getElementById("uNameError").style.display = "inline";
	} 

	//email check
	if(!mCheck(reg.email1.value)){
		conf=false;
		//alert("email not valid");
		document.getElementById("emailError").style.display = "inline";
	}
	
	//password check
	if(!pCheck(reg.password1.value)){
		conf=false;
		//alert("password not valid");
		document.getElementById("passError").style.display = "inline";
	}	

	//password confirm check
	if(!pcCheck(reg.password1.value , reg.passwordConf.value)){
		conf=false;
		//alert("password confirm not valid");
		document.getElementById("confPassError").style.display = "inline";
	}

	if(conf){
		return true;
		console.log("good");
	}
	
	return false;
	console.log("bad");
}//allCheck








