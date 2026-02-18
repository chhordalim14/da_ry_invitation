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
import 'package:da_ry_invitation/widget/scroll_hint_widget.dart';
import 'package:da_ry_invitation/widget/scroll_reveal.dart';
import 'package:da_ry_invitation/widget/thank_you_widget.dart';
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
  late ScrollController _scrollController;
  final audioService = AudioPlayerService();

  bool _showDetail = false;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });

    _controller = VideoPlayerController.asset('assets/wedding_bg_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setLooping(true)
          ..setVolume(0)
          ..play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;
    final isTablet = breakpoints.isTablet;

    return Scaffold(
      body: Stack(
        children: [
          /// 🎥 Background Video (Proper Scaling)
          if (_controller.value.isInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          // /// 🌑 Elegant Overlay
          // Positioned.fill(
          //   child: Container(color: Colors.black.withValues(alpha: 0.25)),
          // ),

          /// 📜 Content Switcher
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _showDetail
                ? _buildDetailContent(context, isDesktop, isTablet)
                : _buildMainContent(context, isDesktop),
          ),

          /// 🔊 Audio Button
          const Positioned(bottom: 40, right: 20, child: AudioPlayerButton()),
        ],
      ),
    );
  }

  // ==========================================================
  // 🏠 MAIN SCREEN
  // ==========================================================

  Widget _buildMainContent(BuildContext context, bool isDesktop) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    final maxWidth = isDesktop ? 700.0 : screenWidth;

    return Center(
      key: const ValueKey(1),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'សិរីមង្គលអាពាហ៍ពិពាហ៍',
                  textAlign: TextAlign.center,
                  style: AppStyles.heading2(
                    context,
                  ).copyWith(color: Colors.amber[700], fontFamily: 'Moulpali'),
                ),

                const SizedBox(height: 40),

                Image.asset(
                  'assets/wedding_frame_name_1.png',
                  height: screenHeight * 0.22,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 30),

                Text(
                  'សូមគោរពអញ្ជើញ',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyText(
                    context,
                  ).copyWith(color: Colors.amber[700], fontFamily: 'Moulpali'),
                ),

                const SizedBox(height: 25),

                _buildGuestBox(context),

                const SizedBox(height: 40),

                _buildOpenButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGuestBox(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final horizontalPadding = screenWidth * 0.25;
    final verticalPadding = screenHeight * 0.02;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(
          //   screenWidth * 0.02,
          // ), // radius responsive
          image: const DecorationImage(
            image: AssetImage('assets/name_box_1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          widget.guestName?.capitalize() ?? 'ភ្ញៀវកិត្តិយស',
          textAlign: TextAlign.center,
          style: AppStyles.bodyText2(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'Moulpali',
            // fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  Widget _buildOpenButton(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Responsive width
    final buttonWidth = ResponsiveValue<double>(
      context,
      defaultValue: screenWidth * 0.7, // mobile default
      conditionalValues: [
        Condition.largerThan(name: MOBILE, value: screenWidth * 0.5),
        Condition.largerThan(name: TABLET, value: screenWidth * 0.35),
        Condition.largerThan(
          name: DESKTOP,
          value: 280,
        ), // keep original for desktop
      ],
    ).value;

    // Responsive height
    final buttonHeight = ResponsiveValue<double>(
      context,
      defaultValue: screenHeight * 0.06, // mobile default
      conditionalValues: [
        Condition.largerThan(name: MOBILE, value: screenHeight * 0.055),
        Condition.largerThan(name: TABLET, value: screenHeight * 0.05),
        Condition.largerThan(name: DESKTOP, value: 50),
      ],
    ).value;

    return GestureDetector(
          onTap: () {
            audioService.play();
            setState(() => _showDetail = true);
          },
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              color: Colors.amber[700],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.envelopeOpen,
                  size: 18,
                  color: Colors.white,
                ),
                SizedBox(width: screenWidth * 0.02),
                Flexible(
                  child: Text(
                    'សូមចុចបើកធៀប',
                    textAlign: TextAlign.center,
                    style: AppStyles.buttonText(context),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.05, 1.05),
          duration: 1.seconds,
        );
  }

  // ==========================================================
  // 📜 DETAIL SCREEN
  // ==========================================================

  Widget _buildDetailContent(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
  ) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    double maxWidth = screenWidth;
    if (isDesktop)
      maxWidth = 900;
    else if (isTablet)
      maxWidth = 700;

    return SafeArea(
      key: const ValueKey(2),
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 100,
              ),
              child: Column(
                children: [
                  Text(
                    'សិរីសួស្តីអាពាហ៍ពិពាហ៍',
                    textAlign: TextAlign.center,
                    style: AppStyles.heading2(context).copyWith(
                      color: Colors.amber[700],
                      fontFamily: 'Moulpali',
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Parent Section
                  ParentSectionWidget(scrollController: _scrollController),

                  const SizedBox(height: 40),

                  // Invitation Message
                  InvitationMessage(scrollController: _scrollController),

                  const SizedBox(height: 40),

                  // Bride & Groom Section
                  BrideAndGroomSection(scrollController: _scrollController),

                  const SizedBox(height: 150),

                  ScrollHint(scrollOffset: _scrollOffset),
                  const SizedBox(height: 40),

                  // English Invitation
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 100,
                    end: 250,
                    child: EnglishInvitation(
                      scrollController: _scrollController,
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Wedding Program Stepper
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 1500,
                    end: 1850,
                    child: WeddingProgramStepper(),
                  ),

                  const SizedBox(height: 80),

                  // Location Section
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 2800,
                    end: 3050,
                    child: LocationSection(),
                  ),

                  const SizedBox(height: 80),

                  // Masonry Grid Gallery
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 3000,
                    end: 3250,
                    child: MasonryGridExample(),
                  ),
                  const SizedBox(height: 80),
                  ScrollPullReveal(
                    controller: _scrollController,
                    start: 4700,
                    end: 4950,
                    child: ThankYouWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
