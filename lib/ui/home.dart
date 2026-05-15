import 'package:flutter/material.dart';
import 'package:restaurant_ui/data/data.dart';
import 'package:restaurant_ui/ui/common_components/common_components.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Welcome Hala",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                Divider(),

                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text("Favorites"),
                ),

                ListTile(leading: Icon(Icons.history), title: Text("Orders")),

                ListTile(leading: Icon(Icons.person), title: Text("Profile")),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),

                Spacer(),

                Divider(),

                ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
            child: Column(
              children: [
                // top bar ------
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 27, 53, 65),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.menu_sharp, size: 28),
                          ),
                        );
                      },
                    ),
                    // left side ------------
                    SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Deliver To"),
                        PopupMenuButton<String>(
                          offset: Offset(0, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: const Color.fromARGB(255, 16, 31, 39),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(child: Text("Option 1")),
                              PopupMenuItem(child: Text("Option 2")),
                              PopupMenuItem(child: Text("Option 3")),
                            ];
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Hala lable office",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 55),

                    // right side-------------------------
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 27, 53, 65),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.shopping_bag_outlined, size: 32),
                        ),
                        Positioned(
                          right: -4,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hey Hala,"),
                      SizedBox(width: 8),
                      Text(
                        'Good After Noon',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),

                TextField(
                  decoration: InputDecoration(
                    hint: Text("Search dishes, restranses"),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color.fromARGB(255, 16, 31, 39),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SectionCategories(
                  title: "All Categories",
                  actionTitle: "See All",
                ),

                Padding(
                  padding: EdgeInsets.only(left: 6, top: 16, bottom: 16),
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final listOfCategories = categories[index];
                        return CategoriesList(
                          icon: listOfCategories.icon,
                          title: listOfCategories.title,
                        );
                      },
                    ),
                  ),
                ),

                const SectionCategories(
                  title: "Open Restrantes",
                  actionTitle: "See All",
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, top: 16, bottom: 16),
                    child: ListView.builder(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      itemCount: restrantData.length,
                      itemBuilder: (context, index) {
                        final listOfRestrants = restrantData[index];
                        return AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            double itemPosition = index * 220.0;
                            double scrollOffset = controller.hasClients
                                ? controller.offset
                                : 0;
                            double distance = (scrollOffset - itemPosition)
                                .abs();

                            double scale = (1 - (distance / 600)).clamp(
                              0.9,
                              1.1,
                            );
                            return Transform.scale(
                              scale: scale,
                              child: ResratnteItem(restrant: listOfRestrants),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
