import 'package:diwan/helper/callback.dart';
import 'package:diwan/res/colors.dart';
import 'package:diwan/res/style.dart';
import 'package:flutter/material.dart';

class AppPager extends StatefulWidget {
  final List<String> pagerList;
  final PageChangeListener pageChanged;
  final bool fitWidth;

  AppPager({this.pagerList, this.pageChanged, this.fitWidth = false});

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
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: widget.fitWidth ? MediaQuery.of(context).size.width / widget.pagerList.length : null,
                  decoration: BoxDecoration(
                    border: currentActive == index ? Border(
                      bottom: BorderSide(color: AppColors.buttonBackground),
                    ) : null,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentActive = index;
                          widget.pageChanged(index);
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
                ),
              ],
            ),

            SizedBox(
              width: 10,
            )
          ],
        );
      }),
    );
  }
}
