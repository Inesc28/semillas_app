import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layouts/base_layout.dart';

class VillageScreen extends StatelessWidget {
  final String leaderName;
  final String villageName;

  const VillageScreen({
    super.key, 
    required this.leaderName, 
    required this.villageName
  });

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundPath: 'assets/images/Conuco_bg.webp',
      child: Stack(
        children: [
          // Btn Home
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFD84315),
              onPressed: () => context.go('/'),
              child: const Icon(Icons.home_rounded, color: Colors.white, size: 30),
            ),
          ),

          // PANEL DE INFO DEL USUARIO
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF00695C),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFFFC107), width: 3),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.person, color: Color(0xFF00695C), size: 28),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Líder: $leaderName', 
                        style: const TextStyle(color: Color(0xFFFFC107), fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      Text(
                        'Aldea: $villageName', 
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Btns de navegacion
          Positioned(
            top: 20, right: 20, bottom: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navBtn(context, Icons.rowing, const Color(0xFF0288D1), '/curiara'),
                _navBtn(context, Icons.person_2_sharp, const Color(0xFFD84315), '/grandfather'),
                _navBtn(context, Icons.menu_book, const Color(0xFF388E3C), '/ebook'),
                _navBtn(context, Icons.workspace_premium, const Color(0xFFFF8F00), ''), // Sin ruta aún
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navBtn(BuildContext context, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () {
        if (route.isNotEmpty) context.push(route);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color, 
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [BoxShadow(color: Colors.black54, offset: Offset(0, 5))],
        ),
        child: Icon(icon, color: Colors.white, size: 36),
      ),
    );
  }
}