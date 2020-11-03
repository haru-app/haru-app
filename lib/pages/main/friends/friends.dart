import 'package:flutter/material.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/widgets/common/search_screen.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';

import 'friends_list.dart';
import 'friends_view.dart';
import 'friends_diary.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subPage = Provider.of<SubPageProvider>(context, listen: true);

    Widget resultPage = Scaffold(
      body: Container(),
    );
    print(subPage.data);
    switch (subPage.page) {
      case SubPage.friendsList:
        resultPage = FriendsListPage();
        break;
      case SubPage.friendsView:
        resultPage = FriendsViewPage();
        break;
      case SubPage.friendsDiary:
        resultPage = FriendsDiary();
        break;
      default:
        resultPage = FriendsListPage();
        break;
    }
    return resultPage;
  }
}
