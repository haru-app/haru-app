import 'package:flutter/material.dart';
import 'package:haruapp/providers/writing.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/widgets/common/profile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Writing extends StatelessWidget {
  dynamic _writing;
  dynamic _all;

  Writing({dynamic writing, bool all = false}) {
    _writing = writing;
    _all = all;
  }
  @override
  Widget build(BuildContext context) {
    WritingProvider writingProvider =
        Provider.of<WritingProvider>(context, listen: true);
    return FutureBuilder(
        future: !_all
            ? writingProvider.getWritingList(
                context: context,
                diaryIdx: (ModalRoute.of(context).settings.arguments
                    as dynamic)['diary']['diaryIdx'],
                isNotify: false)
            : writingProvider.getWritingListAll(
                context: context, isNotify: false) as dynamic,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()]),
            );
          }
          final writingList = writingProvider.writingList;
          return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return SingleChildScrollView(
                child: Column(
                    children: List.generate(writingList.length, (index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.black12, width: 5.0),
                  )),
                  child: Column(children: [
                    Profile(username: writingList[index]['username']),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              DateFormat('dd MMM yyyy').format(DateTime.parse(
                                  writingList[index]['writingDate'])),
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                writingList[index]['title'],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                writingList[index]['content'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.justify,
                              )),
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: List.generate(
                                    writingList[index]['writingTags'].length,
                                    (index2) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Text(
                                      '#${writingList[index]['writingTags'][index2]}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  );
                                }),
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(5, (index2) {
                                if (writingList[index]['score'] > index2)
                                  return Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 24.0,
                                  );

                                return Icon(
                                  Icons.favorite_border,
                                  color: Colors.pink,
                                  size: 24.0,
                                );
                              }))
                        ],
                      ),
                    ),
                  ]));
            })));
          });
        });
  }
}
