import 'package:bookburn/pages/book_matching_page.dart';
import 'package:bookburn/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatefulWidget {
  static String routeName = '/start';
  final plugin = VKLogin();
  StartPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future _sdkInitializationFuture;

  @override
  void initState() {
    super.initState();
    _sdkInitializationFuture = widget.plugin.initSdk('7751739');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 192),
              SvgPicture.asset("assets/icons/bookburn_logo.svg"),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: InkWell(
                  onTap: () {},
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF2F2F2)),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/icons/google_logo.svg"),
                          Spacer(),
                          Text(
                            "Войти через Google",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF222222),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: InkWell(
                  onTap: () async {
                    await _sdkInitializationFuture;

                    final res = await widget.plugin.logIn(scope: [
                      VKScope.email,
                    ]);

                    if (res.isError) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Log In failed: ${res.asError.error}'),
                        ),
                      );
                    } else {
                      final loginResult = res.asValue.value;
                      final profileRes = await widget.plugin.getUserProfile();
                      if (!loginResult.isCanceled)
                        Navigator.popAndPushNamed(context, BookMatchingPage.routeName);
                        // Navigator.popAndPushNamed(
                        //   context,
                        //   ProfilePage.routeName,
                        //   arguments: ProfileArguments(
                        //     profileRes?.asValue?.value,
                        //   ),
                        // );
                    }
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF2F2F2)),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/vk_logo.svg"),
                          Spacer(),
                          Text(
                            "Войти через Вконтакте",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF222222),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}