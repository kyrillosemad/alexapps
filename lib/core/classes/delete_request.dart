// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:test/core/classes/status.dart';
// import 'package:test/core/functions/check_internet.dart';

// class DeleteRequest {
//   Future<Either<Status, Map>> deleteRequest(
//       String link, Map<String, String>? headers,Map body) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.delete(
//           Uri.parse(link),
//           headers: headers,
//           body: jsonEncode(body),
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
