import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class AppPager extends StatefulWidget {
  final List<String> pagerList;

  AppPager(this.pagerList);

  @override
  _AppPagerState createState() => _AppPagerState();
}

class _AppPagerState extends State<AppPager> {
  int currentActive = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.pagerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: currentActive == index ? Border(
                  bottom: BorderSide(color: AppColors.buttonBackground),
                ) : null,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentActive = index;
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.pagerList[index],
                    style: currentActive == index ? pagerTextActiveStyle : pagerTextInactiveStyle,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
