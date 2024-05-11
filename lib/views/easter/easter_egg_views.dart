import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class EasterEggPageViews extends StatefulWidget {
  const EasterEggPageViews({super.key});

  @override
  State<EasterEggPageViews> createState() => _EasterEggPageViewsState();
}

class _EasterEggPageViewsState extends State<EasterEggPageViews> {
  final controller =
      VideoPlayerController.asset('assets/images/pedropedro.mp4');

  @override
  void dispose() {
    controller.setVolume(0);
    controller.pause();
    controller.dispose();

    log('disposed', name: 'onDispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.initialize();
    controller.setLooping(true);
    controller.setVolume(1.0);
    controller.play();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            controller.setVolume(0);
            controller.pause();
            controller.dispose();

            Get.back();
          },
          child: const Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: VideoPlayer(controller),
      ),
    );
  }
}
