import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

@RoutePage()
class ContactsScreen extends StatelessWidget {

  const ContactsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text(
            'Contacts',
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(64), child: SearchWidget()),
        ),
      ],
    );
  }
}
