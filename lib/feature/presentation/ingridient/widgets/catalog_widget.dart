import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/presentation/home/widgets/card_catalog_widget.dart';
import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  CatalogWidget({
    Key? key,
    required this.toCatalog,
    required this.toHome,
    required this.isFilter,
    required this.tapFilter,
    required this.tapCatalog,
    required this.tapBottomNavigationBar,
    required this.selectedIndex,
    required this.catalog,
  }) : super(key: key);

  final Function toCatalog;
  final Function toHome;
  final bool isFilter;
  final Function tapFilter;
  final Function tapCatalog;
  final Function tapBottomNavigationBar;
  final CatalogEntity catalog;
  int selectedIndex = 0;
  bool _isIndex = true;

  @override
  Widget build(BuildContext context) {
    catalog.name == 'Кулинарная книга' ? _isIndex = true : _isIndex = false;
    print('${catalog.name} -- $catalog');
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/background/back_home.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.14,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/bac_app_bar.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _isIndex
                          ? SizedBox.fromSize()
                          : IconButton(
                              onPressed: () => toHome(),
                              icon: const Icon(Icons.arrow_back),
                            ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          catalog?.name ?? '',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff322316),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 35,
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    maxLines: 1,
                    style: const TextStyle(fontSize: 14, height: 0.25),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 10),
                      hintText: 'Введите рецепт',
                      suffixIcon: IconButton(
                        onPressed: () => print('suffixIcon'),
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xff322316),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            itemCount: catalog.catalogs?.length ?? 0,
            itemBuilder: (context, index) {
              return CardCatalogWidget(
                catalog: catalog.catalogs![index],
                onTap: tapCatalog,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => print('ADD'),
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: const Color(0xff322316)),
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                  image: AssetImage('assets/images/background/bac_app_bar.png'),
                  fit: BoxFit.fill),
            ),
            child: const Icon(Icons.add, color: Color(0xff322316), size: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background/bac_app_bar.png'),
                  fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.contacts),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
