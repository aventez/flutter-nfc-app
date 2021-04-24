import 'package:flutter/material.dart';
import 'package:idrop/models/screens/more_screen.dart';
import 'package:idrop/screens/more/components/tab_item.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:idrop/utils/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  final shopUrl = 'https://www.idropsocial.com/shop';
  final faqUrl = 'https://www.idropsocial.com/help';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<MoreScreenModel>(context);

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
              title: 'Buy your IDrop',
              description:
                  'Click here to shop your IDrop. See our new collections, new colors and new styles! You won’t regret it.',
              onTap: () async {
                if (await canLaunch(shopUrl)) {
                  await launch(shopUrl);
                } else {
                  showOkAlert(context, 'Unfortunately, could not launch URL.');
                }
              },
            ),
            TabItem(
              imagePath: 'assets/faq_artwork.png',
              title: 'FAQ',
              description:
                  'Need help? We’ve got you covered. Click here to browse our comprehensive FAQ.',
              onTap: () async {
                if (await canLaunch(faqUrl)) {
                  await launch(faqUrl);
                } else {
                  showOkAlert(context, 'Unfortunately, could not launch URL.');
                }
              },
            ),
            TabItem(
              imagePath: 'assets/logout_artwork.png',
              title: 'Log Out',
              description:
                  'Thank you for using IDrop. Click here to log out or switch accounts.',
              onTap: () async {
                final result = await showConfirmationAlert(
                  context,
                  'Do you want to log out?',
                );

                if (result == true) model.handleLogout();
              },
            ),
            SizedBox(height: size.height * 0.01),
            Footer(),
          ],
        ),
      ),
    );
  }
}
