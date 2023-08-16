import 'package:mapx/Modals/Draft.dart';

class Menu {
  final String assets_black;
  final String assets_white;
  final String title;

  Menu({required this.assets_black, required this.title, required this.assets_white});
}

List<Menu> menuItems = [
  Menu(assets_black: "assets/images/Dashboard-White.png", title: "Dashboard", assets_white:  "assets/images/Dashboard-White.png"),
  Menu(assets_black: "assets/images/A55.png", title: "A55", assets_white:  "assets/images/A55-white.png"),
  Menu(assets_black: "assets/images/DPole.png", title: "D-Pole", assets_white:  "assets/images/D-Pole-White.png"),
  Menu(assets_black: "assets/images/RAC.png", title: "RAC", assets_white:  "assets/images/RAC-White.png"),
  Menu(assets_black: "assets/images/Network.png", title: "Network", assets_white:  "assets/images/Network-White.png"),
];

List<Menu> menuItems2 = [
  Menu(assets_black: "assets/images/Draft.png", title: "Draft", assets_white:  "assets/images/Draft.png"), // this menu naviagte: const Draft()
  Menu(assets_black: "assets/images/History.png", title: "History", assets_white:  "assets/images/History.png"),
  Menu(assets_black: "assets/images/ReviewSection.png", title: "Review Section", assets_white:  "assets/images/ReviewSection.png"),
  Menu(assets_black: "assets/images/Logout.png", title: "Logout", assets_white:  "assets/images/Logout.png"),
];