import 'package:flutter/material.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';
import 'package:idrop/utils/widgets/brand_logo.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(size.width * 0.1),
        children: [
          SizedBox(height: size.height * 0.21),
          Center(
            child: Image.asset(
              'assets/offline_artwork.png',
              width: size.width * 0.5,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            'Oh, something is wrong!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'No connection. Please check your wifi or mobile data connection.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.08),
          Center(
            child: BrandLogo(
              width: size.width * 0.25,
              black: true,
            ),
          ),
        ],
      ),
    );
  }
}
