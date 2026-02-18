import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/page/event_list.dart';
import 'package:da_ry_invitation/services/audio_player_service.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/audio_player_widget.dart';
import 'package:da_ry_invitation/widget/bride_groom_section_widget.dart';
import 'package:da_ry_invitation/widget/english_invitaion_widget.dart';
import 'package:da_ry_invitation/widget/grid_view.dart';
import 'package:da_ry_invitation/widget/invitation_message_widget.dart';
import 'package:da_ry_invitation/widget/location_section_widget.dart';
import 'package:da_ry_invitation/widget/parent_section_widget.dart';
import 'package:da_ry_invitation/widget/scroll_fade.dart';
import 'package:da_ry_invitation/widget/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeddingPage extends StatefulWidget {
  const WeddingPage({super.key, this.guestName});
  final String? guestName;

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  late VideoPlayerController _controller;
  bool _showDetail = false; // Toggle UI
  late ScrollController _scrollController;
  double _scrollOffset = 0;
  final audioService = AudioPlayerService();
  @override
  void initState() {
    super.initState();

    // Listen to scroll
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    // // Initialize video controller
    _controller = VideoPlayerController.asset('assets/wedding_bg_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setVolume(0)
          ..setLooping(true)
          ..play();
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Widget scrollFadeText({
  //   required Widget child,
  //   required double start,
  //   required double end,
  //   Curve curve = Curves.easeOut,
  // }) {
  //   double opacity;

  //   if (_scrollOffset <= start) {
  //     opacity = 1;
  //   } else if (_scrollOffset >= end) {
  //     opacity = 0;
  //   } else {
  //     double progress = (_scrollOffset - start) / (end - start);
  //     opacity = 1 - curve.transform(progress);
  //   }

  //   return Opacity(opacity: opacity.clamp(0.0, 1.0), child: child);
  // }

  @override
  Widget build(BuildContext context) {
    // final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Video background
          if (_controller.value.isInitialized)
            FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          // FittedBox(fit: BoxFit.cover, child: VideoPlayer(_controller)),
          // /// Dark overlay for text visibility
          // Container(color: Colors.black.withValues(alpha: 0.25)),
          // Image.asset('assets/2dba3765c761716c018552c5351cff9d.jpg', fit: BoxFit.cover),

          /// Main content
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _showDetail
                  ? _buildDetailContent(context)
                  : _buildMainContent(context),
            ),
          ),
          Positioned(bottom: 40, right: 10, child: AudioPlayerButton()),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    // Using ResponsiveValue for dynamic sizing and spacing
    final containerWidth = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.of(context).size.width * 0.85,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.of(context).size.width * 0.6,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.of(context).size.width * 0.4,
        ),
      ],
    ).value;

    return SizedBox(
      // color: Colors.red,
      height: containerWidth * 1.2,
      child: Column(
        key: const ValueKey(1),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'សិរីមង្គលអាពាហ៏ពិពាហ៍',
            style: AppStyles.heading1(context).copyWith(
              color: Colors.amber[700],
              fontWeight: FontWeight.bold,
              fontFamily: 'Moulpali',
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(
            height: containerWidth * 0.4,
            child: Image.asset(
              'assets/wedding_frame_name_1.png',
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'សូមគោរពអញ្ជើញ',
            style: AppStyles.heading2(context).copyWith(
              color: Colors.amber[700],
              fontWeight: FontWeight.bold,
              fontFamily: 'Moulpali',
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.45,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/name_box.png',
                  fit: BoxFit.fill,
                  color: Colors.amber[700],
                ),
                Text(
                  widget.guestName?.capitalize() ?? 'ភ្ញៀវកិត្តិយស',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyText1(context).copyWith(
                    color: Colors.amber[700],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Moulpali',
                  ),
                ),
              ],
            ),
          ),

          /// Liquid Glass Button
          GestureDetector(
                onTap: () {
                  audioService.play();
                  setState(() {
                    _showDetail = true;
                  });
                },
                child: Container(
                  width: ResponsiveValue<double>(
                    context,
                    defaultValue: MediaQuery.sizeOf(context).height * 0.25,
                    conditionalValues: [
                      Condition.largerThan(
                        name: TABLET,
                        value: MediaQuery.sizeOf(context).height * 0.3,
                      ),
                      Condition.largerThan(
                        name: DESKTOP,
                        value: MediaQuery.sizeOf(context).width * 0.4,
                      ),
                    ],
                  ).value,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.amber[700],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.envelopeOpen,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
                      Flexible(
                        child: Text(
                          'សូមចុចបើកធៀប',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.bodyText(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Moulpali',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.05, 1.05),
                duration: 1.seconds,
                curve: Curves.easeInOut,
              ),
        ],
      ),
    );
  }

  // --- Refactored Detail Content Widgets ---

  Widget _buildInvitationHeader() {
    return ScrollFade(
      controller: _scrollController,
      start: ResponsiveValue<double>(
        context,
        defaultValue: 0,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 0),
          Condition.equals(name: TABLET, value: 100),
          Condition.equals(name: DESKTOP, value: 130),
        ],
      ).value,
      end: ResponsiveValue<double>(
        context,
        defaultValue: 100,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 100),
          Condition.equals(name: TABLET, value: 100),
          Condition.equals(name: DESKTOP, value: 230),
        ],
      ).value,
      child: Text(
        'សិរីសួស្តីអាពាហ៏ពិពាហ៍',
        style: AppStyles.heading1(context).copyWith(
          color: Colors.amber[700],
          fontWeight: FontWeight.bold,
          fontFamily: 'Moulpali',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEventTimeAndLocation() {
    return ScrollFade(
      controller: _scrollController,
      start: 400,
      end: 500,
      child: Text(
        'ថ្ងៃអាទិត្យ ៥រោច ខែផល្គុន ឆ្នាំម្សាញ់ សប្តស័ក ព.ស.២៥៦៩\nត្រូវនឹងថ្ងៃទី ០៨ ខែមីនា ឆ្នាំ ២០២៦ វេលាម៉ោង ៥:០០ល្ងាច នៅ សាខាកាកបាទក្រហមកម្ពុជា ខេត្តកណ្ដាល ដោយមេត្រីភាព ។\n(សូមអញ្ជើញពិនិត្យប្លង់) សូមអរគុណ !',
        style: AppStyles.bodyText1(
          context,
        ).copyWith(color: Colors.amber[700], fontFamily: 'KantumruyPro'),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    // 👉 Width control
    double contentWidth = screenWidth;

    if (isDesktop) {
      contentWidth = screenWidth * 0.5; // 60% on desktop
    } else if (isTablet) {
      contentWidth = screenWidth * 0.85; // optional tablet control
    } else {
      contentWidth = screenWidth; // full width on mobile
    }

    final verticalSpacing = ResponsiveValue<double>(
      context,
      defaultValue: 18,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: 18.0),
        Condition.equals(name: TABLET, value: 24.0),
        Condition.equals(name: DESKTOP, value: 28.0),
      ],
    ).value;

    return SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        key: const ValueKey(2),
        physics: const BouncingScrollPhysics(),
        child: Center(
          // 👈 important
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: contentWidth, // 👈 responsive width here
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: verticalSpacing,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: verticalSpacing * 4),
                  _buildInvitationHeader(),
                  SizedBox(height: verticalSpacing),
                  ParentSectionWidget(scrollController: _scrollController),
                  SizedBox(height: verticalSpacing),
                  InvitationMessage(scrollController: _scrollController),
                  SizedBox(height: verticalSpacing),
                  BrideAndGroomSection(scrollController: _scrollController),
                  SizedBox(height: verticalSpacing),
                  _buildEventTimeAndLocation(),
                  SizedBox(height: verticalSpacing * 4),
                  _buildScrollHint(verticalSpacing),

                  SizedBox(height: verticalSpacing * 5),
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 100,
                    end: 250,
                    child: EnglishInvitation(
                      scrollController: _scrollController,
                    ),
                  ),

                  SizedBox(height: verticalSpacing * 4),
                  WeddingProgramStepper(),

                  SizedBox(height: verticalSpacing * 4),
                  LocationSection(),

                  SizedBox(height: verticalSpacing * 4),

                  MasonryGridExample(),
                  SizedBox(height: verticalSpacing * 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollHint(double verticalSpacing) {
    double startFade = 100;
    double endFade = 250;

    double opacity;

    if (_scrollOffset <= startFade) {
      opacity = 1;
    } else if (_scrollOffset >= endFade) {
      opacity = 0;
    } else {
      double progress = (_scrollOffset - startFade) / (endFade - startFade);
      opacity = 1 - progress;
    }

    return Opacity(
      opacity: opacity.clamp(0.0, 1.0),
      child:
          Column(
                children: [
                  Icon(
                    FontAwesomeIcons.anglesUp,
                    color: Colors.amber[700],
                    size: 20,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Text(
                    'អូសឡើងលើ',
                    style: AppStyles.bodyText1(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shakeY(duration: Duration(seconds: 4), hz: 0.6),
    );
  }
}
