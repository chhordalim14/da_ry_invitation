import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'MARCH',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.amber[700],

           
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // TOP SIDE LINES
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1, color: Colors.red)),
                    SizedBox(width: 160),
                    Expanded(child: Divider(thickness: 1, color: Colors.red)),
                  ],
                ),
              ),

              // CENTER TEXT (VERTICALLY CENTERED)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ON SUNDAY',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.amber[700],
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '08',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[700],

                      
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '05:00PM',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.amber[700],
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ],
              ),

              // BOTTOM SIDE LINES
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1, color: Colors.red)),
                    SizedBox(width: 160),
                    Expanded(child: Divider(thickness: 1, color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Text(
          '2026',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.amber[700],

           
          ),
        ),
      ],
    );
  }
}
