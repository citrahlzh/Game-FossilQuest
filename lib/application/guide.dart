import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: SizedBox(
            width: 1550,
            height: 800,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFF996028)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'CARA BERMAIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFFFE9D3),
                              fontFamily: 'Montserrat Bold',
                              fontSize: 45),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Image(
                                          image: AssetImage(
                                              '../../assets/images/guide/guide1.png')),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('1.',
                                                style: TextStyle(
                                                    color: Color(0xFFFFE9D3),
                                                    fontFamily:
                                                        'Montserrat Bold',
                                                    fontSize: 20)),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                  'Cari ciri ciri keberadaan fossil dengan meng-klik pada tanah.',
                                                  style: TextStyle(
                                                      color: Color(0xFFFFE9D3),
                                                      fontFamily:
                                                          'Montserrat Bold',
                                                      fontSize: 20)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Image(
                                          image: AssetImage(
                                              '../../assets/images/guide/guide2.png')),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('2.',
                                                style: TextStyle(
                                                    color: Color(0xFFFFE9D3),
                                                    fontFamily:
                                                        'Montserrat Bold',
                                                    fontSize: 20)),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                  'Jika sudah di temukan jawab pertanyaan.',
                                                  style: TextStyle(
                                                      color: Color(0xFFFFE9D3),
                                                      fontFamily:
                                                          'Montserrat Bold',
                                                      fontSize: 20)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
