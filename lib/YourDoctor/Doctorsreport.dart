import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:medicalpat/YourDoctor/Reports.dart';
import 'package:medicalpat/YourDoctor/healthstat.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class DoctorReport extends StatefulWidget {
  final String Doctor;
  final String url;
  final String spec;
  final String Lastvis;

  const DoctorReport(
      {required this.Doctor,
      required this.url,
      required this.spec,
      required this.Lastvis});

  @override
  State<DoctorReport> createState() => _DoctorReportState();
}

class _DoctorReportState extends State<DoctorReport> {
  CarouselController _carouselController = new CarouselController();
  int _current = 0;

  List<dynamic> _movies = [
    {
      'title': 'Report-01',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/9/94/Report.png',
      'description': 'Day 01 Of the report and its stats is shown below'
    },
    {
      'title': 'Report-02',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/9/94/Report.png',
      'description': 'Day 02 Of the report and its stats is shown below'
    },
    {
      'title': 'Report-03',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/9/94/Report.png',
      'description': 'Day 03 Of the report and its stats is shown below'
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Center(
          child: Text(
            "Report By ${widget.Doctor}",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text('Generated Overall Report'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                Text(
                                    "Your overall report given by ${widget.Doctor} is summarized ",
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                // Text("Patient Mail",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .headline2),
                                // Text("Patient Id",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .headline2)
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          RaisedButton(
                              child: Text("Download Report"),
                              onPressed: () {
                                // your code
                                Fluttertoast.showToast(
                                    msg: "Downloading.....",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.red,
                                    fontSize: 16.0);
                                Navigator.of(context).pop();
                              })
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.picture_as_pdf,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.online_prediction_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Lottie.network(
                'https://assets9.lottiefiles.com/private_files/lf30_tx3i7fkf.json'),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ])),
              ),
            ),
            Positioned(
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: _movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  margin: EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                    movie['image'],
                                    // fit: BoxFit.values.first
                                  ),
                                ),
                                SizedBox(height: 0),
                                Text(
                                  movie['title'],
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                // rating
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                    movie['description'],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey.shade600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 10),
                                AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: _current == _movies.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.pie_chart,
                                                color: Colors.grey.shade600,
                                                size: 20,
                                              ),
                                              // SizedBox(width: 5),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BarChartSample2()),
                                                    );
                                                  },
                                                  child: Text(
                                                    "Health Stat",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.report,
                                                color: Colors.grey.shade600,
                                                size: 20,
                                              ),
                                              // SizedBox(width: 5),
                                              TextButton(
                                                  onPressed: () async {
                                                    final path =
                                                        'assets/medical.pdf';
                                                    final file =
                                                        await PDFApi.loadAsset(
                                                            path);
                                                    openPDF(context, file);
                                                  },
                                                  child: Text(
                                                    "Report",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    required this.file,
  });

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(name),
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller!.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller!.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file.path,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}
