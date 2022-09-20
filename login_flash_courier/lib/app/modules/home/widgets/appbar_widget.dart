import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_flash_courier/app/core/image/app_images.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  State<HomeAppbar> createState() => HomeAppbarState();
}

class HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color(0xFF29B6F6),
        ),
      ),
      title: Image.asset(
        AppImages.logotipo,
        width: 100,
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onTap: () {
              Fluttertoast.showToast(
                msg: "Sem ação no momento",
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 4,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
        ),
      ],
    );
  }
}
