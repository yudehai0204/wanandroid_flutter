/// @author ： 于德海
/// time ： 2024/2/20 19:03
/// desc ：
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android_flutter/common/route_config.dart';
import 'package:wan_android_flutter/common/wan_global.dart';
import 'package:wan_android_flutter/providers/collect_action_provider.dart';
import 'package:wan_android_flutter/providers/theme_provider.dart';
import 'package:wan_android_flutter/providers/user_provider.dart';
import 'package:wan_android_flutter/routes/classify_page.dart';
import 'package:wan_android_flutter/routes/home_page.dart';
import 'package:wan_android_flutter/routes/main_page_extension.dart';
import 'package:wan_android_flutter/routes/navigator_page.dart';
import 'package:wan_android_flutter/routes/project_page.dart';

import 'common/common_utils.dart';

void main() {
  Global.init().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CollectActionProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, theme, _child) {
          return MaterialApp(
            routes: globalRoutes,
            title: 'WanAndroidFlutter',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: theme.themeColor),
              useMaterial3: true,
            ),
            builder: EasyLoading.init(),
            initialRoute: RouteName.home,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageIndex = 0;
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Wan Android"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TestWidgetPage()));
                CommonUtils.showNoticeDialog(context, "搜索暂未开放",
                    title: "Search");
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (clickIndex) {
          setState(() {
            _pageIndex = clickIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '体系'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '导航'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward), label: '项目'),
        ],
      ),
      body: Center(
          child: Stack(
            children: [
              Visibility(
                  visible: _pageIndex == 0,
                  maintainState: true,
                  child: HomePage()),
              Visibility(
                  visible: _pageIndex == 1,
                  maintainState: true,
                  child: ClassifyPage()),
              Visibility(
                  visible: _pageIndex == 2,
                  maintainState: true,
                  child: NavigatorPage()),
              Visibility(
                  visible: _pageIndex == 3,
                  maintainState: true,
                  child: ProjectPage()),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFeedback();
        },
        tooltip: 'FeedBack',
        child: const Icon(Icons.feedback),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showFeedback() {
    //https://github.com/yudehai0204/wanandroid_flutter/issues
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("问题反馈"),
            content: Text("是否前往github界面提交issue"),
            actions: [
              TextButton(
                child: Text("是的"),
                onPressed: () {
                  launchUrl(Uri.parse("https://github.com/yudehai0204/wanandroid_flutter/issues"));
                  Navigator.of(context).pop();
                }, //关闭对话框
              ),
              TextButton(
                  child: Text("一会儿"),
                  onPressed: () {
                    // ... 执行删除操作
                    Navigator.of(context).pop(); //关闭对话框
                  })
            ],
          );
        });
  }
}
