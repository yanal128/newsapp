import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/module/HomePage/provider/homeprovider.dart';


import '../model/alldata.dart';

class CardView extends ConsumerWidget {
  News news;

  CardView({super.key, required this.news});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     Duration duration = ref.watch(homeProvider).getDuration(DateTime.parse("${news.webPublicationDate}".split('T')[0]));
    return InkWell(
        onTap: () async{
         await ref.watch(homeProvider).launchurl(news.webUrl!);
        },
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${news.webTitle}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child:
                           Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${news.sectionName}"),
                                 Text("${news.webTitle}"),
                              ]
                            ),),
                    ),

                         Expanded(

                            child: news.fields!.thumbnail ==
                                null
                                ? const SizedBox()
                                : Image.network(
                                "${news.fields!.thumbnail}"))
                      ],
                    ),


                Text(
                  "${news.pillarName ?? ""}  ${news.sectionName?? ""}",
                  style: const TextStyle(color: Colors.purpleAccent),
                ),
                Text("${news.webPublicationDate}"
                    .split('T')[0]),

                Text(duration.inHours >= 24?
       "${duration.inDays} day${duration.inDays > 1 ?'s' : ''} ago":duration.inMinutes > 60 ?
                 "${duration.inHours} hour ${duration.inHours > 1 ?'s' : ''} ago":
                "${duration.inMinutes} minutes${duration.inMinutes > 1 ?'s' : ''} ago"
      )
      ],
            ),
          ),

      ),
    );


  }
}
