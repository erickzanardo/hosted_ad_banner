import 'package:flutter/material.dart';
import 'package:hosted_ad_banner/hosted_ad_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text('Imagine a super duper cool app here!'),
              ),
            ),
            HostedAdBanner(
              hostedAdds: const [
                HostedAdd(
                  targetUrl: 'https://julius-cherry-bit.web.app/',
                  imageUrls: [
                    'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/11/julius-1.png',
                  ],
                  backgroundColor: Color(0xffaadeac),
                ),
                HostedAdd(
                  targetUrl: 'https://g4me.info/mine',
                  imageUrls: [
                    'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/mco-2.png',
                  ],
                  backgroundColor: Colors.black,
                ),
                HostedAdd(
                  targetUrl: 'https://g4me.info/doug',
                  imageUrls: [
                    'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/gd-1.png',
                  ],
                  backgroundColor: Colors.black,
                ),
              ],
              width: MediaQuery.sizeOf(context).width,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
