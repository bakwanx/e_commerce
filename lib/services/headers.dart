Map<String, String> headers() => {
'Content-type': 'application/json'
};

Map<String, String> headersToken(String? token) => {
'Content-type': 'application/json',
'Accept': 'application/json',
'Authorization': token!
};

Map<String, String> headersMultipart() => {
  'Content-type': 'multipart/form-data'
};