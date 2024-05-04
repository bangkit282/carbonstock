part of '../views.dart';

class RegisterWebViews extends StatefulWidget {
  const RegisterWebViews({super.key});

  @override
  State<RegisterWebViews> createState() => _RegisterWebViewsState();
}

class _RegisterWebViewsState extends State<RegisterWebViews> {
  late InAppWebViewController webViewController;

  InAppBrowserSettings options = InAppBrowserSettings(
    allowGoBackWithBackButton: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
