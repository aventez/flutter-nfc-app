import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/screens/profile/components/profile_link.dart';
import 'package:idrop/utils/widgets/footer.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final profile = global.activeAccount.profile;
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your links',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ProfileLink(
                brand: 'instagramAccount',
                name: profile.instagramAccount,
              ),
              ProfileLink(
                brand: 'twitterAccount',
                name: profile.twitterAccount,
              ),
              ProfileLink(
                brand: 'facebookAccount',
                name: profile.facebookAccount,
              ),
              ProfileLink(
                brand: 'linkedinAccount',
                name: profile.linkedinAccount,
              ),
              ProfileLink(
                brand: 'phoneNumber',
                name: profile.phoneNumber,
              ),
              ProfileLink(
                brand: 'whatsAppNumber',
                name: profile.whatsAppNumber,
              ),
              ProfileLink(
                brand: 'publicEmail',
                name: profile.publicEmail,
              ),
              ProfileLink(
                brand: 'tiktokAccount',
                name: profile.tiktokAccount,
              ),
              ProfileLink(
                brand: 'spotifyAccount',
                name: profile.spotifyAccount,
              ),
              ProfileLink(
                brand: 'appleMusicAccount',
                name: profile.appleMusicAccount,
              ),
              ProfileLink(
                brand: 'cashAppAccount',
                name: profile.cashAppAccount,
              ),
              ProfileLink(
                brand: 'venmoAccount',
                name: profile.venmoAccount,
              ),
              ProfileLink(
                brand: 'paypalAccount',
                name: profile.paypalAccount,
              ),
              ProfileLink(
                brand: 'twitchAccount',
                name: profile.twitchAccount,
              ),
              ProfileLink(
                brand: 'snapchatName',
                name: profile.snapchatName,
              ),
              ProfileLink(
                brand: 'website',
                name: profile.website,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
