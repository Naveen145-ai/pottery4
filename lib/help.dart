import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  final List<Map<String, String>> helpTopics = [
    {'title': 'resetPassword'.tr, 'content': 'resetPasswordContent'.tr},
    {'title': 'enable2FA'.tr, 'content': 'enable2FAContent'.tr},
    {'title': 'contactSupport'.tr, 'content': 'contactSupportContent'.tr},
    {'title': 'FAQ'.tr, 'content': 'FAQContent'.tr},
    {'title': 'termsConditions'.tr, 'content': 'termsConditionsContent'.tr},
    {'title': 'privacyPolicy'.tr, 'content': 'privacyPolicyContent'.tr},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('helpSupportTitle'.tr),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HelpSearchDelegate(searchItems: helpTopics),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: helpTopics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(helpTopics[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailPage(
                    title: helpTopics[index]['title']!,
                    content: helpTopics[index]['content']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HelpDetailPage extends StatelessWidget {
  final String title;
  final String content;

  HelpDetailPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class HelpSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, String>> searchItems;

  HelpSearchDelegate({required this.searchItems});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = searchItems.where((item) => item['title']!.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView(
      children: results.map((item) {
        return ListTile(
          title: Text(item['title']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpDetailPage(
                  title: item['title']!,
                  content: item['content']!,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchItems.where((item) => item['title']!.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView(
      children: suggestions.map((item) {
        return ListTile(
          title: Text(item['title']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpDetailPage(
                  title: item['title']!,
                  content: item['content']!,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
