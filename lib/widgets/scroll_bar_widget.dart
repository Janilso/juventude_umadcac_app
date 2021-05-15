import 'package:flutter/material.dart';

const double _kScrollbarThickness = 6.0;

class ScrollBarWidget extends StatefulWidget {
  final ScrollableWidgetBuilder builder;
  final ScrollController scrollController;
  final Color color;

  const ScrollBarWidget({
    Key key,
    this.scrollController,
    this.color,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  @override
  _ScrollBarWidgetState createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  ScrollbarPainter _scrollbarPainter;
  ScrollController _scrollController;
  Orientation _orientation;
  bool _showScrollbar = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollPainter(_scrollController.position);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollbarPainter = _buildMaterialScrollbarPainter();
  }

  @override
  void dispose() {
    _scrollbarPainter.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset > 0.0 && !_showScrollbar) {
      setState(() {
        _showScrollbar = true;
      });
      _scrollbarPainter = _buildMaterialScrollbarPainter();
    }
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
        color: !_showScrollbar
            ? Colors.transparent
            : widget.color ?? Theme.of(context).highlightColor.withOpacity(1.0),
        textDirection: Directionality.of(context),
        thickness: _kScrollbarThickness,
        fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
        padding: MediaQuery.of(context).padding,
        radius: Radius.circular(5));
  }

  bool _updateScrollPainter(ScrollMetrics position) {
    _scrollbarPainter.update(
      position,
      position.axisDirection,
    );
    return false;
  }

  @override
  void didUpdateWidget(ScrollBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateScrollPainter(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        _orientation ??= orientation;
        if (orientation != _orientation) {
          _orientation = orientation;
          _updateScrollPainter(_scrollController.position);
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _updateScrollPainter(notification.metrics),
          child: CustomPaint(
            painter: _scrollbarPainter,
            child: widget.builder(context, _scrollController),
          ),
        );
      },
    );
  }
}
