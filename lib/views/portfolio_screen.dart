import 'package:flutter/material.dart';
import 'package:portfolio/models/constants.dart'; // Ensure this file contains primaryColor
import 'package:portfolio/models/navbar.dart';
import 'package:portfolio/models/project_screen.dart';
import 'package:portfolio/views/home.dart';
import 'package:portfolio/views/input.dart';
import 'package:portfolio/views/profile.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  // Tab and screen management
  int _currentIndex = 1;
  late TabController _tabController;

  // Search state
  String _searchQuery = '';

  // Screen navigation map for BottomNavBar
  final List<Widget> _screens = [
    HomeScreen(),
    PortfolioScreen(), // Placeholder for project screen
    InputScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Update the search query and rebuild the UI
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  /// Update the bottom navigation index
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Helper method to build the TabBar
  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: primaryColor,
      labelColor: primaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      tabs: const [
        Tab(text: "Project"),
        Tab(text: "Saved"),
        Tab(text: "Shared"),
        Tab(text: "Achievement"),
      ],
    );
  }

  /// Helper method to build the search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search projects...',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }

  /// Helper method to build the filter button
  Widget _buildFilterButton(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: MediaQuery.of(context).size.width / 2 - 40,
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle filter logic here
        },
        icon: const Icon(Icons.filter_list, color: Colors.white),
        label: const Text('Filter', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }

  /// Build the main content for the Portfolio tab
  Widget _buildPortfolioContent() {
    return Stack(
      children: [
        Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProjectScreen(searchQuery: _searchQuery),
                  const Center(child: Text('Saved Content')),
                  const Center(child: Text('Shared Content')),
                  const Center(child: Text('Achievement Content')),
                ],
              ),
            ),
          ],
        ),
        _buildFilterButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Portfolio",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              children: const [
                Icon(Icons.shopping_bag, color: primaryColor, size: 30),
                SizedBox(width: 15),
                Icon(Icons.notifications, color: primaryColor, size: 30),
              ],
            ),
          ),
        ],
        bottom: _currentIndex == 1 ? _buildTabBar() : null,
      ),
      body: _currentIndex == 1
          ? _buildPortfolioContent()
          : _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
