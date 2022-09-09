import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer() : super();

  int _index = 0;

  change(indexSelected) {
    _index = indexSelected;
  }

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: LigthTheme.themedata.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Logo-genial.png',
                  height: 100,
                ),
                const Text(
                  'Paramètres',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "LemonDays",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Mes préférences',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "LemonDays",
                fontSize: 12,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Déconnexion',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "LemonDays",
                fontSize: 12,
              ),
            ),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
            },
          ),
        ],
      ),
    );
  }
}
