import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black87,
      selectedItemColor: Colors.black87,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/inserts/"),
            child: Icon(
              Icons.add_box,
              color: Colors.green,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 0.1,
                )
              ],
            ),
          ),
          label: 'Inserção',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/outputs/"),
            child: Icon(
              Icons.equalizer,
              color: Colors.purple,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 0.1,
                )
              ],
            ),
          ),
          label: 'Visualização',
          backgroundColor: Colors.black87,
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/notices/"),
            child: Icon(
              Icons.public,
              color: Colors.blue.shade900,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 0.1,
                )
              ],
            ),
          ),
          label: 'Notícias',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/articles/"),
            child: Icon(
              Icons.newspaper,
              color: Colors.brown,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 0.1,
                )
              ],
            ),
          ),
          label: 'Artigos',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () => Modular.to.navigate("/settings/"),
            child: Icon(
              Icons.settings,
              color: Colors.grey,
              shadows: [
                Shadow(
                  color: Colors.black87,
                  blurRadius: 1,
                )
              ],
            ),
          ),
          label: 'Configuração',
          backgroundColor: Colors.black87,
        ),
      ],
    );
  }
}
