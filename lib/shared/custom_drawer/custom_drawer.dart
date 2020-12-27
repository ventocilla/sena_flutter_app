import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade100,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: [
              // Inicio --> Dash
              // Produtos --> Demandas
              // Meus Pedidos --> Minhas Demandas
              // Lojas --> Prioridade
              // Usuarios
              // Pedidos
              CustomDrawerHeader(),
              Divider(color: Colors.grey.shade700),
              DrawerTile(icon: Icons.home, title: 'Dashboard', page: 0),
              DrawerTile(icon: Icons.list, title: 'Demandas', page: 1),
              DrawerTile(icon: Icons.playlist_add_check, title: 'Minhas Demandas', page: 2),
              DrawerTile(icon: Icons.priority_high, title: 'Prioridade', page: 3),
            ],
          ),
        ],
      ),
    );
  }
}
