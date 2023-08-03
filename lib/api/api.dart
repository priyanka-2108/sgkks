import 'package:http/http.dart' as http;

class Api {
  static String appUrl = "https://laravel.grewon.in/addressbook/api/";
  static register(firstName,lastName,fatherName,birthDate,gender,email,profile,qualificationId) async {
    Map body = {
      'first_name': '$firstName',
      'last_name': '$lastName',
      'father_name': '$fatherName',
      'birth_date': '$birthDate',
      'gender': '$gender',
      'email': '$email',
      'profile': '$profile',
      'qualification_id': '$qualificationId',
    };
    var url = Uri.https(appUrl, 'registers');

    var response = await http.post(url, body: body);
    print("response-->$response");
  }
}
