import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/module/HomePage/model/alldata.dart';

import '../../settings/settingscreen.dart';
import '../provider/homeprovider.dart';
import '../widget/tabview.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    ref.read(homeProvider).addSection();
  }

  late TabController _controller;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget Check(loading) {
    if (loading == false) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      var sectionList = ref.watch(homeProvider).section;
      _controller = TabController(
        vsync: this,
        length: sectionList.length,
      );
      return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
              child: Column(children: [
            Container(
                color: Colors.blue,
                height: 250, width: MediaQuery.of(context).size.width),
            Expanded(
              child: ListView.builder(
                  itemCount: sectionList.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                          _controller.animateTo(index);
                        },
                        child: ListTile(
                          leading: Icon(Icons.abc),
                          title:
                              Text(sectionList[index].webTitle.toUpperCase()),
                        ),
                      )),
            )
          ])),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>SettingsScreen()));
                  },
                  icon: Icon(
                  Icons.more_vert,
                    color: Colors.blue,
                  ))
            ],
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu_sharp,
                  color: Colors.blue,
                )),
            bottom: TabBar(
              controller: _controller,
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: List.generate(sectionList.length,
                  (index) => Tab(text: "${sectionList[index].webTitle}")),
              isScrollable: true,
            ),
            backgroundColor: Colors.white,
            title: Text(
              "NewFeed",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          body: TabBarView(
              controller: _controller,
              children: List.generate(sectionList.length,
                  (index) => TabView(section: sectionList[index].id)),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Check(ref.watch(homeProvider).isLoading);
  }
}
