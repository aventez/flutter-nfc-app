import 'package:flutter/material.dart';

const path = 'assets/icons/';

class MediaIcon extends StatelessWidget {
  final String fileName;

  MediaIcon(this.fileName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage(
          "$path$fileName.png",
        ),
      ),
    );
  }
}

class AppleMusicIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('applemusic');
}

class CashAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('cashapp');
}

class FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('facebook');
}

class InstagramIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('instagram');
}

class LinkedInIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('linkedin');
}

class MailIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('mail');
}

class PaypalIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('paypal');
}

class PhoneIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('phone');
}

class SnapchatIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('snapchat');
}

class SpotifyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('spotify');
}

class TikTokIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('tik-tok');
}

class TwitchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('twitch');
}

class TwitterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('twitter');
}

class UrlIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('url');
}

class WhatsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('whatsapp');
}

class YoutubeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MediaIcon('youtube');
}
