import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
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
      child: ListView(
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
                Text(
                  "What's For Dinner",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: mainFontFamily,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Paramètres',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Mon Frigo',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(0));
            },
          ),
          ListTile(
            title: Text(
              'Recette',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(1));
            },
          ),
          ListTile(
            title: Text(
              'Mes Favoris',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(2));
            },
          ),
          ListTile(
            title: Text(
              'Mon Profil',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(3));
            },
          ),
          ListTile(
            title: Text(
              'Déconnexion',
              style: TextStyle(
                color: Colors.black,
                fontFamily: secondeFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w500,
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
