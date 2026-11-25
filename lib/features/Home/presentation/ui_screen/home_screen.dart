import 'package:flutter/material.dart';
import 'package:isco_bus/core/widgets/grediant_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double _navBarSpace = 84;
  static const double _compactNavBarSpace = 72;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final theme = Theme.of(context);
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;
            final compact = h < 700;
            final hPad = (w * 0.06).clamp(16.0, 26.0);
            final bottomInset = MediaQuery.paddingOf(context).bottom;
            final navClearance = compact ? _compactNavBarSpace : _navBarSpace;

            return Center(
              child: SizedBox(
                width: w.clamp(0.0, 520.0),
                child: Column(
                  children: [
                   
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          hPad,
                          compact ? 8 : 16,
                          hPad,
                          compact ? 6 : 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(context, compact),
                            SizedBox(height: compact ? 8 : 14),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "isco with you on\nuniversity journey!",
                                style: theme.textTheme.displayMedium!.copyWith(
                                  fontSize: compact ? 22 : null,
                                ),
                              ),
                            ),
                            SizedBox(height: compact ? 2 : 4),
                            Text(
                              "Are you going today?",
                              style: theme.textTheme.titleMedium!.copyWith(
                                fontSize: compact ? 14 : null,
                              ),
                            ),
                            SizedBox(height: compact ? 4 : 8),

                           
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, imgConstraints) {
                                  final imgH = imgConstraints.maxHeight;
                                  final imgW = imgConstraints.maxWidth;

                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                          height: compact
                                              ? imgH * 0.88
                                              : imgH * 0.72,
                                          width: imgW,
                                          child: Image.asset(
                                            "assets/images/باصص 1.png",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      if (!compact && imgH > 110)
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SizedBox(
                                            height: imgH * 0.36,
                                            child: Image.asset(
                                              "assets/images/Car.png",
                                              width: (imgW * 0.58)
                                                  .clamp(140.0, 230.0),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: compact ? 4 : 8),

                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "No Subscribe",
                                      maxLines: 1,
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                            fontSize: (w * 0.042).clamp(
                                              14.0,
                                              18.0,
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: compact ? 12 : 16,
                                    vertical: compact ? 4 : 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Subscribe Null",
                                      maxLines: 1,
                                      softWrap: false,
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                            color: theme.colorScheme.onPrimary,
                                            fontSize: compact ? 13 : null,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                   
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        (w * 0.05).clamp(16.0, 24.0),
                        compact ? 14 : 20,
                        (w * 0.05).clamp(16.0, 24.0),
                        (compact ? 10 : 14) + navClearance + bottomInset,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildRoute(context, compact),
                          SizedBox(height: compact ? 10 : 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildActionButton(
                                  context,
                                  "assets/images/location-location-pin-location-icon-transparent-free-png 1.png",
                                  "Drive Map",
                                  compact,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildActionButton(
                                  context,
                                  "assets/images/opop 1.png",
                                  "My QR Code",
                                  compact,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: compact ? 8 : 12),
                          SizedBox(
                            width: double.infinity,
                            height: compact ? 42 : 48,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "SUBSCRIBE NOW",
                                      maxLines: 1,
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                            color: theme.colorScheme.onPrimary,
                                            fontSize: compact ? 14 : null,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool compact) {
    final theme = Theme.of(context);
    final double boxH = compact ? 44 : 54;
    final lightGray = theme.colorScheme.surfaceContainerHighest;

    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(27),
            onTap: () {},
            child: Container(
              height: boxH,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(27),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: compact ? 15 : 19,
                    backgroundImage: const AssetImage("assets/images/OIP.png"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Gehad Wael",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: compact ? 14 : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          borderRadius: BorderRadius.circular(27),
          onTap: () {},
          child: Container(
            width: boxH,
            height: boxH,
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.circular(27),
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: compact ? 22 : 26,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoute(BuildContext context, bool compact) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 4),
            Image.asset(
              "assets/images/Group 16.png",
              width: compact ? 20 : 24,
              height: compact ? 20 : 24,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "assets/images/Line 3.png",
              width: 4,
              height: compact ? 36 : 50,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "assets/images/LocationMarker.png",
              width: compact ? 22 : 26,
              height: compact ? 22 : 26,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            children: [
              _buildPlaceRow(context, "Pickup", "Zagazig", compact),
              Padding(
                padding: EdgeInsets.symmetric(vertical: compact ? 3 : 7),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      "assets/images/Vector.png",
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              _buildPlaceRow(
                context,
                "Destination",
                "Zagazig National University",
                compact,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceRow(
    BuildContext context,
    String title,
    String value,
    bool compact,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.displayMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: compact ? 16 : 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.outline,
                  fontSize: compact ? 12 : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _buildCloseButton(context, compact),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String icon,
    String label,
    bool compact,
  ) {
    final theme = Theme.of(context);
    return GrediantButton(
      width: double.infinity,
      height: compact ? 42 : 48,
      borderRadius: 17,
      colors: [
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.onSurface,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: compact ? 18 : 20,
            height: compact ? 18 : 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                maxLines: 1,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.outline,
                  fontSize: compact ? 12 : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context, bool compact) {
    final size = compact ? 20.0 : 24.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.outline,
      ),
      child: Icon(
        Icons.close_sharp,
        color: Theme.of(context).colorScheme.onSurface,
        size: compact ? 11 : 13,
      ),
    );
  }
}