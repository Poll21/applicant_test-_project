import 'package:applicant_test_project/features/contacts/contacts.dart';
import 'package:applicant_test_project/features/posts/posts.dart';
import 'package:flutter/material.dart';

int _currentIndexItem = 0;
List<Widget> _views = [
  const PostsScreen(title: 'Posts'),
  const ContactsScreen(title: 'Contact')
];
Widget _view = _views[0];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void _onTapItem(int value) {
      setState(() {
        _currentIndexItem = value;
        _view = _views[value];
      });
    }

    return Scaffold(
      body: _view,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndexItem,
        onTap: _onTapItem,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Posts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
