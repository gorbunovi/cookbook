import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
              toolbarHeight: 50,
              title: const Text('Загрузка',
                style: TextStyle(
                  color: Color(0xff322316),
                ),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/bac_app_bar.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: const [
                    // SizedBox(height: 30),
                  ],
                ),
              )),
        ),
        body:  const SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xffE9DDC5),
            ),
          ),
        ),
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
            ),
          ),
        ),
      ),
    );
  }
}