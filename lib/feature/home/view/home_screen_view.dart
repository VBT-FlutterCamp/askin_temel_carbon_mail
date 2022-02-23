import 'package:email_inbox_cleaning_app/product/companents/text/app_text_strings.dart';
import 'package:flutter/material.dart';
import '../model/home_model.dart';
import '../service/home_service.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  HomeService _homeService = HomeService();
  List<HomeModel>? _homeModel;
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void init() async {
    _homeModel = await _homeService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: _headerHomePage(),
            ),
            Expanded(
              flex: 1,
              child: _middleRowHomePage(),
            ),
            Expanded(
              flex: 7,
              child: _listViewBuilder(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Align _headerHomePage() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        AppString().header,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Row _middleRowHomePage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppString().homeSubscriptions,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Container(
          width: 135,
          height: 34,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: const Color.fromARGB(64, 68, 137, 255),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              AppString().homeCleaned,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView _listViewBuilder() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.only(
              right: 0,
              left: 0,
              top: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              trailing: RightDeleteButton(),
              title: Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  _homeModel?[index].title ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  _homeModel?[index].body ?? '',
                  style: TextStyle(fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(),
      backgroundColor: Colors.white,
      enableFeedback: false,
      elevation: 0.0,
      mouseCursor: MouseCursor.uncontrolled,
      items: [
        BottomNavigationBarItem(
          activeIcon: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Icons.folder),
          ),
          icon: const Icon(Icons.folder),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Icons.settings_outlined),
          ),
          icon: const Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          activeIcon: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(Icons.show_chart),
          ),
          icon: const Icon(Icons.show_chart),
          label: 'Chart',
        ),
      ],
      selectedItemColor: Colors.blue,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}

class RightDeleteButton extends StatelessWidget {
  const RightDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.delete,
          color: Color.fromARGB(255, 33, 112, 248),
        ),
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromARGB(64, 68, 137, 255)),
    );
  }
}
