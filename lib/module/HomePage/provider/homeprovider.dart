import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:newsapp/module/HomePage/model/section.dart';
import '../data/homepageapi.dart';
import '../model/alldata.dart';
import 'package:url_launcher/url_launcher.dart';
final homeProvider =
    ChangeNotifierProvider<HomeProvider>((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  List<News> result = [];
  List<Section> section = [
    Section(id: "home", webTitle: "home")
  ];
  List<News> newsBySection = [];
  PagingController<int, News> _pagingController =
  PagingController(firstPageKey: 0);
  HomePageApi api = HomePageApi();
  bool isLoading = false;

  int _page = 1;
  late int pageSize ;
  String orderBy = "newest";
  String fromDate = DateTime.now().toString();
  String endDate = DateTime.now().toString();
  void addSection() async {
    setLoading(false);
    var data = await api.getSections();
    log(data.toString());
    for (var elemnt in data['response']['results'])
      section.add(Section.fromJson(elemnt));
    setLoading(true);
    notifyListeners();
  }

  bool setLoading(bool t) {
    return isLoading = t;
  }


  void getNewsBySectionPaginated(String category,
      Function(int status) onStatusCodeError,
      Function(Exception e) onException,
      Function(PagingController<int, News> pc) onComplete) async {
    _page = 1;
pageSize=10;
    PagingController<int, News> pagingController =
    PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) async {
      var news = await api.getAllNews(
        _page,
        pageSize,
        category,
        fromDate,
        endDate,
        orderBy,
      );

      List<News> newsList = [];

      for (var e in news['response']['results']) {
        newsList.add(News.fromJson(e));
      }

      print("news list length: ${newsList.length}");

      if (newsList.length < pageSize) {
        pagingController.appendLastPage(newsList);
      } else {
        _page++;
        pagingController.appendPage(newsList, _page);
      }
    });

    onComplete(pagingController);
  }

  setPaginController(PagingController<int, News> v) => _pagingController = v;

  PagingController<int, News> get getPagingController => _pagingController;

  Duration getDuration(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute);
    Duration difference = targetDate.difference(now);
    return difference.abs();
  }
  Future<void> launchurl(String url) async {
    print(url);
    await launchUrl(Uri.parse(url)) ;

    }

  setPage(int v) {
    _page = v;
    notifyListeners();
  }

  setPageSize(int num) {
    pageSize = num;
    notifyListeners();
  }

  setFromDate(String from) {
    fromDate = from;
    notifyListeners();
  }

  setEndDate(String end) {
    endDate = end;
    notifyListeners();
  }

  setOrderBy(String order) {
    orderBy = order;
    notifyListeners();
  }
}