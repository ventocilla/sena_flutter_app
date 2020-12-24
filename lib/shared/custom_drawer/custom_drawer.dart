import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Inicio --> Dash
          // Produtos --> Demandas
          // Meus Pedidos --> Minhas Demandas
          // Lojas --> Prioridade
          // Usuarios
          // Pedidos
          DrawerTile(icon: Icons.home, title: 'Dashboard', page: 0),
          DrawerTile(icon: Icons.list, title: 'Demandas', page: 1),
          DrawerTile(icon: Icons.playlist_add_check, title: 'Minhas Demandas', page: 2),
          DrawerTile(icon: Icons.priority_high, title: 'Prioridade', page: 3),
        ],
      ),
    );
  }
}
