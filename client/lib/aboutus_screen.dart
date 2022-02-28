import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    const blue = Color(0xFF01579B);
    SizedBox hsb(val) => SizedBox(height: deviceHeight * val);
    Text h1Text(val) => Text(val,
        style: GoogleFonts.poppins(fontSize: deviceWidth * 0.08, color: blue));
    Text h2Text(val) => Text(val,
        style: GoogleFonts.poppins(
            fontSize: deviceWidth * 0.043,
            color: blue,
            fontWeight: FontWeight.w600));
    Text h3Text(val) => Text(val,
        style: GoogleFonts.poppins(
            fontSize: deviceWidth * 0.04, color: blue, letterSpacing: 1));
    final _linkedInUrls = <String, String>{
      'MOHIT': 'https://www.linkedin.com/in/mohit-kushwaha/',
      'ASHUTOSH': 'https://www.linkedin.com/in/ashutosh-sahu-0623b217a/',
      'SHIVANI': 'https://www.linkedin.com/in/shivaniraichandani/',
      'ROHAN': 'https://www.linkedin.com/in/rohan-maran-95237b15b/'
    };
    final _githubUrls = <String, String>{
      'MOHIT': 'https://github.com/mohit-codes',
      'ASHUTOSH': 'https://github.com/Ashuto7h',
      'SHIVANI': 'https://github.com/Shivani-Raichandani',
      'ROHAN': 'https://github.com/Rohan9433'
    };

    // ignore: always_declare_return_types
    _visitUrl(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('cannot visit url'); // ignore: avoid_print
      }
    }

    Widget teamTile(name, roll, linkedinUrl, githubUrl) =>
        Column(mainAxisSize: MainAxisSize.min, children: [
          h2Text(name),
          h3Text(roll),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => _visitUrl(linkedinUrl),
              child: const FaIcon(
                FontAwesomeIcons.linkedin,
                color: blue,
              ),
            ),
            SizedBox(width: deviceWidth * 0.02),
            GestureDetector(
                onTap: () => _visitUrl(githubUrl),
                child: const FaIcon(
                  FontAwesomeIcons.githubSquare,
                  color: blue,
                )),
            const Expanded(child: SizedBox()),
          ])
        ]);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [Color(0xFF4FC3F7), Color(0xFFE1F5FE)])),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hsb(0.04),

                          Container(
                            height: deviceHeight*0.06,
                            width: deviceWidth*0.95,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF01579B),
                                width: 4
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                'About Us',
                                style: GoogleFonts.poppins(
                                    fontSize: deviceWidth * 0.07,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF01579B)),
                              ),
                            ),
                          ),
                          hsb(0.02),
                          Text(
                            'This app is developed as a part of a Minor Project submitted in '
                            'partial fulfillment of requirement for '
                            'B.Tech. Degree in Computer Science and Engineering.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                                fontSize: deviceWidth * 0.035,
                                fontWeight: FontWeight.w400),
                          ),
                          hsb(0.02),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                    fontSize: deviceWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                text:
                                    'We would like to show our deepest sense of gratitude towards our project guide, ',
                                children: [
                                  TextSpan(
                                      text: "Dr. Vasima Khan",
                                      style: GoogleFonts.poppins(
                                          fontSize: deviceWidth * 0.044,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF01579B))),
                                  TextSpan(
                                    text:
                                        " (Assistant Professor, CSE Dept. SISTEC), ",
                                    style: GoogleFonts.poppins(
                                        fontSize: deviceWidth * 0.04,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text:
                                        'for guiding us and helping at each stage, achieving successful completion of this project. ',
                                    style: GoogleFonts.poppins(
                                        fontSize: deviceWidth * 0.04,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                          ),
                          hsb(0.015),
                          Container(
                            height: deviceHeight*0.05,
                            width: deviceWidth*0.95,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF01579B),
                                  width: 4,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                'Our Team',
                                style: GoogleFonts.poppins(
                                    fontSize: deviceWidth * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF01579B)),
                              ),
                            ),
                          ),
                          //h1Text('Our Team'),
                          hsb(0.0001),
                          GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: deviceWidth / 180,
                              children: [
                                teamTile(
                                    'Ashutosh Sahu',
                                    '0187CS181033',
                                    _linkedInUrls['ASHUTOSH'],
                                    _githubUrls['ASHUTOSH']),
                                teamTile(
                                    'Mohit Kushwaha',
                                    '0187CS181087',
                                    _linkedInUrls['MOHIT'],
                                    _githubUrls['MOHIT']),
                                teamTile(
                                    'Shivani Raichandani',
                                    '0187EC181039',
                                    _linkedInUrls['SHIVANI'],
                                    _githubUrls['SHIVANI']),
                                teamTile(
                                    'Rohan Maran',
                                    '0187CS171123',
                                    _linkedInUrls['ROHAN'],
                                    _githubUrls['ROHAN']),
                                //
                                //
                              ]),
                          Center(child: h2Text('6th Sem, CSE Dept. SISTEC GN')),
                          const Divider(),
                          hsb(0.01),
                          h3Text('View the source code on Github',),
                         // hsb(0.01),
                          InkWell(
                              onTap: () => _visitUrl(
                                  'https://github.com/Dragsters/Nutrihelp'),
                              child: const Text(
                                'https://github.com/Dragsters/Nutrihelp',
                                style: TextStyle(
                                    color: const Color(0xFF01579B),
                                    decoration: TextDecoration.underline),
                              )),
                          hsb(0.001),
                          h3Text('Licence : MIT '),
                          hsb(0.001),
                          h3Text(
                              'Report any Bug/Issue or a feature request at :'),
                          InkWell(
                              onTap: () => _visitUrl(
                                  'https://github.com/Dragsters/Nutrihelp/issues'),
                              child: const Text(
                                'https://github.com/Dragsters/Nutrihelp/issues',
                                style: TextStyle(
                                    color: const Color(0xFF01579B),
                                    decoration: TextDecoration.underline),
                              )),
                          hsb(0.1)
                        ])))));
  }
}
