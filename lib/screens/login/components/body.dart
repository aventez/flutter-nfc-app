import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:idrop/screens/login/components/form.dart';
import 'package:idrop/utils/widgets/brand_logo.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<LoginScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(size.width * 0.1),
          children: [
            SizedBox(height: size.height * 0.07),
            Center(
              child: Image.asset(
                'assets/login_artwork.png',
                width: size.width * 0.43,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Sign in',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            LoginForm(),
            SizedBox(height: size.height * 0.03),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return global.providerConfig.getRegisterScreen();
                    }),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.06),
            Center(
              child: BrandLogo(
                width: size.width * 0.35,
                black: false,
              ),
            ),
          ],
        ),
        model.requestInQueue
            ? Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.white.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Center(
                  child: SpinKitFadingCube(
                    color: Theme.of(context).primaryColor,
                    size: 50.0,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
