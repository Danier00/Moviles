import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(const NotiApp());

class NotiApp extends StatelessWidget {
  const NotiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificación Animada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomePage(),
    );
  }
}

/// ------------------------------------------------------
/// PANTALLA PRINCIPAL
/// ------------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Route _routeTo(Widget page) {
    // Transición personalizada: slide sutil + fade
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 550),
      reverseTransitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slide = Tween<Offset>(begin: const Offset(0.10, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
        final fade = Tween<double>(begin: 0, end: 1)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return SlideTransition(position: slide, child: FadeTransition(opacity: fade, child: child));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.notifications_active_rounded),
          label: const Text('Ver notificación'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 6,
          ),
          onPressed: () => Navigator.of(context).push(_routeTo(const NotificationPage())),
        ),
      ),
    );
  }
}

/// ------------------------------------------------------
/// PANTALLA DE NOTIFICACIÓN
/// - La tarjeta entra cayendo desde arriba con rebote (física)
/// - Botón para reiniciar la animación
/// - “Deslizar para descartar” y salida animada al volver
/// ------------------------------------------------------
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // ✅ acotado 0..1 (no unbounded)
  late Animation<double> _translateY;   // caída y rebote vertical
  late Animation<double> _opacity;      // 0..1 garantizado
  bool _isExiting = false;

  // Límites para la animación vertical (píxeles)
  static const double _startY = -220.0; // fuera de pantalla hacia arriba
  static const double _endY = 0.0;      // posición final

  @override
  void initState() {
    super.initState();

    // ✅ Controller acotado para evitar overshoot en Opacity/withOpacity
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      value: 0.0,
    );

    _translateY = Tween(begin: _startY, end: _endY).animate(_controller);
    _opacity = _controller; // directamente 0..1

    _playEnter();
  }

  void _playEnter() {
    // Resorte: ajusta stiffness/damping para variar rebote
    final spring = SpringDescription(mass: 1.0, stiffness: 170.0, damping: 15.0);
    // 0 -> 1 con pequeña velocidad inicial positiva (impulso)
    final sim = SpringSimulation(spring, 0.0, 1.0, 1.0);
    _controller
      ..stop()
      ..value = 0.0
      ..animateWith(sim);
  }

  Future<void> _playExitAndPop() async {
    if (_isExiting) return;
    _isExiting = true;
    // Animación inversa: 1 -> 0 con velocidad negativa (sube y se va)
    final spring = SpringDescription(mass: 1.0, stiffness: 170.0, damping: 15.0);
    final sim = SpringSimulation(spring, 1.0, 0.0, -1.0);
    await _controller.animateWith(sim);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    await _playExitAndPop();
    return false; // cancelamos el pop nativo y lo hacemos tras la animación
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.secondaryContainer;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notificación'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: _playExitAndPop,
          ),
        ),
        body: Stack(
          children: [
            // Fondo: se atenúa con un leve overlay para destacar la tarjeta
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return Container(
                  color: Colors.black.withOpacity(0.10 * _opacity.value), // 0..1 seguro
                );
              },
            ),
            // Contenido centrado
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return Opacity(
                    opacity: _opacity.value, // 0..1 seguro
                    child: Transform.translate(
                      offset: Offset(0, _translateY.value),
                      child: _NotificationCard(
                        color: color,
                        onClose: _playExitAndPop,
                        onReplay: _playEnter,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final Color color;
  final VoidCallback onClose;
  final VoidCallback onReplay;

  const _NotificationCard({
    required this.color,
    required this.onClose,
    required this.onReplay,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const ValueKey('noti-card'),
      direction: DismissDirection.up, // deslizar hacia arriba para descartar
      // ✅ Interceptamos el dismiss: animamos salida y NO dejamos que Dismissible remueva el widget.
      confirmDismiss: (_) async {
        onClose();           // dispara animación + pop()
        return false;        // evitamos que Dismissible quite el widget (así no aparece el error)
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 360,
          constraints: const BoxConstraints(minHeight: 160),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(blurRadius: 16, color: Colors.black26, offset: Offset(0, 8))
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.notifications_active_rounded, size: 44),
              const SizedBox(height: 8),
              Text(
                'Nueva actualización',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                'Tu pedido #A123 fue enviado y llegará mañana entre 2–4 pm.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: onReplay,
                    icon: const Icon(Icons.replay_rounded),
                    label: const Text('Repetir'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: onClose,
                    icon: const Icon(Icons.close_rounded),
                    label: const Text('Cerrar'),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Desliza hacia arriba para descartar',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
