import 'package:flutter/material.dart';
import 'package:haruapp/providers/page.dart';
import 'package:provider/provider.dart';

class TopBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        pageProvider.currentIndex = 0;
        if (!(new RegExp(r'^\/main\/.+\/.+')
            .hasMatch(ModalRoute.of(context).settings.name))) {
          pageProvider.pageController.animateToPage(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          return;
        }
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false,
            arguments: {'changePageIndex': 0});
      },
      child: Container(
        padding: EdgeInsets.only(right: 1),
        child: Text(
          'Haru',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
