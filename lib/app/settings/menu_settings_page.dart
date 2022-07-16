import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class MenuSettingsPage extends StatelessWidget {
  const MenuSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ComponentPopWidget(
            title: "Configuração",
            path: "/",
          ),
          Divider(
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Text("Sobre"),
            leading: Icon(Icons.error),
            iconColor: Colors.black,
            textColor: Colors.black,
            onTap: () => Modular.to.navigate("/settings/about"),
          ),
          Divider(
            indent: 50,
            endIndent: 50,
          ),
          Text(
            "Money Project Version 1.0.0",
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
