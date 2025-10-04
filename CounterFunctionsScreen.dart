import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int _clickCounter = 0;

  // Métodos para manejar el estado
  void _resetCounter() {
    setState(() => _clickCounter = 0);
  }

  void _decrementCounter() {
    if (_clickCounter > 0) {
      setState(() => _clickCounter--);
    }
  }

  void _incrementCounter() {
    setState(() => _clickCounter++);
  }

  // Método para construir el texto del contador
  Widget _buildCounterText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_clickCounter',
          style: const TextStyle(
            fontSize: 160,
            fontWeight: FontWeight.w100,
          ),
        ),
        Text(
          _clickCounter == 1 ? 'Click' : 'Clicks',
          style: const TextStyle(fontSize: 25),
        ),
      ],
    );
  }

  // Método para construir los botones flotantes
  Widget _buildFloatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AleButton(
          icon: Icons.refresh_rounded,
          onPressed: _resetCounter,
        ),
        const SizedBox(height: 10),
        AleButton(
          icon: Icons.exposure_minus_1_rounded,
          onPressed: _decrementCounter,
        ),
        const SizedBox(height: 10),
        AleButton(
          icon: Icons.plus_one,
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _resetCounter,
          ),
        ],
      ),
      body: Center(
        child: _buildCounterText(),
      ),
      floatingActionButton: _buildFloatingButtons(),
    );
  }
}

// Widget personalizado para los botones
class AleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AleButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}