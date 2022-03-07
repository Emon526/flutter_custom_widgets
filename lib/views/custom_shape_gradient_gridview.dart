import 'package:flutter/material.dart';

import '../model/category_model.dart';

class CustomShapeGridentGridView extends StatefulWidget {
  const CustomShapeGridentGridView({Key? key}) : super(key: key);

  @override
  State<CustomShapeGridentGridView> createState() =>
      _CustomShapeGridentGridViewState();
}

class _CustomShapeGridentGridViewState
    extends State<CustomShapeGridentGridView> {
  List<CategoryModel> categories = List.empty(growable: true);

  final lineargradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 240, 83, 25),
        Color(0xFFFFA000),
      ],
      stops: [
        0.0,
        1.0
      ],
      begin: FractionalOffset.topRight,
      end: FractionalOffset.bottomLeft,
      tileMode: TileMode.clamp);

  final List _selectedIndexs = [];
  @override
  void initState() {
    super.initState();
    categories.add(CategoryModel(
      "Animal",
      false,
      "https://picsum.photos/200/300",
    ));
    categories.add(CategoryModel(
      "Art & Culture",
      false,
      "https://picsum.photos/200/300",
    ));
    categories.add(CategoryModel(
      "Children & Youth",
      false,
      "assets/icons/children.png",
    ));
    categories.add(
      CategoryModel(
        "Community",
        false,
        "assets/icons/community.png",
      ),
    );
    categories.add(CategoryModel(
      "Disabilities",
      false,
      "assets/icons/disablities.png",
    ));
    categories.add(CategoryModel(
      "Education",
      false,
      "assets/icons/education.png",
    ));
    categories.add(CategoryModel(
      "Elderly",
      false,
      "assets/icons/elderly.png",
    ));
    categories.add(CategoryModel(
      "Environment",
      false,
      "assets/icons/environment.png",
    ));
    categories.add(CategoryModel(
      "Health & Diseases",
      false,
      "assets/icons/healing.png",
    ));
    categories.add(CategoryModel(
      "International",
      false,
      "assets/icons/international.png",
    ));
    categories.add(CategoryModel(
      "Poverty",
      false,
      "assets/icons/poverty.png",
    ));
    categories.add(CategoryModel(
      "Religion",
      false,
      "assets/icons/religion.png",
    ));
    categories.add(CategoryModel(
      "Human Rights",
      false,
      "assets/icons/humanright.png",
    ));
    categories.add(CategoryModel(
      "Rescue & Armed",
      false,
      "assets/icons/rescue.png",
    ));
    categories.add(CategoryModel(
      "Sport",
      false,
      "assets/icons/sport.png",
    ));
    categories.add(CategoryModel(
      "Other",
      false,
      "assets/icons/other.png",
    ));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        // height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: categories.length,
                itemBuilder: (ctx, index) {
                  final _isSelected = _selectedIndexs.contains(index);

                  return Container(
                    decoration: BoxDecoration(
                        gradient: _isSelected ? lineargradient : null,
                        color: _isSelected ? null : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: _isSelected
                            ? null
                            : Border.all(
                                width: 2,
                                color: _isSelected
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 240, 83, 25),
                              )),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          setState(() {
                            if (_isSelected) {
                              _selectedIndexs.remove(index);
                            } else {
                              _selectedIndexs.add(index);
                            }
                          });
                          for (var i = 0; i < _selectedIndexs.length - 1; i++) {
                            print(categories[i].name);
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(size.width * 0.04),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                      color: _isSelected
                                          ? Colors.white
                                          : const Color(0xFFFFA000),
                                      height: 26,
                                      image: NetworkImage(
                                          categories[index].iconname)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    categories[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            _isSelected
                                ? const Positioned(
                                    top: 12,
                                    left: 15,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ))
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
