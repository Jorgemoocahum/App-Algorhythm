
import 'package:flutter/material.dart';

void main() {
  runApp(const AlgoRhythmApp());
}

const verde = Color(0xFF21865B);
const verdeOscuro = Color(0xFF14543D);
const fondo = Color(0xFFF2F8F4);

class AlgoRhythmApp extends StatelessWidget {
  const AlgoRhythmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALGORHYTHM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: fondo,
        colorScheme: ColorScheme.fromSeed(seedColor: verde),
        appBarTheme: const AppBarTheme(
          backgroundColor: fondo,
          foregroundColor: verdeOscuro,
          elevation: 0,
        ),
      ),
      home: const Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int pagina = 0;

  final pantallas = const [
    InicioScreen(),
    MapaScreen(),
    MusicaScreen(),
    ProgresoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pantallas[pagina]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: pagina,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD8F0E1),
        onDestinationSelected: (index) {
          setState(() => pagina = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          NavigationDestination(
            icon: Icon(Icons.music_note_outlined),
            selectedIcon: Icon(Icons.music_note),
            label: 'Música',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Progreso',
          ),
        ],
      ),
    );
  }
}

// ---------------- INICIO ----------------

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ALGORHYTHM',
                    style: TextStyle(
                      color: verde,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.4,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '¡Hola, estudiante!',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: verdeOscuro,
                    ),
                  ),
                  Text('¿Qué vamos a lograr hoy?'),
                ],
              ),
            ),
            const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFD8F0E1),
              child: Icon(Icons.person, color: verdeOscuro, size: 30),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [verde, verdeOscuro],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TU META DE HOY',
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '75 de 100 minutos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 14),
              LinearProgressIndicator(
                value: 0.75,
                minHeight: 9,
                backgroundColor: Colors.white30,
                color: Color(0xFFB6F28A),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              SizedBox(height: 10),
              Text(
                '¡Ya alcanzaste el 75% de tu objetivo!',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Explora ALGORHYTHM',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 14),
        const TarjetaFuncion(
          icono: Icons.map,
          titulo: 'Mapa del campus',
          descripcion: 'Encuentra salones y calcula rutas.',
          color: Color(0xFFDDF1E3),
        ),
        const TarjetaFuncion(
          icono: Icons.headphones,
          titulo: 'Música para estudiar',
          descripcion: 'Encuentra tu ritmo de concentración.',
          color: Color(0xFFE8E2FA),
        ),
        const TarjetaFuncion(
          icono: Icons.insights,
          titulo: 'Mi progreso',
          descripcion: 'Consulta tus metas y estadísticas.',
          color: Color(0xFFFFEBD4),
        ),
        const SizedBox(height: 15),
        const Text(
          'Tu próxima meta',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 10),
        const Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.school, color: verde),
            title: Text('Completa 25 minutos de estudio'),
            subtitle: Text('Un pequeño paso cuenta.'),
          ),
        ),
      ],
    );
  }
}

// ---------------- TARJETAS ----------------

