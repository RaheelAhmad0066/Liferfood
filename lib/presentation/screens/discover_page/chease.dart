import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifer_food/core/utils/screen_size_config.dart';

class BurgerItemList extends StatefulWidget {
  @override
  _BurgerItemListState createState() => _BurgerItemListState();
}

class _BurgerItemListState extends State<BurgerItemList> {
  int? _selectedItemIndex;

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/bnd.png',
      'name': 'Sesame Seed Bun',
      'price': "\$1.59 ea"
    },
    {'image': 'assets/images/sauce.png', 'name': 'Sauce', 'price': "\$1.59 ea"},
    {
      'image': 'assets/images/beef.png',
      'name': 'Beef Patty',
      'price': "\$1.59 ea"
    },
    {
      'image': 'assets/images/cheeze.png',
      'name': 'Cheese',
      'price': "\$0.59 ea"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Material(
            // elevation: _selectedItemIndex == index ? 4.0 : 0.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                dense: true,
                leading: Image.asset(
                  items[index]['image'],
                  width: 40,
                  height: 40,
                ),
                title: Text(items[index]['name']),
                subtitle: Text(
                  "${items[index]['price']}",
                  style: TextStyle(
                    color: Color(
                      0xffFFB100,
                    ),
                  ),
                ),
                trailing: Container(
                  width: getProportionateScreenWidth(
                      75), // Adjust the width as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Add your logic for the "remove" action here
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: getProportionateScreenWidth(25),
                          height: getProportionateScreenHeight(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFB100),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: getProportionateScreenWidth(25),
                        height: getProportionateScreenHeight(25),
                        child: AutoSizeText(
                          "1", // Display the quantity or implement your logic
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: getProportionateScreenHeight(18),
                              color: Color(0xff272727)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add your logic for the "add" action here
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: getProportionateScreenWidth(25),
                          height: getProportionateScreenHeight(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFB100),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
