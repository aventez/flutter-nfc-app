import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:idrop/screens/login/components/form.dart';
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
            SizedBox(height: size.height * 0.12),
            Center(
              child: Image.asset(
                'assets/login_artwork.png',
                width: size.width * 0.5,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text('Sign in',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.03),
            LoginForm(),
            SizedBox(height: size.height * 0.04),
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
