import 'dart:convert';

import 'package:http/http.dart';

class Communication {

  void getTime() async {

Response response = await get("http://worldtimeapi.org/timezone/America/Toronto");
Map data = jsonDecode(response.body);
print(data);



//get propriétés depuis data
String dateTime = data['dateTime'];
String offset = data['offset'];
print(dateTime);
print(offset);

  }
}