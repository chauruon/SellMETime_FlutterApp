import 'package:flutter/material.dart';

class CustomShapedBottomNavigation extends StatefulWidget {
  const CustomShapedBottomNavigation({super.key});

  @override
  State<CustomShapedBottomNavigation> createState() => _CustomShapedBottomNavigationState();
}

class _CustomShapedBottomNavigationState extends State<CustomShapedBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 80,
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 80,
              // color: Colors.white,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  const Center(
                    heightFactor: 0.9,
                    child: FloatingActionButton(
                      onPressed: null,
                      backgroundColor: Colors.orange,
                      // elevation: 0.5,
                      child: Icon(Icons.shopping_basket),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: [
                        const IconButton(
                          onPressed: null, 
                          icon: Icon(Icons.home)
                        ),
                        const IconButton(
                          onPressed: null, 
                          icon: Icon(Icons.restaurant_menu)
                        ),
                        Container(width: size.width*0.20,),
                        const IconButton(
                          onPressed: null, 
                          icon: Icon(Icons.bookmark)
                        ),
                        const IconButton(
                          onPressed: null, 
                          icon: Icon(Icons.notifications)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    // bắt đầu từ trái sang phải
    // điểm bắt đầu
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    // điểm giữa
    path.arcToPoint(Offset(size.width*0.60, 20),radius: const Radius.circular(10.0),clockwise: false);
    // điểm kết thúc
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
  
}