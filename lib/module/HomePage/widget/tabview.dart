import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/alldata.dart';
import '../provider/homeprovider.dart';
import 'cardview.dart';


class TabView extends ConsumerStatefulWidget {
  String section;
  TabView({super.key, required this.section});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabViewState(section: section);
}

class _TabViewState extends ConsumerState<TabView> {
  String section;

  _TabViewState({required this.section});

  //get data by section
  @override
  void initState() {
    super.initState();

    ref.read(homeProvider).getNewsBySectionPaginated(
        section,
            (status) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("error: $status"))),
            (e) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e"))),
        // oncomplete
            (pc) {
          ref.read(homeProvider).setPaginController(pc);
        });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blue,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        ref.watch(homeProvider).getPagingController.refresh();
      },
      child: PagedListView<int, News>(
          pagingController: ref.watch(homeProvider).getPagingController,
          builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, newsItem, index) => CardView(news: newsItem))),
    );
  }
}
