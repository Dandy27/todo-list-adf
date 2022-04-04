import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/auth_provider.dart';
import '../ui/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Selector<AuthProvider, String>(
              builder: (_, value, __) {
                return Text('E ai, $value!',
                    style: context.textTheme.headline5
                        ?.copyWith(fontWeight: FontWeight.bold));
              },
              selector: (context, authProvider) =>
                  authProvider.user?.displayName ?? 'Não informado'),
        )
      ],
    );
  }
}
