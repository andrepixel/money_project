import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/"),
            child: Icon(
              Icons.add_box,
            ),
          ),
          label: 'Inserção',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/"),
            child: Icon(Icons.equalizer),
          ),
          label: 'Visualização',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/"),
            child: Icon(Icons.public),
          ),
          label: 'Notícias',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/articles/"),
            child: Icon(Icons.newspaper),
          ),
          label: 'Artigos',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/settings/"),
            child: Icon(Icons.settings),
          ),
          label: 'Configuração',
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
