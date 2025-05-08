// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:test/core/classes/status.dart';
// import 'package:test/core/functions/check_internet.dart';

// class PostRequest {
//   Future<Either<Status, Map>> postRequest(
//       String link, Map data, Map<String, String>? headers) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(
//           Uri.parse(link),
//           body: jsonEncode(data),
//           headers: headers,
//         );

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           var data = jsonDecode(response.body);
//           return right(data);
//         } else {
//           var errors = jsonDecode(response.body);
//           return left(Status.apiFailure(errors));
//         }
//       } else {
//         return left(Status.internetFailure);
//       }
//     } catch (e) {
//       return left(Status.serverFailure);
//     }
//   }
// }
