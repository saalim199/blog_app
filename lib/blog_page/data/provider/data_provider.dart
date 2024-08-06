import 'package:blog_app/core/secrets/constant.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  Future<Either<Exception, http.Response>> fetchData() async {
    try {
      const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': Constants().adminSecret,
      }).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(Exception('Failed to fetch data'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
