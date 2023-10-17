part of com.devdennysegura.pokedex.components;

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;

  final opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);

    _controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(
        reverse: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _controller.value, // Esto toma un valor entre 0 y 1.
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: _controller, curve: Curves.easeInOut),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/pokeball.svg',
                    width: 200,
                  ),
                ),
              );
            },
          ),
          Opacity(
            opacity: 0.6,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.7, end: 1.1).animate(
                CurvedAnimation(parent: _controller1, curve: Curves.easeIn),
              ),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[100],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.4, end: 1.05).animate(
                CurvedAnimation(parent: _controller2, curve: Curves.easeInBack),
              ),
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
