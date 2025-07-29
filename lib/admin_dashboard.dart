import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int selectedIndex = 0;

  final List<String> pageTitles = [
    "Dashboard",
    "User Management",
    "Courses",
    "Institutions",
    "Analytics",
    "Security",
    "Notifications",
    "Automation",
    "Certificates",
    "Localization",
    "Testing",
    "Materials",
    "Search & Filter",
  ];

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[selectedIndex]),
        backgroundColor: Colors.indigo,
      ),
      drawer: isWideScreen ? null : Drawer(child: _buildSidebar()),
      body: Row(
        children: [
          if (isWideScreen)
            Container(width: 250, child: _buildSidebar()),
          Expanded(child: _buildPageContent()),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return ListView.builder(
      itemCount: pageTitles.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(_getIconForIndex(index)),
          title: Text(pageTitles[index]),
          selected: selectedIndex == index,
          onTap: () => setState(() => selectedIndex = index),
        );
      },
    );
  }

  IconData _getIconForIndex(int index) {
    const icons = [
      Icons.dashboard,
      Icons.group,
      Icons.school,
      Icons.account_balance,
      Icons.bar_chart,
      Icons.security,
      Icons.notifications,
      Icons.settings_backup_restore,
      Icons.receipt,
      Icons.language,
      Icons.bug_report,
      Icons.folder,
      Icons.search,
    ];
    return icons[index];
  }

  Widget _buildPageContent() {
    switch (selectedIndex) {
      case 0: return _buildDashboardOverview();
      case 1: return _buildUserManagement();
      case 2: return _buildCoursesPage();
      case 3: return _buildInstitutionsPage();
      case 4: return _buildAnalyticsPage();
      case 5: return _buildSecurityPage();
      case 6: return _buildNotificationsPage();
      case 7: return _buildAutomationPage();
      case 8: return _buildCertificatesPage();
      case 9: return _buildLocalizationPage();
      case 10: return _buildTestingPage();
      case 11: return _buildMaterialsPage();
      case 12: return _buildSearchFilterPage();
      default: return const Center(child: Text("Page not found"));
    }
  }

  // 🧩 Sample placeholders
  Widget _buildDashboardOverview() => const Center(child: Text("📊 Dashboard Summary"));
  Widget _buildUserManagement() => const Center(child: Text("👥 Manage Users"));
  Widget _buildCoursesPage() => const Center(child: Text("📚 Course Oversight"));
  Widget _buildInstitutionsPage() => const Center(child: Text("🏛️ Institution Registration"));
  Widget _buildAnalyticsPage() => const Center(child: Text("📈 Platform Analytics"));
  Widget _buildSecurityPage() => const Center(child: Text("🛡️ Security Settings"));
  Widget _buildNotificationsPage() => const Center(child: Text("🔔 Notification Templates"));
  Widget _buildAutomationPage() => const Center(child: Text("🔄 System Automation"));
  Widget _buildCertificatesPage() => const Center(child: Text("🧾 Certificates Center"));
  Widget _buildLocalizationPage() => const Center(child: Text("🌍 Localization Settings"));
  Widget _buildTestingPage() => const Center(child: Text("🧪 Testing & QA Management"));
  Widget _buildMaterialsPage() => const Center(child: Text("📁 Content Oversight"));
  Widget _buildSearchFilterPage() => const Center(child: Text("🔍 Search & Filter Tools"));
}