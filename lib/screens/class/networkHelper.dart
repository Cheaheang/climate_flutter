import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {

  final String url ;
  NetworkHelper({required this.url});
  
  Future getData()async{
     http.Response response =await http.get(Uri.parse(url));
      if(response.statusCode == 200){
      String data = response.body;
      // String jsonData = json.decode(data);
      // print(data);
      return jsonDecode(data);
      }else{
        print("error");
        print( response.statusCode);
      }
  }
 
}