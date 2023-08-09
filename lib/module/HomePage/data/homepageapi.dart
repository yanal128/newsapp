import 'package:http/http.dart' as http;

import '../../../services/Api/apiservices.dart';
import '../../../utiles/constant.dart';

class HomePageApi {
  getAllNews(
    int page,
    int pageSize,
    String section,
    String fromDate,
    String endDate,
    String orderBy
  ) async {
    if (section == "home") {
      http.Response response = await http.get(Uri.parse(
          "${Constant
              .paseURL}search?&show-tags=contributor&show-fields=starRating,headline,thumbnail,short-url&page=1&page-size=10&from-date=${DateTime.parse(fromDate).second}&to-date=${DateTime.parse(endDate).toIso8601String()}&order-by=$orderBy&api-key=${Constant.key}"));
      return ApiServices().fetchData(response);
    } else {
      http.Response response = await http.get(Uri.parse(
          "${Constant
              .paseURL}search?&show-tags=contributor&show-fields=starRating,headline,thumbnail,short-url&page=$page&page-size=$pageSize&section=${section
              .toLowerCase()}&from-date=${DateTime.parse(fromDate).toIso8601String()}&to-date=${DateTime.parse(endDate).second}&order-by=$orderBy&api-key=${Constant.key}"));
      return ApiServices().fetchData(response);
    }
  }

  getSections() async {
    http.Response response = await http
        .get(Uri.parse("${Constant.paseURL}sections?api-key=${Constant.key}"));
    print("///////////////////////////////////");

    return ApiServices().fetchData(response);
  }

  getNewSections(String sec) async {
    http.Response response = await http.get(Uri.parse(
        "${Constant.paseURL}sections?$sec&show-tags=contributor&show-fields=starRating,headline,thumbnail,short-url&order-by=newest&api-key=${Constant.key}"));
    print("///////////////////////////////////");

    return ApiServices().fetchData(response);
  }
}
