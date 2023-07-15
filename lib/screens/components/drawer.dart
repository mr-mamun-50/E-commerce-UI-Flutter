// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_damex/screens/app.dart';
import 'package:ecommerce_damex/screens/auth/login.dart';
import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool darkmode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 8),
                  IconButton(
                      icon: SvgPicture.asset('images/icons/menu_rtt.svg'),
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(
                          backgroundColor: lightGreyColor)),
                ],
              ),

              //  profile info
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://scontent.fdac138-2.fna.fbcdn.net/v/t39.30808-6/335169291_976228843284662_958970849810613327_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGaVzIRzPHmmqwmgODjxrKUUG-5zGqT_1hQb7nMapP_WEHnsUjQ0lRABLwEDOLqwYPSrfDLpnALw0LETseZ01z_&_nc_ohc=paUUz8VkYY4AX-nIRcO&_nc_ht=scontent.fdac138-2.fna&oh=00_AfAx-T2OFJFWMpIM26ATjFJAGBxAqIc0uZst4ydV7hdWgg&oe=64B4A73B')),
                title: Text('Mamunur Rashid',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Row(
                  children: [
                    Text('Verified profile ', style: TextStyle(fontSize: 12)),
                    Icon(Icons.verified, size: 14, color: Colors.green)
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: lightGreyColor),
                  child: Text('3 Orders'),
                ),
              ),
              SizedBox(height: 20),

              // options
              ListTile(
                title: const Text('Dark mode', style: TextStyle(fontSize: 15)),
                leading: const Icon(CupertinoIcons.sun_max),
                trailing: Transform.scale(
                  scale: 0.75,
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: darkmode,
                    onChanged: (value) => setState(() {
                      darkmode = !darkmode;
                    }),
                  ),
                ),
                onTap: () => setState(() {
                  darkmode = !darkmode;
                }),
              ),
              ListTile(
                title: const Text('Account information',
                    style: TextStyle(fontSize: 15)),
                leading: const Icon(CupertinoIcons.exclamationmark_circle),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
              ListTile(
                title: const Text('Password', style: TextStyle(fontSize: 15)),
                leading: SvgPicture.asset('images/icons/lock.svg'),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
              ListTile(
                title: const Text('Orders', style: TextStyle(fontSize: 15)),
                leading: SvgPicture.asset('images/icons/bag.svg',
                    colorFilter:
                        ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
              ListTile(
                title: const Text('My cards', style: TextStyle(fontSize: 15)),
                leading: SvgPicture.asset('images/icons/wallet.svg',
                    colorFilter:
                        ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
              ListTile(
                title: const Text('Whitelist', style: TextStyle(fontSize: 15)),
                leading: SvgPicture.asset('images/icons/heart.svg',
                    colorFilter:
                        ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
              ListTile(
                title: const Text('Settings', style: TextStyle(fontSize: 15)),
                leading: SvgPicture.asset('images/icons/settings.svg',
                    colorFilter:
                        ColorFilter.mode(darkTextColor, BlendMode.srcIn)),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AppLayout()),
                    (route) => false),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: const Text('Logout',
                  style: TextStyle(fontSize: 15, color: Colors.red)),
              leading: SvgPicture.asset('images/icons/logout.svg'),
              onTap: () => showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Logout'),
                  content: Text('Do you want to logout?',
                      style: TextStyle(height: 3)),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('No')),
                    TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                                (route) => false),
                        child: Text('Yes')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
