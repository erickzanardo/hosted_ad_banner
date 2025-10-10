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
              child: Center(child: Text('Image a super duper cool app here!'),),
            ),
            HostedAdBanner(
              hostedAdds: const [
                HostedAdd(
                  targetUrl: 'http://g4me.info/mine',
                  imageUrls: [
                    'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/mco-2.png',
                  ],
                ),
                HostedAdd(
                  targetUrl: 'http://g4me.info/doug',
                  imageUrls: [
                    'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/gd-1.png',
                  ],
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
