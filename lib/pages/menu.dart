import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';
import 'gallery.dart';
import 'upload.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MainPageState();
  
  // Static method untuk navigasi dari child widgets
  static void navigateToPage(BuildContext context, int pageIndex) {
    final state = context.findAncestorStateOfType<_MainPageState>();
    state?._navigateToPage(pageIndex);
  }
}

class _MainPageState extends State<Menu> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _pages = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Tentang', 'icon': Icons.info},
    {'title': 'Galeri', 'icon': Icons.photo_library},
    {'title': 'Upload', 'icon': Icons.upload},
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.pop(context); // Close drawer
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png', // Placeholder
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.eco, color: Color(0xFF2E7D32), size: 32),
          ),
        ),
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, size: 28),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      
      // Hamburger Menu (End Drawer)
      endDrawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE8F5E9),
                Color(0xFFC8E6C9),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header Drawer
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E7D32),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.eco,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'REMPAH.ID',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Identifikasi Rempah',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF757575),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const Divider(thickness: 2, color: Color(0xFF2E7D32)),
                
                // Menu Items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final isSelected = _currentPage == index;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF2E7D32)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(
                            _pages[index]['icon'],
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2E7D32),
                            size: 28,
                          ),
                          title: Text(
                            _pages[index]['title'],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF2E7D32),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () => _navigateToPage(index),
                        ),
                      );
                    },
                  ),
                ),
                
                // Footer
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Divider(thickness: 2, color: Color(0xFF2E7D32)),
                      const SizedBox(height: 10),
                      Text(
                        '© 2024 REMPAH.ID',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: const [
          Home(),
          About(),
          Gallery(),
          Upload(),
        ],
      ),
    );
  }
}