import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';

class FabWithIcons extends GetView<BottomAppBarController> {
  const FabWithIcons({Key? key, required this.onIconTapped}) : super(key: key);

  final ValueChanged<int> onIconTapped;

  @override
  Widget build(BuildContext context) {
    Get.find<BottomAppBarController>();

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: controller.animationController,
                curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
              ),
              child: FloatingActionButton(
                backgroundColor: Get.theme.backgroundColor,
                mini: true,
                child: Icon(Icons.add, color: Get.theme.primaryColorDark),
                onPressed: () => controller.addTask(),
              ),
            ),
          ),
          _buildFab(),
        ]);
  }

  Widget _buildFab() {
    Strings str = Strings();
    return FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          controller.updateIndex(5);
        },
        backgroundColor: Colors.transparent,
        child: Obx(() => Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: ThemeService().floatingABGradient,
                  boxShadow: controller.fabClicked.value
                      ? [
                          BoxShadow(
                            color: Get.theme.primaryColorDark.withOpacity(0.16),
                            spreadRadius: 0,
                            blurRadius: 8,
                            blurStyle: BlurStyle.solid,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]
                      : []),
              child: SizedBox(
                height: 32,
                width: 32,
                child: SvgPicture.asset(
                  str.todoSvg,
                  color: Colors.black,
                  fit: BoxFit.none,
                ),
              ),
            )));
  }
}

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget Function(BuildContext, Offset anchor) overlayBuilder;
  final Widget child;

  const AnchoredOverlay({
    Key? key,
    required this.showOverlay,
    required this.overlayBuilder,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OverlayBuilder(
        showOverlay: showOverlay,
        overlayBuilder: (BuildContext overlayContext) {
          RenderBox box = context.findRenderObject() as RenderBox;
          final center =
              box.size.center(box.localToGlobal(const Offset(0.0, 0.0)));

          return overlayBuilder(overlayContext, center);
        },
        child: child,
      );
    });
  }
}

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Widget Function(BuildContext) overlayBuilder;
  final Widget child;

  const OverlayBuilder({
    Key? key,
    this.showOverlay = false,
    required this.overlayBuilder,
    required this.child,
  }) : super(key: key);

  @override
  _OverlayBuilderState createState() => _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }

    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: widget.overlayBuilder,
    );
    addToOverlay(overlayEntry!);
  }

  void addToOverlay(OverlayEntry entry) async {
    print('addToOverlay');
    Overlay.of(context)?.insert(entry);
  }

  void hideOverlay() {
    print('hideOverlay');
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  CenterAbout({
    Key? key,
    required this.position,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: child,
      ),
    );
  }
}
