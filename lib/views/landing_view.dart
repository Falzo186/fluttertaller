import '../controllers/note_controller.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool isOpen = false; // Estado para abrir/cerrar la barra lateral
  final NoteController _noteController = NoteController();

  @override
  void initState() {
    super.initState();
    _noteController.getNotes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Barra lateral
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isOpen ? 210 : 60,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.red, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    icon: Icon(isOpen ? Icons.arrow_back : Icons.menu),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });

                      NoteController().getNotes();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildMenuItem(
                  Icons.book,
                  "Proyectos",
                ),
                _buildMenuItem(
                  Icons.edit_note_rounded,
                  "Borradores",
                ),
                _buildMenuItem(
                  Icons.switch_access_shortcut_add_rounded,
                  "Compartido\nconmigo",
                ),
                const Spacer(),
                _buildMenuItem(
                  Icons.settings,
                  "Configuración",
                ),
              ],
            ),
          ),
          // Contenido principal
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Jesus 186',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.red,
                      ),
                      Spacer(),
                      Icon(
                        Icons.link,
                        size: 30,
                        color: Colors.red,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Compartir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los elementos del menú
  Widget _buildMenuItem(IconData icon, String title) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: isOpen ? 210 : 60,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(icon, color: Colors.red, size: 24),
              ),
              if (isOpen) ...[
                const SizedBox(width: 10), // Espacio entre icono y texto
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
