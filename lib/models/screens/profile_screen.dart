import 'package:IDrop/json/profile_settings.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:uuid/uuid.dart';

class ProfileScreenModel extends ChangeNotifier {
  BuildContext context;

  ProfileScreenModel(this.context);

  final formKey = GlobalKey<FormState>();

  String websiteUrlContent = '';
  String nameContent = '';
  String iconContent = 'sale';

  Map<String, String> items = {
    'sale': 'Sale',
    'bicycle': 'Bicycle',
    'booking': 'Booking',
    'calendar': 'Calendar',
    'customer-support': 'Customer support',
    'delivery': 'Delivery',
    'dj': 'DJ',
    'history-book': 'History book',
    'ice-cream': 'Ice cream',
    'menu': 'Menu',
    'music': 'Music',
    'placard': 'Placard',
    'prost': 'Prost',
    'racing-car': 'Racing car',
    'restaurant-menu': 'Restaurant menu',
    'restaurant': 'Restaurant',
    'shop': 'Shop',
    'shopping-cart': 'Shopping cart',
  };

  /* Logic section */
  void refresh() => notifyListeners();

  void onUserEditLink(String brand, String account) async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    final result = await global.apiService
        .updateProfileSettings(global.activeProfileId, {brand: account});

    if (result != null) {
      global.refreshUser();
    }

    refresh();
  }

  void createWebsite() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final websites = global.profileData.links.websites;

    websites.add(new Website(
      id: Uuid().v4(),
      icon: iconContent,
      url: websiteUrlContent,
      name: nameContent,
    ));

    final result =
        await global.apiService.updateProfileSettings(global.activeProfileId, {
      'websites': websites,
    });

    global.refreshUser();
  }

  void deleteWebsite(String id) async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final websites = global.profileData.links.websites;

    final websiteIndex = websites.indexWhere((website) => website.id == id);
    if (websiteIndex != -1) {
      websites.removeAt(websiteIndex);
    }

    final result =
        await global.apiService.updateProfileSettings(global.activeProfileId, {
      'websites': websites,
    });

    global.refreshUser();
  }

  void editWebsite(String id) async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final websites = global.profileData.links.websites;

    Website website = null;
    final websiteIndex = websites.indexWhere((website) => website.id == id);
    if (websiteIndex != -1) {
      website = websites[websiteIndex];
    }

    website.icon = iconContent;
    website.name = nameContent;
    website.url = websiteUrlContent;
    websites[websiteIndex] = website;

    await global.apiService.updateProfileSettings(global.activeProfileId, {
      'websites': websites,
    });

    global.refreshUser();
  }

  void showCreateWebsiteModal({String id = null}) async {
    this.nameContent = '';
    this.websiteUrlContent = '';
    this.iconContent = 'sale';

    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context, listen: false);
    final global = Provider.of<GlobalModel>(context, listen: false);

    final websites = global.profileData.links.websites;

    final limit = (global.activeAccount.premium == true) ? 20 : 3;
    final count = websites.length;

    if (websites.length >= limit) {
      showOkAlert(
        context,
        'You cannot add more than $limit custom links. To increase this limit contact support: office@idropsocial.com',
      );
      return;
    }

    Website website = null;
    if (id != null) {
      final websites = global.profileData.links.websites;
      final websiteIndex = websites.indexWhere((website) => website.id == id);
      if (websiteIndex != -1) {
        website = websites[websiteIndex];
        this.nameContent = website.name;
        this.websiteUrlContent = website.url;
        this.iconContent = website.icon;
      }
    }

    List<dynamic> _items = items.entries
        .map((entry) => {
              'value': entry.key,
              'label': entry.value,
              'icon': Image.asset(
                "assets/icons/websites/${entry.key}.png",
                width: size.width * 0.1,
              ),
            })
        .toList();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          final theme = Provider.of<ThemeModel>(context);
          final palette = theme.getPalette();
          return AlertDialog(
            content: Stack(
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SelectFormField(
                          type: SelectFormFieldType.dialog,
                          initialValue: website?.icon ?? 'sale',
                          labelText: 'Icon',
                          items: _items,
                          onChanged: (val) => this.iconContent = val ?? 'sale',
                          decoration: InputDecoration(
                            labelText: 'Icon',
                            prefixIcon: Icon(Icons.image),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) =>
                              this.websiteUrlContent = value ?? '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              ValidationBuilder().maxLength(30).url().build(),
                          initialValue: website?.url ?? null,
                          decoration: InputDecoration(
                            labelText: 'https://your.website',
                            prefixIcon: Icon(Icons.network_cell),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => this.nameContent = value ?? '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: ValidationBuilder().maxLength(30).build(),
                          initialValue: website?.name ?? null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.draw),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              if (website == null) {
                                createWebsite();
                              } else {
                                editWebsite(website.id);
                              }
                              Navigator.of(context).pop();
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(size.width),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(size.width, size.height * 0.05),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                theme.getPalette().primaryColor),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 14.0),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          child: Text('Save'.toUpperCase()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(size.width),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(size.width, size.height * 0.05),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                theme.getPalette().textLightColor),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 14.0),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          child: Text('Cancel'.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  /* Logic section end */
}
