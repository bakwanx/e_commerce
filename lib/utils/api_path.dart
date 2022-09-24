const String baseUrl = "https://shamo-backend.buildwithangga.id/api";
const String baseUrlImage = "http://10.30.68.34:8080/images/";

Uri uriLogin(){
  return Uri.parse(baseUrl+"/login");
}

Uri uriRegister(){
  return Uri.parse(baseUrl+"/register");
}

Uri uriProducts(){
  return Uri.parse(baseUrl+"/products");
}

Uri uriCheckout(){
  return Uri.parse(baseUrl+"/checkout");
}

Uri uriUpdateUser(){
  return Uri.parse(baseUrl+"/user");
}



