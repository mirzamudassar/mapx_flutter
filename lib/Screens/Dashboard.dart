import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapx/Screens/SideMenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isMenuBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState(){


    super.initState();

//     // Get user preferences
// SharedPreferences prefs = await SharedPreferences.getInstance();

// String userId = prefs.getString('user_id') ?? '';
// String userRole = prefs.getString('user_role') ?? '';
// String username = prefs.getString('username') ?? '';

// // Now you can use the retrieved data
// print('User ID: $userId');
// print('User Role: $userRole');
// print('Username: $username');


    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(62, 159, 71, 1.0),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isMenuBarOpen ? 0 : -288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(itemSelected: 0,),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: isMenuBarOpen ? 0.8 : 1,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(isMenuBarOpen ? 24 : 0)),
                  child: Image.asset(
                    'assets/images/Dashboard.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 288, 0),
                child: Transform.scale(
                    scale: isMenuBarOpen ? 0.8 : 1,
                    child: const DashboardWidgets())),
          ),
          Positioned(
            top: 10,
            left: isMenuBarOpen ? 220 : 10,
            child: SafeArea(
              child: Transform.translate(
                offset: const Offset(20, 0),
                child: MenuBar(
                  isMenuBarOpen: isMenuBarOpen,
                  press: () {
                    if (isMenuBarOpen) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    setState(() {
                      isMenuBarOpen = !isMenuBarOpen;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Future<String?> getUserDetails() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('user_id') ?? '';
String userRole = prefs.getString('user_role') ?? '';
String username = prefs.getString('username') ?? '';

    return username ?? "";
  } catch (e) {
    print(e.toString());
    return null; // or handle the exception in an appropriate way
  }
}
}

class DashboardWidgets extends StatelessWidget {
  const DashboardWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Column(
            children: [DashboardCards(), CardGrid(), GraphCardWidget()],
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCardRow([
            _buildCard("assets/images/A55.png", 'A55'),
            _buildCard("assets/images/DPole.png", 'D-Pole'),
            _buildCard("assets/images/RAC.png", 'RAC'),
          ]),
          const SizedBox(height: 16),
          _buildCardRow([
            _buildCard("assets/images/Network.png", 'Network'),
            _buildCard("assets/images/Draft.png", 'Draft'),
            _buildCard("assets/images/History.png", 'History'),
          ]),
        ],
      ),
    );
  }

  Widget _buildCardRow(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: cards,
    );
  }

  Widget _buildCard(String iconData, String text) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: ImageIcon(AssetImage(iconData)),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 14, color: Color(0xFF7FBE42)),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphCardWidget extends StatefulWidget {
  const GraphCardWidget({super.key});

  @override
  State<GraphCardWidget> createState() => _GraphCardWidgetState();
}

class _GraphCardWidgetState extends State<GraphCardWidget> {
  List<Color> gradientColors = [Colors.cyan, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1.0),
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: LineChart(LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitleWidgets,
                      interval: 1,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 1,
                maxX: 7,
                minY: 0,
                maxY: 20,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 16),
                      FlSpot(2, 10),
                      FlSpot(3, 4),
                      FlSpot(4, 10),
                      FlSpot(5, 19),
                      FlSpot(6, 12),
                      FlSpot(7, 16),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 12),
                      FlSpot(2, 15),
                      FlSpot(3, 17),
                      FlSpot(4, 15),
                      FlSpot(5, 11),
                      FlSpot(6, 9),
                      FlSpot(7, 13),
                    ],
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 3),
                      FlSpot(2, 6),
                      FlSpot(3, 4),
                      FlSpot(4, 8),
                      FlSpot(5, 12),
                      FlSpot(6, 9),
                      FlSpot(7, 17),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 7),
                      FlSpot(2, 4),
                      FlSpot(3, 8),
                      FlSpot(4, 15),
                      FlSpot(5, 17),
                      FlSpot(6, 14),
                      FlSpot(7, 18),
                    ],
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColoredBox(Colors.red, "A55"),
                _buildColoredBox(Colors.green, "D-Pole"),
                _buildColoredBox(Colors.blue, "Network"),
                _buildColoredBox(Colors.orange, "RAC"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredBox(Color color, String text) {
    return Column(
      children: [
        Container(
          width: 14,
          height: 14,
          color: color,
        ),
        const SizedBox(height: 10),
        Text(
          text,
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 9,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('MON', style: style);
        break;
      case 2:
        text = const Text('TUE', style: style);
        break;
      case 3:
        text = const Text('WED', style: style);
        break;
      case 4:
        text = const Text('THR', style: style);
        break;
      case 5:
        text = const Text('FRI', style: style);
        break;
      case 6:
        text = const Text('SAT', style: style);
        break;
      case 7:
        text = const Text('SUN', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}

class DashboardCards extends StatelessWidget {
  const DashboardCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1.0),
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(30), // Add padding if needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/images/submitted.png", width: 24),
                const Text("24",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF7FBE42))),
                const Text("Submitted",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(91, 91, 91, 1.0))),
              ],
            ),
            // const SizedBox(width: 30),
            Column(
              children: [
                Image.asset("assets/images/InProgress.png", width: 24),
                const Text("24",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF7FBE42))),
                const Text("In Progress",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(91, 91, 91, 1.0))),
              ],
            ),
            // const SizedBox(width: 30),
            Column(
              children: [
                Image.asset("assets/images/Draft2.png", width: 24),
                const Text("24",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF7FBE42))),
                const Text("Draft",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(91, 91, 91, 1.0))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key, required this.press, required this.isMenuBarOpen})
      : super(key: key);

  final VoidCallback press;
  final bool isMenuBarOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        SizedBox(
          height: 40,
          width: 40,
          child: GestureDetector(
            child: IconButton(
              icon: isMenuBarOpen
                  ? const ImageIcon(
                      AssetImage("assets/images/Close.png"),
                      color: Colors.white,
                    )
                  : const ImageIcon(
                      AssetImage("assets/images/Drawer.png"),
                      color: Colors.white,
                    ),
              onPressed: press,
            ),
          ),
        ),

        // Spacer to create space between icon and text
        const SizedBox(width: 8),
        Text(
          isMenuBarOpen ? "" : "Dashboard",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
