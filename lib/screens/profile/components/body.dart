import 'package:IDrop/models/screens/profile_screen.dart';
import 'package:IDrop/screens/profile/components/website_profile_link.dart';
import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/screens/profile/components/profile_link.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final model = Provider.of<ProfileScreenModel>(context);
    final profile = global.profileData.links;

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
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
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
              brand: 'youtubeAccount',
              name: profile.youtubeAccount,
              message:
                  'Copy your YouTube account URL and paste at the bottom of the page here.',
            ),
            ProfileLink(
              brand: 'soundcloudAccount',
              name: profile.soundcloudAccount,
              message:
                  'Copy your SoundCloud account URL and paste at the bottom of the page here.',
            ),
            ProfileLink(
              brand: 'facebookAccount',
              name: profile.facebookAccount,
              message:
                  'Go to your Facebook profile or page. Click on the 3 dots « … » and copy/paste the URL at the bottom of the page here.',
            ),
            ProfileLink(
              brand: 'linkedinAccount',
              name: profile.linkedinAccount,
              message:
                  'Go to your LinkedIn profile, click on the 3 dots … next to your profil, click “share with” &  copy the link. Link needs to be https://www…..',
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
            for (var website in profile.websites)
              WebsiteProfileLink(
                id: website.id,
                icon: website.icon,
                url: website.url,
                name: website.name,
              ),
            ElevatedButton(
              onPressed: () {
                model.showCreateWebsiteModal();
              },
              child: Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(5),
                primary: theme.getPalette().primaryColor,
                onPrimary: theme.getPalette().secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
