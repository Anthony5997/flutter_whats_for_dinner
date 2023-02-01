import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionView extends StatefulWidget {
  User userInfo;
  Fridge fridge;
  SessionView(this.userInfo, this.fridge);

  @override
  State<SessionView> createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

    print("USER PREF AFTER CO");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xffca2520), Color(0xfff99c20)],
                center: Alignment.center,
                radius: 1.2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: 35.0,
                      child: Icon(
                        Icons.cookie_outlined,
                        size: 30.0,
                        color: primaryColor,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF193041),
                        radius: 50.0,
                        child: Image.asset('assets/images/logo-genial.png'),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: 35.0,
                      child: Icon(
                        Icons.star_border,
                        size: 30.0,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.userInfo.nickname,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Text(
                //   'Flutter Developer',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 25,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 241, 0, 0)),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    // color: Color(0xFFF99C25),
                    child: ListTile(
                      title: Text(
                        widget.fridge.ingredients_list.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.deepOrange,
                        ),
                      ),
                      subtitle: Text(
                        'Ingrédient dans le frigo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFD1451B),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: primaryColor,
                    child: ListTile(
                      title: Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.deepOrange,
                        ),
                      ),
                      subtitle: Text(
                        'Avis laissé(s)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFD1451B),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        widget.userInfo.email,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Modifier mon mot de passe',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.handshake_outlined,
                        size: 30.0,
                      ),
                    ),
                    Divider(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(child: const Text('Se déconnecter'), onPressed: () => context.read<AuthenticationBloc>().add(LogoutEvent())),
                    TextButton(child: const Text('Supprimer mon compte'), onPressed: () => context.read<AuthenticationBloc>().add(LogoutEvent())),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