class TarjetaFuncion extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;
  final Color color;

  const TarjetaFuncion({
    super.key,
    required this.icono,
    required this.titulo,
    required this.descripcion,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(icono, color: verdeOscuro),
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(descripcion),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

// ---------------- MAPA ----------------

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  String destino = 'Biblioteca';

  final lugares = [
    'Biblioteca',
    'Laboratorios',
    'Cafetería',
    'Edificio A',
    'Servicios Escolares',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mapa del campus',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: verdeOscuro,
                ),
              ),
              SizedBox(height: 5),
              Text('Encuentra tu próximo destino.'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: DropdownButtonFormField<String>(
            value: destino,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: verde),
              hintText: '¿A dónde quieres ir?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            items: lugares.map((lugar) {
              return DropdownMenuItem(
                value: lugar,
                child: Text(lugar),
              );
            }).toList(),
            onChanged: (valor) {
              if (valor != null) {
                setState(() => destino = valor);
              }
            },
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFE4EFE2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: CampusPainter(),
                  ),
                ),
                const Positioned(
                  top: 24,
                  left: 20,
                  child: EtiquetaMapa(texto: 'Edificio A'),
                ),
                const Positioned(
                  top: 100,
                  right: 18,
                  child: EtiquetaMapa(texto: 'Laboratorios'),
                ),
                const Positioned(
                  bottom: 115,
                  left: 18,
                  child: EtiquetaMapa(texto: 'Cafetería'),
                ),
                Positioned(
                  top: 170,
                  left: 95,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: verde,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.my_location,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: FloatingActionButton.small(
                    heroTag: 'centrar_mapa',
                    backgroundColor: Colors.white,
                    foregroundColor: verde,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'El mapa real se integrará en la siguiente etapa.',
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.gps_fixed),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 17, 22, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Destino: $destino',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: verdeOscuro,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.directions_walk, color: verde),
                  SizedBox(width: 8),
                  Text('Ruta peatonal de ejemplo'),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: verde,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Destino seleccionado: $destino. '
                          'La ruta real se añadirá después.',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.directions),
                  label: const Text('Cómo llegar'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EtiquetaMapa extends StatelessWidget {
  final String texto;

  const EtiquetaMapa({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: verdeOscuro,
          fontSize: 12,
        ),
      ),
    );
  }
}

class CampusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final edificio = Paint()..color = const Color(0xFFBBD6B7);
    final camino = Paint()
      ..color = Colors.white
      ..strokeWidth = 23
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final ruta = Paint()
      ..color = verde
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawRect(
      Rect.fromLTWH(20, 35, size.width * 0.30, 65),
      edificio,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.62, 105, 100, 75),
      edificio,
    );
    canvas.drawRect(
      Rect.fromLTWH(20, size.height * 0.55, 95, 65),
      edificio,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.57, size.height * 0.65, 110, 65),
      edificio,
    );

    final recorrido = Path()
      ..moveTo(size.width * 0.30, 0)
      ..lineTo(size.width * 0.30, size.height * 0.25)
      ..lineTo(size.width * 0.65, size.height * 0.25)
      ..lineTo(size.width * 0.65, size.height * 0.48)
      ..lineTo(size.width * 0.40, size.height * 0.48)
      ..lineTo(size.width * 0.40, size.height * 0.85);

    canvas.drawPath(recorrido, camino);
    canvas.drawPath(recorrido, ruta);

    final arbol = Paint()..color = const Color(0xFF8EBB85);
    for (final punto in [
      Offset(size.width * 0.13, size.height * 0.28),
      Offset(size.width * 0.85, size.height * 0.35),
      Offset(size.width * 0.18, size.height * 0.78),
      Offset(size.width * 0.83, size.height * 0.82),
    ]) {
      canvas.drawCircle(punto, 12, arbol);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------- MÚSICA ----------------

class MusicaScreen extends StatefulWidget {
  const MusicaScreen({super.key});

  @override
  State<MusicaScreen> createState() => _MusicaScreenState();
}

class _MusicaScreenState extends State<MusicaScreen> {
  bool reproduciendo = false;
  String cancion = 'Concentración profunda';

  final canciones = [
    'Concentración profunda',
    'Programando sin distracciones',
    'Pausa y relajación',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Música para tu mente',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 6),
        const Text('Encuentra tu ritmo de estudio.'),
        const SizedBox(height: 24),
        Container(
          height: 230,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF8B7BD7), Color(0xFF41366F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: Icon(
              Icons.headphones,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Recomendado para ti',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 10),
        ...canciones.map((nombre) {
          return Card(
            color: Colors.white,
            elevation: 0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE8E2FA),
                child: Icon(Icons.music_note, color: verdeOscuro),
              ),
              title: Text(nombre),
              subtitle: const Text('Audio de ejemplo por integrar'),
              trailing: IconButton(
                icon: Icon(
                  cancion == nombre && reproduciendo
                      ? Icons.pause_circle
                      : Icons.play_circle,
                  color: verde,
                  size: 32,
                ),
                onPressed: () {
                  setState(() {
                    if (cancion == nombre && reproduciendo) {
                      reproduciendo = false;
                    } else {
                      cancion = nombre;
                      reproduciendo = true;
                    }
                  });
                },
              ),
            ),
          );
        }),
        const SizedBox(height: 15),
        Text(
          reproduciendo
              ? 'Seleccionado: $cancion'
              : 'Selecciona una lista para comenzar.',
          style: const TextStyle(color: verdeOscuro),
        ),
      ],
    );
  }
}

