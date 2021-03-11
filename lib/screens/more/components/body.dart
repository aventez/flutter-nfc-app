import 'package:flutter/material.dart';
import 'package:idrop/screens/more/components/tab_item.dart';
import 'package:idrop/utils/widgets/footer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            TabItem(
              imagePath: 'assets/buy_artwork.png',
              title: 'Buy IDrop Tag',
              description:
                  'Did you consider buy IDrop tag? Click this button to browse our products. You won\'t be sorry!',
              onTap: () {},
            ),
            TabItem(
              imagePath: 'assets/faq_artwork.png',
              title: 'FAQ',
              description:
                  'Need help? We\'ve got you covered. Click this button to browse our comprehensive FAQ.',
              onTap: () {},
            ),
            TabItem(
              imagePath: 'assets/logout_artwork.png',
              title: 'Log Out',
              description:
                  'Thank you for using IDrop. Click this button to log out or switch an account.',
              onTap: () {},
            ),
            SizedBox(height: size.height * 0.01),
            Footer(),
          ],
        ),
      ),
    );
  }
}
