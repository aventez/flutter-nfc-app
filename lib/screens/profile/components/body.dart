import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/screens/profile/components/profile_link.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final profile = global.activeAccount.profile;
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your links',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ProfileLink(
              brand: 'instagramAccount',
              name: profile.instagramAccount,
              message:
                  'Enter your Instagram username (without @). Example: idropsocial',
            ),
            ProfileLink(
              brand: 'twitterAccount',
              name: profile.twitterAccount,
              message:
                  'Enter your Twitter username. Use @. Example: @idropsocial',
            ),
            ProfileLink(
              brand: 'facebookAccount',
              name: profile.facebookAccount,
              message:
                  'Enter your Facebook profil URL/link. Go to facebook.com and open your Facebook profile or page. Then copy and paste the url link here.',
            ),
            ProfileLink(
              brand: 'linkedinAccount',
              name: profile.linkedinAccount,
              message: 'Enter your LinkedIn profile full URL/link.',
            ),
            ProfileLink(
              brand: 'phoneNumber',
              name: profile.phoneNumber,
              message:
                  'Enter your phone number with your country code. Ex: +33 / +44',
            ),
            ProfileLink(
              brand: 'whatsAppNumber',
              name: profile.whatsAppNumber,
              message:
                  'Enter your What’s App number without your country code.',
            ),
            ProfileLink(
              brand: 'publicEmail',
              name: profile.publicEmail,
              message: 'Enter your Email address.',
            ),
            ProfileLink(
              brand: 'tiktokAccount',
              name: profile.tiktokAccount,
              message:
                  'Enter your TikTok username with @. Example: @idropsocial',
            ),
            ProfileLink(
              brand: 'spotifyAccount',
              name: profile.spotifyAccount,
              message: 'Enter your Spotify URL/Link',
            ),
            ProfileLink(
              brand: 'appleMusicAccount',
              name: profile.appleMusicAccount,
              message: 'Enter an Apple Music link. Copy paste here.',
            ),
            ProfileLink(
              brand: 'cashAppAccount',
              name: profile.cashAppAccount,
              message: 'Enter your CashApp username',
            ),
            ProfileLink(
              brand: 'venmoAccount',
              name: profile.venmoAccount,
              message: 'Enter your Venmo username',
            ),
            ProfileLink(
              brand: 'paypalAccount',
              name: profile.paypalAccount,
              message:
                  'Go to paypal.me and tap “Create your PayPal.Me Link”. Copy and paste here',
            ),
            ProfileLink(
              brand: 'twitchAccount',
              name: profile.twitchAccount,
              message:
                  'Enter your only your Twitch username. Example: idropsocial',
            ),
            ProfileLink(
              brand: 'snapchatName',
              name: profile.snapchatName,
              message:
                  'Enter your Snapchat username. (Without @). Example: idrop_social',
            ),
            ProfileLink(
              brand: 'website',
              name: profile.website,
              message:
                  'Enter your website. Example: https://www.idropsocial.com',
            ),
          ],
        ),
      ),
    );
  }
}
