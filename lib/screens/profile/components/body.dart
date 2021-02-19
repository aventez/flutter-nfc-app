import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/profile/components/buttons.dart';
import 'package:nfc_mobile/screens/profile/components/link.dart';
import 'package:nfc_mobile/screens/profile/components/no_links.dart';
import 'package:nfc_mobile/utils/widgets/icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final count = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: size.height * 0.48,
        child: count >= 1
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileLink(
                      icon: Container(
                        width: size.height * 0.03,
                        child: FacebookIcon(),
                      ),
                      platform: 'Facebook',
                      login: 'f.szymanski3',
                    ),
                    ProfileLink(
                      icon: Container(
                        width: size.height * 0.03,
                        child: InstagramIcon(),
                      ),
                      platform: 'Instagram',
                      login: 'aventez',
                    ),
                    ProfileLink(
                      icon: Container(
                        width: size.height * 0.03,
                        child: SnapchatIcon(),
                      ),
                      platform: 'Snapchat',
                      login: 'xaventez',
                    ),
                    ProfileLink(
                      icon: Container(
                        width: size.height * 0.03,
                        child: PhoneIcon(),
                      ),
                      platform: 'Phone',
                      login: '+48 555 444 333',
                    ),
                    ProfileLink(
                      icon: Container(
                        width: size.height * 0.03,
                        child: WhatsAppIcon(),
                      ),
                      platform: 'WhatsApp',
                      login: '+49 5554 44 333',
                    ),
                    ProfileButtons(),
                  ],
                ),
              )
            : NoLinks(),
      ),
    );
  }
}
