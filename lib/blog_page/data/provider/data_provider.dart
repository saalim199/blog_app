import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  Future<Either<Exception, http.Response>> fetchData() async {
    try {
      const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
      const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
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
