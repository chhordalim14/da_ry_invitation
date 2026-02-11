import 'dart:ui';
import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/page/count_down_date.dart';
import 'package:da_ry_invitation/page/event_list.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/date_divider_widget.dart';
import 'package:da_ry_invitation/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WeddingPage extends StatefulWidget {
  const WeddingPage({super.key});

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  late VideoPlayerController _controller;
  bool _showDetail = false; // Toggle UI

  @override
  void initState() {
    super.initState();

    // Initialize video controller
    _controller = VideoPlayerController.asset('assets/gif_background.MOV')
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setVolume(0)
          ..setLooping(true)
          ..play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Video background
          if (_controller.value.isInitialized)
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          /// Dark overlay for text visibility
          Container(color: Colors.black.withValues(alpha: 0.25)),

          /// Main content
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _showDetail
                  ? _buildDetailContent(context)
                  : _buildMainContent(context),
            ),
          ),
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
          breakpoint: 600,
          value: MediaQuery.of(context).size.width * 0.6,
        ),
        Condition.largerThan(
          breakpoint: 1024,
          value: MediaQuery.of(context).size.width * 0.4,
        ),
      ],
    ).value;

    // final containerHeight = ResponsiveValue<double>(
    //   context,
    //   defaultValue: MediaQuery.of(context).size.height * 0.6,
    //   conditionalValues: [
    //     Condition.largerThan(
    //       breakpoint: 600,
    //       value: MediaQuery.of(context).size.height * 0.5,
    //     ),
    //   ],
    // ).value;

    // final verticalSpacing = ResponsiveValue<double>(
    //   context,
    //   defaultValue: 24.0,
    //   conditionalValues: [Condition.largerThan(name: TABLET, value: 32.0)],
    // ).value;

    return Column(
      key: const ValueKey(1),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Frosted Glass Container
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'សិរីមង្គលអាពាហ៏ពិពាហ៍',
                style: AppStyles.heading2(context).copyWith(
                  color: Color.fromARGB(255, 208, 154, 16),
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(
                        255,
                        161,
                        118,
                        10,
                      ).withValues(alpha: 0.2),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                // textAlign: TextAlign.center,
              ),
              Text(
                'ឆដា & ធារី',
                style: AppStyles.heading1(context).copyWith(
                  color: Color.fromARGB(255, 208, 154, 16),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(
                        255,
                        161,
                        118,
                        10,
                      ).withValues(alpha: 0.2),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                // textAlign: TextAlign.center,
              ),
              Text(
                'សូមគោរពអញ្ជើញ',
                style: AppStyles.bodyText(context).copyWith(color: colorsApp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: containerWidth * 0.8,
                height: containerWidth * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/name_box.png', fit: BoxFit.fill),
                    Text("Lim Chhorda", style: AppStyles.bodyText(context)),
                  ],
                ),
              ),

              /// Liquid Glass Button
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showDetail = true;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.envelopeOpen,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text('បើកធៀប', style: AppStyles.buttonText(context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Refactored Detail Content Widgets ---

  Widget _buildInvitationHeader() {
    return Text(
      'សិរីសួស្តីអាពាហ៏ពិពាហ៍',
      style: AppStyles.heading1(context).copyWith(
        color: Colors.amber[700],
        // fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Moulpali',
        shadows: [
          Shadow(
            color: Color.fromARGB(255, 213, 164, 39),
            offset: Offset(3, 3),
            blurRadius: 2,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildParentsSection() {
    final textStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      // fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Moulpali',
      shadows: [
        Shadow(
          color: Color.fromARGB(255, 213, 164, 39),
          offset: Offset(3, 3),
          blurRadius: 2,
        ),
      ],
    );
    return ResponsiveRowColumn(
      layout: ResponsiveValue<ResponsiveRowColumnType>(
        context,
        defaultValue: ResponsiveRowColumnType.ROW,
        conditionalValues: [
          Condition.smallerThan(
            name: TABLET,
            value: ResponsiveRowColumnType.ROW,
          ),
        ],
      ).value,

      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,

      columnSpacing: 16,
      children: [
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('លោក លីម វាំងធី', style: textStyle),
              Text('លោកស្រី ហម សុផន', style: textStyle),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('លោក ហុក យ៉ុន', style: textStyle),
              Text('លោកស្រី ឈា ណាវី', style: textStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInvitationMessage() {
    return Column(
      children: [
        Text(
          'មានកិត្តិយសសូមគោរពអញ្ជើញ',
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            // fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 213, 164, 39),
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'សម្តេចទ្រង់ ឯកឧត្តម លោកអ្នកឧកញ៉ា អ្នកឧកញ៉ា កញ៉ា លោកជំទាវ លោកលោកស្រី អ្នកនាង កញ្ញា អញ្ជើញចូលរួមជាអធិបតី និងជាភ្ញៀវកិត្តិយស ដើម្បីប្រសិទ្ធិពរជ័យសិរីសួស្តី ជ័យមង្គល ក្នុងពិធីអាពាហ៍ពិពាហ៍ កូនប្រុស-កូនស្រីរបស់យើងខ្ញុំ',
          style: AppStyles.bodyText(context).copyWith(color: colorsApp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBrideAndGroomSection() {
    return ResponsiveRowColumn(
      layout: ResponsiveValue<ResponsiveRowColumnType>(
        context,
        defaultValue: ResponsiveRowColumnType.ROW,
        conditionalValues: [
          Condition.smallerThan(
            name: TABLET,
            value: ResponsiveRowColumnType.ROW,
          ),
        ],
      ).value,

      rowMainAxisAlignment: MainAxisAlignment.spaceAround,
      rowVerticalDirection: VerticalDirection.down,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,

      columnSpacing: 24,
      children: [
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              Text(
                'កូនប្រុសនាម',
                style: AppStyles.bodyText(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Text(
                'លឺម ឆដា',
                style: AppStyles.heading2(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Moulpali',
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(
              'assets/wedding_name.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              Text(
                'កូនស្រីនាម',
                style: AppStyles.bodyText(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Text(
                'យី សុធារី',
                style: AppStyles.heading2(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Moulpali',
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventTimeAndLocation() {
    return Text(
      'និងពិសាភោជនាហារដែលនឺងប្រព្រឹត្តទៅនៅ\nថ្ងៃអាទិត្យ ៥រោច ខែផល្គុន ឆ្នាំម្សាញ់ សប្តស័ក ព.ស.២៥៦៩ ត្រូវនឹងថ្ងៃទី ០៨ ខែមីនា ឆ្នាំ ២០២៦ វេលាម៉ោង ៥:០០ល្ងាច\nនៅ សាលាកាកបាទ​ក្រហមកម្ពុជា ខេត្តកណ្តាល ដោយមេត្រីភាព ។\n(សូមអញ្ជើញពិនិត្យប្លង់) សូមអរគុណ !',
      style: AppStyles.bodyText(context).copyWith(color: colorsApp),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEnglishInvitation() {
    final parentsTextStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      // fontSize: 18,
      fontWeight: FontWeight.bold,
      // fontFamily: 'Playball',
      shadows: [
        Shadow(
          color: Color.fromARGB(255, 213, 164, 39),
          offset: Offset(3, 3),
          blurRadius: 2,
        ),
      ],
    );

    return Column(
      children: [
        Text(
          'Wedding Ceremony',
          style: AppStyles.heading1(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
            // fontFamily: ,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 213, 164, 39),
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ResponsiveRowColumn(
          layout: ResponsiveValue<ResponsiveRowColumnType>(
            context,
            defaultValue: ResponsiveRowColumnType.ROW,
            conditionalValues: [
              Condition.smallerThan(
                name: TABLET,
                value: ResponsiveRowColumnType.ROW,
              ),
            ],
          ).value,

          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,

          columnSpacing: 16,
          children: [
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mr. LIM VANTHY', style: parentsTextStyle),
                  Text('Mrs. HAM SOPHAN', style: parentsTextStyle),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mr. HOK YONN', style: parentsTextStyle),
                  Text('Mrs. CHHEA NAVY', style: parentsTextStyle),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Cordially request the honor of your presence on the auspicious occasion of the wedding of our children',
          style: AppStyles.heading2(context).copyWith(
            color: colorsApp,
            fontSize: 25,
            fontFamily: 'Playball',
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ResponsiveRowColumn(
          layout: ResponsiveValue<ResponsiveRowColumnType>(
            context,
            defaultValue: ResponsiveRowColumnType.ROW,
            conditionalValues: [
              Condition.smallerThan(
                name: TABLET,
                value: ResponsiveRowColumnType.ROW,
              ),
            ],
          ).value,

          rowMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 8,
          children: [
            ResponsiveRowColumnItem(
              child: Text(
                'Lim Chhorda',
                style: AppStyles.heading1(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TwinkleStar',
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                ' & ',
                style: AppStyles.heading1(
                  context,
                ).copyWith(color: Colors.amber[700], fontFamily: 'TwinkleStar'),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                'Yi Sotheary',
                style: AppStyles.heading1(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TwinkleStar',
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 213, 164, 39),
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        DateDivider(),
        const SizedBox(height: 32),
        Text(
          'AT CAMBODIAN RED CROSS KANDAL. BRANCH\n(PLEASE SEE THE MAP)\nTHANK YOU!',
          style: AppStyles.bodyText(context).copyWith(color: colorsApp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFooterSection() {
    return Column(
      children: [
        CountdownTimer(
          targetDate: DateTime(2026, 3, 7, 7, 0), // adjust time if needed
        ),
        const SizedBox(height: 32),
        WeddingProgramStepper(),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      children: [
        Text(
          'ទីតាំងពិធីអាពាហ៍ពិពាហ៍ / Location',
          style: AppStyles.heading2(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 213, 164, 39),
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber[700]!, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/qr_code.png', fit: BoxFit.contain),
        ),
      ],
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    // Responsive padding
    final horizontalPadding = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      conditionalValues: [Condition.largerThan(breakpoint: 1024, value: 120.0)],
    ).value;

    final verticalSpacing = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      conditionalValues: [
        Condition.largerThan(breakpoint: 600, value: 32.0),
        Condition.largerThan(breakpoint: 1024, value: 40.0),
      ],
    ).value;

    return SafeArea(
      child: SingleChildScrollView(
        key: const ValueKey(2),
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalSpacing,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: verticalSpacing * 3),
            _buildInvitationHeader(),
            SizedBox(height: verticalSpacing),
            _buildParentsSection(),
            SizedBox(height: verticalSpacing),
            _buildInvitationMessage(),
            SizedBox(height: verticalSpacing),
            _buildBrideAndGroomSection(),
            SizedBox(height: verticalSpacing),
            _buildEventTimeAndLocation(),
            SizedBox(height: verticalSpacing * 2),
            _buildEnglishInvitation(),
            SizedBox(height: verticalSpacing * 2),
            _buildFooterSection(),
            SizedBox(height: verticalSpacing * 2),
            _buildLocationSection(),
            SizedBox(height: verticalSpacing * 2),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(
                  'https://maps.app.goo.gl/C5WmLrh2ZXjV9rNw6',
                );
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.blueAccent.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.envelopeOpen,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'ចុចមើលទីតាំង',
                          style: AppStyles.buttonText(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: verticalSpacing * 2),
            Text(
              'វិចិត្រសាល',
              style: AppStyles.heading2(context).copyWith(
                color: Colors.amber[700],
                // fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 213, 164, 39),
                    offset: Offset(3, 3),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: verticalSpacing * 2),
            MasonryGridExample(),
            SizedBox(height: verticalSpacing * 3),
          ],
        ),
      ),
    );
  }
}
