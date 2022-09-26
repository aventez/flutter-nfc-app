import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:provider/provider.dart';

class TabItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Function onTap;

  const TabItem({
    @required this.imagePath,
    @required this.title,
    @required this.description,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    final rowWidth = size.width * 0.90;
    final rowHeight = size.height * 0.13;

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: rowWidth,
        height: rowHeight,
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Image.asset(
              this.imagePath,
              width: size.width * 0.2,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: palette.primaryColor.withOpacity(0.75),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Flexible(
                    child: Text(
                      this.description,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: palette.textLightColor,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.0),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.20), blurRadius: 13.0),
          ],
        ),
      ),
    );
  }
}
