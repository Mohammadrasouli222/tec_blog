import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/view/home_screen.dart';
import 'package:tec_blog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}

  final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {

  var selectedPageIndex = 0; //not


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width/10;


    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin,left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(Assets.images.dara.path,scale: 3,),
                  ) 
                  ),
            
                  ListTile(
                    title: Text("پروفایل کاربری",style: textTheme.bodyLarge,),
                    onTap: () {
                       
                    },
                  ),
            
                  Divider(
                    color: SolidColors.dividerColor,
                  ),
            
                  ListTile(
                    title: Text(" درباره داراکد",style: textTheme.bodyLarge,),
                    onTap: () {
                       
                    },
                  ),
            
                  Divider(
                    color: SolidColors.dividerColor,
                  ),
            
                  ListTile(
                    title: Text(" اشتراک گذاری داراکد",style: textTheme.bodyLarge,),
                    onTap: () {
                       
                    },
                  ),
            
                  Divider(
                    color: SolidColors.dividerColor,
                  ),
            
                  ListTile(
                    title: Text(" داراکد در گیت هاب",style: textTheme.bodyLarge,),
                    onTap: () {
                       
                    },
                  ),
            
                  Divider(
                    color: SolidColors.dividerColor,
                  ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title:
          //appbar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Icon(Icons.menu,color: Colors.black,)),

                    Assets.images.dara.image(height: size.height/8),
                    Icon(Icons.search,color: Colors.black),
                
                  ],
                ),
        ),
        body: Stack(
          children: [
          Positioned.fill(
          child: IndexedStack(
            index: selectedPageIndex,
            children: [
                HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin), //0
                ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin), //1
            ],
          )
          
          ),
          BottomNavigation(size: size, bodyMargin: bodyMargin, changeScreen: (int value){
            setState(() {
              selectedPageIndex = value;
            });
          }, ),

          ],

        ),  
        
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
      height: size.height/10,
      decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: GradientColors.bottomNavBackground,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
                ),
      child: Padding(
      padding: EdgeInsets.only(right: bodyMargin,left: bodyMargin),
      child: Container(
        height: size.height/8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
          colors: GradientColors.bottomNav
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (()=>changeScreen(0)),
            icon: ImageIcon(
              Assets.icons.home.image().image,
              color: Colors.white,
              )),
            
            IconButton(onPressed: ((){}),
            icon: ImageIcon(
              Assets.icons.write.image().image,
              color: Colors.white,
              )),
            
            IconButton(onPressed: (()=>changeScreen(1)),
            icon: ImageIcon(
              Assets.icons.user.image().image,
              color: Colors.white,
              )),
          ],
        ),
      ),
                ),
              ),
    );
  }
}



