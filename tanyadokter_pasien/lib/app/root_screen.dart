import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/profile/ui/profile_screen.dart';
import 'package:tanyadokter_pasien/features/category_list/views/ui/category_screen.dart';
import 'package:tanyadokter_pasien/features/history/ui/history_screen.dart';
import 'package:tanyadokter_pasien/features/home/ui/home_screen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/root';
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomeScreen(),
        const CategoryScreen(),
        const HistoryScreen(),
        const ProfileScreen(),
      ][currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10.0,
        selectedIndex: currentScreenIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            selectedIcon: Icon(Icons.home_rounded, color: Colors.white),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_rounded),
            selectedIcon: Icon(Icons.list_rounded, color: Colors.white),
            label: 'Konsultasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_history_rounded),
            selectedIcon: Icon(Icons.work_history_rounded, color: Colors.white),
            label: 'Riwayat',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            selectedIcon:
                Icon(Icons.account_circle_rounded, color: Colors.white),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
