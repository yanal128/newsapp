import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../HomePage/provider/homeprovider.dart';
class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text("Number of Items"),
                  subtitle: DropdownButton<int>(
                    value: ref.watch(homeProvider).pageSize,
                    items: <int>[10, 20, 30, 40, 50]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          '$value',
                        ),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      ref.watch(homeProvider).setPageSize(newValue ?? 10);
                      ref.watch(homeProvider).getPagingController.refresh();
                    },
                  ),
                ),
                Divider()
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text("Order By"),
                  subtitle: DropdownButton<String>(
                    value: ref.watch(homeProvider).orderBy,
                    items: <String>['newest', 'oldest', 'relevence']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      ref
                          .watch(homeProvider)
                          .setOrderBy(newValue ?? "newest");
                      ref.watch(homeProvider).getPagingController.refresh();
                    },
                  ),
                ),

              ],
            ),
            ListTile(
              title: Text("From Date",style: TextStyle(color: Colors.blue),),
              subtitle: Text(ref.watch(homeProvider).fromDate),
              onTap: () async{
                DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate:
                              DateTime.parse(ref.watch(homeProvider).fromDate),
                              firstDate: DateTime.parse("1990-01-01"),
                              lastDate: DateTime.now());
                          if (newDate != null) {
                            ref.watch(homeProvider).setFromDate(newDate.toString());
                            ref.watch(homeProvider).getPagingController.refresh();}

              },
            ),
            ListTile(
              title: Text("To Date",style: TextStyle(color: Colors.blue),),
              subtitle: Text(ref.watch(homeProvider).endDate),
              onTap: () async{
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate:
                    DateTime.parse(ref.watch(homeProvider).endDate),
                    firstDate: DateTime.parse("1990-01-01"),
                    lastDate: DateTime.now());
                if (newDate != null) {
                  ref.watch(homeProvider).setEndDate(newDate.toString());
                  ref.watch(homeProvider).getPagingController.refresh();}

              },
            )

          ],
        ));
  }
}
