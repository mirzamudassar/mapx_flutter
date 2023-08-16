import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Modals/SidebarMenu.dart';
import 'package:mapx/Screens/Draft.dart';
import 'package:mapx/Screens/Login.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.itemSelected}) : super(key: key);
  final int itemSelected;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late Menu selectedMenu; // Declare the selectedMenu as late variable

  @override
  void initState() {
    super.initState();
    if (widget.itemSelected < 5) {
      selectedMenu = menuItems[
          widget.itemSelected]; // Initialize selectedMenu based on itemSelected
    } else {
      selectedMenu = menuItems2[widget.itemSelected % 5];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color.fromRGBO(62, 159, 71, 1.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 32,
                    bottom: 16,
                  ),
                  child: Text(
                    "BROWSE",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...menuItems.map(
                  (menu) => SubMenuTile(
                      menu: menu,
                      press: () {
                        setState(() {
                          selectedMenu = menu;
                        });
                      },
                      isActive: menu == selectedMenu),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 32,
                    bottom: 16,
                  ),
                  child: Text(
                    "RECORDS",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...menuItems2.map(
                  (menu) => SubMenuTile(
                      menu: menu,
                      press: () {
                        setState(() {
                          selectedMenu = menu;
                        });
                        if (menu.title == "Draft") {
                          print("Entered Here");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DraftPage()));
                        } else if (menu.title == "History") {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HistoryScreen()));
                        } else if (menu.title == "Review Section") {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ReviewSectionScreen()));
                        } else if (menu.title == "Logout") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        }
                      },
                      isActive: menu == selectedMenu),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubMenuTile extends StatelessWidget {
  const SubMenuTile(
      {Key? key,
      required this.menu,
      required this.press,
      required this.isActive})
      : super(key: key);

  final Menu menu;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            height: 56,
            width: isActive ? 288 : 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(242, 255, 228, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          ListTile(
            onTap: press,
            leading: SizedBox(
                height: 24,
                width: 24,
                child: ImageIcon(AssetImage(menu.assets_white),
                    color: isActive ? Colors.black : Colors.white)),
            title: Text(
              menu.title,
              style: TextStyle(
                  color: isActive ? Colors.black : Colors.white, fontSize: 20),
            ),
          ),
        ]),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text("Muhammad Hamza", style: TextStyle(color: Colors.white)),
      subtitle: Text("User", style: TextStyle(color: Colors.white)),
    );
  }
}
