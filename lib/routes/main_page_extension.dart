import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/AppConfig.dart';
import 'package:wan_android_flutter/common/common_utils.dart';
import 'package:wan_android_flutter/common/route_config.dart';
import 'package:wan_android_flutter/providers/user_provider.dart';

final _tag = "MainDrawer";

class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainDrawerState();
  }
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Consumer<UserProvider>(
                  builder: (context, user, child) {
                    return InkWell(
                      onTap: () {
                        if (AppConfig.userName.isEmpty) {
                          Navigator.of(context).pushNamed(RouteName.login);
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: Text("退出登录"),
                                    content: Text("是否退出当前账号？"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("取消")),
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .updateUserInfo("", "");
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("确认"))
                                    ],
                                  ));
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 100,
                            ),
                          ),
                          Text(
                            AppConfig.userName.isEmpty
                                ? "未登录"
                                : AppConfig.userName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                )),
            Expanded(
              child: ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      if (AppConfig.userName.isEmpty) {
                        Navigator.of(context).pushNamed(RouteName.login);
                      } else {
                        Navigator.of(context).pushNamed(RouteName.collect);
                      }
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.favorite,
                      ),
                      title: Text('我的收藏'),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                          Navigator.of(context).pushNamed(RouteName.setting);
                      },
                      child: const ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('设置'),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
