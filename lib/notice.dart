import 'dart:async';
import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({super.key});

  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;

  final List<String> _notices = [
    "Students are not required to pay any exam registration fees for the SWAYAM courses",
    "USIEF Fulbright-Nehru Fellowships: i. Master's, ii. Academic and Professional Excellence & iii. Postdoctoral Research; Apply for May-July 2025",
    "Manipur University MU Anthem",
    "Department of Environmental Science: Report of One Day",
  ];

  List<String> get _cyclicNotices => [..._notices, ..._notices];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    const waitDuration = Duration(seconds: 3);
    _scrollTimer = Timer.periodic(waitDuration, (_) => _autoScroll());
  }

  void _autoScroll() {
    if (!_scrollController.hasClients) return;

    const scrollDuration = Duration(milliseconds: 500);
    final itemHeight = 48.0;
    _currentIndex++;
    final scrollPosition = _currentIndex * itemHeight;

    _scrollController.animateTo(
      scrollPosition,
      duration: scrollDuration,
      curve: Curves.easeInOut,
    );

    if (_currentIndex >= _notices.length) {
      Future.delayed(scrollDuration, () {
        _scrollController.jumpTo(0);
        _currentIndex = 0;
      });
    }
  }

  void _pauseScroll() {
    _scrollTimer?.cancel();
  }

  void _resumeScroll() {
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 300,
          width: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "NOTICE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "All Notice",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.blue, thickness: 0.5),

              // Notice List with auto scroll and hover pause
              SizedBox(
                height: 200,
                child: MouseRegion(
                  onEnter: (_) => _pauseScroll(),
                  onExit: (_) => _resumeScroll(),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.white,
                        ],
                        stops: [0.0, 0.05, 0.95, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(
                        context,
                      ).copyWith(scrollbars: false),
                      child: ListView.separated(
                        controller: _scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _cyclicNotices.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        textStyle: WidgetStatePropertyAll(
                                          TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        overlayColor: WidgetStateProperty.all(
                                          Colors.transparent,
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        _cyclicNotices[index],
                                        style: TextStyle(
                                          fontSize: 13,

                                          // color: Colors.blue[900],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (index % 2 == 0)
                                    const Text(
                                      'New',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder:
                            (context, index) => const Divider(
                              color: Color.fromARGB(255, 218, 51, 51),
                              thickness: 0.2,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
