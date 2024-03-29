import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/models/screens/nfc_screen.dart';
import 'package:IDrop/screens/nfc/components/nfc_error.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NfcScreenModel>(context);
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: model.supportsNfc == true
          ? Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.all(45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/nfc_artwork.png',
                        height: size.height * 0.2),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Text(
                      'It works!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w500,
                        color: palette.primaryColor,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'To activate your IDrop press "Activate" and tap your tag at the very top of the back of your phone.',
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.04),
                    ElevatedButton(
                      onPressed: model.writingNfc == false
                          ? () async {
                              await model.writeNfc();
                            }
                          : null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(size.width),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(size.width / 3, size.height * 0.05),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          palette.primaryColor,
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 15.0),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                      child: Text(
                        model.writingNfc == false
                            ? 'Activate'.toUpperCase()
                            : 'Scanning...'.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : NfcError(),
    );
  }
}
