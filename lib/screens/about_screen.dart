import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/about_data.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _showMembers(BuildContext context, String title, List<Person> members) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _MemberBottomModal(title: title, members: members),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于我们'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)],
              ),
              child: Column(
                children: [
                  const Icon(LucideIcons.users, size: 48, color: Color(0xFF9C70FF)),
                  const SizedBox(height: 16),
                  Text(
                    '关于我们',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    aboutData.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionButton(
              context,
              '社区创建者',
              LucideIcons.crown,
              () => _showMembers(context, '社区创建者', aboutData.founders),
            ),
            _buildSectionButton(
              context,
              '社区原始成员',
              LucideIcons.heart,
              () => _showMembers(context, '社区原始成员', aboutData.originalMembers),
            ),
            _buildSectionButton(
              context,
              '网站制作与运营',
              LucideIcons.code,
              () => _showMembers(context, '网站制作与运营', aboutData.operators),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class _MemberBottomModal extends StatelessWidget {
  final String title;
  final List<Person> members;

  const _MemberBottomModal({required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20)],
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) => _buildMemberTile(members[index]),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              addSemanticIndexes: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberTile(Person person) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0,
      child: ListTile(
        dense: true,
        leading: _buildAvatar(person.avatar),
        title: Text(person.name),
        trailing: _buildSocialButtons(person),
      ),
    );
  }

  Widget _buildAvatar(String? path) {
    if (path == null) return const CircleAvatar(child: Icon(LucideIcons.user));
    
    return ClipOval(
      child: Image.asset(
        path,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        cacheWidth: 80,
        errorBuilder: (_, __, ___) => const CircleAvatar(child: Icon(LucideIcons.user)),
      ),
    );
  }

  Widget _buildSocialButtons(Person person) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (person.bilibili != null)
          IconButton(
            icon: const Icon(LucideIcons.tv, color: Colors.blue, size: 20),
            onPressed: () => launchUrl(Uri.parse(person.bilibili!)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
        if (person.douyin != null)
          IconButton(
            icon: const Icon(LucideIcons.music, color: Colors.black, size: 20),
            onPressed: () => launchUrl(Uri.parse(person.douyin!)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
      ],
    );
  }
}
