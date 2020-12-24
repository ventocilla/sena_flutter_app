import 'package:flutter/material.dart';
import 'package:sena_flutter_app/panels/world_wide_panel.dart';

// Worlwide GRID -->
// Most Affected Countries -->
// Info Section -->

// https://www.youtube.com/watch?v=XFGf_jMJSfw&list=PLJftqVZ-OFLhA4eUnRQfCQ4RfpOs6JPfR&index=1&t=479s

class HomePageTGD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.orange[100],
              padding: EdgeInsets.all(10),
              child: Text('Simulador SENA',
              style: TextStyle(color: Colors.orange[800],
              fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text('WorldWide', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            WorldWidePanel(),
          ],
        ),
      ),
    );
  }
}
