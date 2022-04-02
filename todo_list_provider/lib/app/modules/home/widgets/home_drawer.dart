import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/ui/messages.dart';
import '../../../core/ui/theme_extensions.dart';
import '../../../services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  final nameVN = ValueNotifier<String>('');
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  builder: (_, value, __) {
                    return CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(value),
                    );
                  },
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        'https://br.advfn.com/p.php?pid=profilepic&user=dremcream';
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Selector<AuthProvider, String>(builder: (_, value, __) {
                      return Text(
                        value,
                        style: context.textTheme.subtitle2,
                      );
                    }, selector: (context, authProvider) {
                      return authProvider.user?.displayName ?? 'Não informado ';
                    }),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Alterar Nome'),
                    content: TextField(
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () async {
                            final nameValue = nameVN.value;
                            if (nameValue.isEmpty) {
                              Messages.of(context)
                                  .showError('Nome obrigatório');
                            } else {
                              await context
                                  .read<UserService>()
                                  .updateDisplayNamed(nameValue);
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Alterar')),
                    ],
                  );
                },
              );
            },
            title: const Text('Alterar Nome'),
          ),
          ListTile(
            onTap: () => context.read<AuthProvider>().logout(),
            title: const Text('sair'),
          ),
        ],
      ),
    );
  }
}
