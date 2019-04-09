import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/redux/hsman_state.dart';
import 'package:flutter_horseman/common/style/hsman_style.dart';
import 'package:flutter_horseman/common/utils/common_utils.dart';
import 'package:flutter_horseman/page/message_page.dart';
import 'package:flutter_horseman/page/mine_page.dart';
import 'package:flutter_horseman/page/order_page.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget{
  static final String sName = 'home';


  @override
  Widget build(BuildContext context) {

    return new HsManHomePage();
  }


}

class HsManHomePage extends StatefulWidget{
  @override
  _HsManHomePageSate createState() =>_HsManHomePageSate();

}
class _HsManHomePageSate extends State<HsManHomePage> {

  //当前选中页面索引
  var _currentIndex = 0;

  //聊天页面
  OrderPage orderPage;

  //好友页面
  MessagePage messagePage;

  //我的页面
  MinePage minePage;

  //根据当前索引返回不同的页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (orderPage == null) {
          orderPage = new OrderPage();
        }
        return orderPage;
      case 1:
        if (messagePage == null) {
          messagePage = new MessagePage();
        }
        return messagePage;
      case 2:
        if (minePage == null) {
          minePage = new MinePage();
        }
        return minePage;
      default:
    }
  }

  //渲染某个菜单项 传入菜单标题 图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          //判断是使用图片路径还是图标
          imagePath != null
              ? Image.asset(
            imagePath,
            width: 32.0,
            height: 32.0,
          )
              : SizedBox(
            width: 32.0,
            height: 32.0,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          //显示菜单项文本内容
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return  StoreBuilder<HSManState>(
      builder: (context,store){
        return Scaffold(
          //底部导航按钮
          bottomNavigationBar: new BottomNavigationBar(
            //通过fixedColor设置选中item 的颜色
            type: BottomNavigationBarType.fixed,
            //当前页面索引
            currentIndex: _currentIndex,
            //按下后设置当前页面索引
            onTap: ((index) {
              setState(() {
                _currentIndex = index;
              });
            }),
            //底部导航按钮项
            items: [
              //导航按钮项传入文本及图标
              new BottomNavigationBarItem(
                  title: new Text(
                    CommonUtils.getLocale(context).nav_order,
                    style: TextStyle(
                        color: _currentIndex == 0
                            ? Color(HSManColors.bottomNavigationTextPressed)
                            : Color(HSManColors.bottomNavigationTextNormal)),
                  ),
                  //判断当前索引作图片切换显示
                  icon: _currentIndex == 0
                      ? Image.asset(
                    'static/images/2x/home_pressed.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )
                      : Image.asset(
                    'static/images/2x/home_normal.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )),
              new BottomNavigationBarItem(
                  title: new Text(
                    CommonUtils.getLocale(context).nav_message,
                    style: TextStyle(
                        color: _currentIndex == 1
                            ? Color(HSManColors.bottomNavigationTextPressed)
                            : Color(HSManColors.bottomNavigationTextNormal)),
                  ),
                  icon: _currentIndex == 1
                      ? Image.asset(
                    'static/images/2x/message_pressed.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )
                      : Image.asset(
                    'static/images/2x/message_normal.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )),
              new BottomNavigationBarItem(
                  title: new Text(
                    CommonUtils.getLocale(context).nav_mine,
                    style: TextStyle(
                        color: _currentIndex == 2
                            ? Color(HSManColors.bottomNavigationTextPressed)
                            : Color(HSManColors.bottomNavigationTextNormal)),
                  ),
                  icon: _currentIndex == 2
                      ? Image.asset(
                    'static/images/2x/mine_pressed.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )
                      : Image.asset(
                    'static/images/2x/mine_normal.png',
                    width: HSManConstant.imageWidth,
                    height: HSManConstant.imageHeight,
                  )),
            ],
          ),
          //中间显示当前页面
          body: currentPage(),
        );
      },
    );
/*    return Scaffold(
      //底部导航按钮
      bottomNavigationBar: new BottomNavigationBar(
        //通过fixedColor设置选中item 的颜色
        type: BottomNavigationBarType.fixed,
        //当前页面索引
        currentIndex: _currentIndex,
        //按下后设置当前页面索引
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航按钮项
        items: [
          //导航按钮项传入文本及图标
          new BottomNavigationBarItem(
              title: new Text(
                CommonUtils.getLocale(context).nav_order,
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(HSManColors.bottomNavigationTextPressed)
                        : Color(HSManColors.bottomNavigationTextNormal)),
              ),
              //判断当前索引作图片切换显示
              icon: _currentIndex == 0
                  ? Image.asset(
                'static/images/2x/home_pressed.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )
                  : Image.asset(
                'static/images/2x/home_normal.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )),
          new BottomNavigationBarItem(
              title: new Text(
                CommonUtils.getLocale(context).nav_message,
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(HSManColors.bottomNavigationTextPressed)
                        : Color(HSManColors.bottomNavigationTextNormal)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                'static/images/2x/message_pressed.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )
                  : Image.asset(
                'static/images/2x/message_normal.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )),
          new BottomNavigationBarItem(
              title: new Text(
                CommonUtils.getLocale(context).nav_mine,
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(HSManColors.bottomNavigationTextPressed)
                        : Color(HSManColors.bottomNavigationTextNormal)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                'static/images/2x/mine_pressed.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )
                  : Image.asset(
                'static/images/2x/mine_normal.png',
                width: HSManConstant.imageWidth,
                height: HSManConstant.imageHeight,
              )),
        ],
      ),
      //中间显示当前页面
      body: currentPage(),
    );*/
  }

}