// ---------------- PROGRESO ----------------

class ProgresoScreen extends StatelessWidget {
  const ProgresoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dias = [
      ('Lun', 0.5),
      ('Mar', 0.8),
      ('Mié', 0.65),
      ('Jue', 0.9),
      ('Vie', 0.4),
      ('Sáb', 0.7),
      ('Dom', 0.3),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Mi progreso',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 6),
        const Text('Cada sesión te acerca a tu meta.'),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const Text(
                'META DIARIA',
                style: TextStyle(
                  color: verde,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 155,
                height: 155,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 0.75,
                      strokeWidth: 13,
                      backgroundColor: const Color(0xFFDCEBE0),
                      color: verde,
                      strokeCap: StrokeCap.round,
                    ),
                    const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '75%',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: verdeOscuro,
                            ),
                          ),
                          Text('Completado'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text('75 de 100 minutos de estudio'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(
              child: Estadistica(
                titulo: 'Tiempo',
                valor: '75 min',
                icono: Icons.timer_outlined,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Estadistica(
                titulo: 'Tareas',
                valor: '4',
                icono: Icons.task_alt,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Actividad semanal',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 175,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: dias.map((dia) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: FractionallySizedBox(
                              heightFactor: dia.$2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: verde,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dia.$1,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Tus objetivos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: verdeOscuro,
          ),
        ),
        const Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.flag, color: verde),
            title: Text('Estudiar 100 minutos'),
            subtitle: Text('75 minutos completados'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const SizedBox(height: 10),
        FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: verde,
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const RegistrarEstudioScreen(),
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Registrar sesión de estudio'),
        ),
      ],
    );
  }
}

class Estadistica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;

  const Estadistica({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: verde, size: 27),
          const SizedBox(height: 12),
          Text(titulo),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: verdeOscuro,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- REGISTRAR ESTUDIO ----------------

class RegistrarEstudioScreen extends StatefulWidget {
  const RegistrarEstudioScreen({super.key});

  @override
  State<RegistrarEstudioScreen> createState() =>
      _RegistrarEstudioScreenState();
}

class _RegistrarEstudioScreenState
    extends State<RegistrarEstudioScreen> {
  String materia = 'Programación';
  int minutos = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar estudio')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const Text(
            'Prepara tu próxima sesión',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: verdeOscuro,
            ),
          ),
          const SizedBox(height: 24),
          const Text('Materia'),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: materia,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
            items: [
              'Programación',
              'Bases de datos',
              'Desarrollo móvil',
              'Matemáticas',
              'Otra materia',
            ].map((m) {
              return DropdownMenuItem(value: m, child: Text(m));
            }).toList(),
            onChanged: (v) {
              if (v != null) setState(() => materia = v);
            },
          ),
          const SizedBox(height: 24),
          const Text('Duración de la sesión'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [25, 45, 60].map((m) {
              return ChoiceChip(
                label: Text('$m minutos'),
                selected: minutos == m,
                onSelected: (_) => setState(() => minutos = m),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: verde,
              padding: const EdgeInsets.all(17),
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text('Sesión preparada'),
                  content: Text(
                    'Materia: $materia\n'
                    'Duración seleccionada: $minutos minutos.\n\n'
                    'En la siguiente etapa agregaremos el temporizador '
                    'real y el guardado del progreso.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('Preparar sesión'),
          ),
        ],
      ),
    );
  }
}
