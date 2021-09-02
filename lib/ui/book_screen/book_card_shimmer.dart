import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: WidgetUtility.spreadWidgets(
          [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                height: 140,
                color: Colors.white,
              ),
            ),
            Container(
              height: 8,
              width: double.infinity,
              color: Colors.white,
            ),
            Container(
              height: 8,
              width: double.infinity,
              color: Colors.white,
            )
          ],
          interItemSpace: 6,
          flowHorizontal: false,
        ),
      ),
    );
  }
}
