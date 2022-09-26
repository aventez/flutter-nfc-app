import 'package:IDrop/json/user_basic.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/screens/profile/components/link_state_text.dart';
import 'package:provider/provider.dart';

class ProfileRow extends StatelessWidget {
  final Profile profile;

  const ProfileRow({
    @required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    final rowWidth = size.width;
    final rowHeight = size.height * 0.08;

    final activeProfile = profile.id == global.activeProfileId;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          global.activeProfileId = profile.id;
          global.apiService.updateActiveProfile(profile.id);

          debugPrint('Setting active: ' + profile.id);

          global.refreshUser();
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: rowWidth * 0.9,
            height: rowHeight,
            margin: EdgeInsets.only(left: rowWidth * 0.013),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: rowWidth * 0.05),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.profile.name ?? 'Profile name',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: palette.primaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ProfileLinkStateText(name: this.profile.job),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        activeProfile == true
                            ? Icon(
                                Icons.star,
                                color: palette.primaryColor,
                              )
                            : Container(),
                        IconButton(
                          color: Colors.black.withOpacity(0.45),
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            final result = await global.apiService
                                .deleteProfile(profile.id);
                            if (result == false) {
                              return showOkAlert(
                                context,
                                'You must have at least one active profile.',
                              );
                            }
                            global.refreshUser();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return global.providerConfig
                                      .getSwitchProfileScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
