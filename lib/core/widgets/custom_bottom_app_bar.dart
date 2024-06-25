import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget CustomBottomAppBar({required BuildContext context, required Function function}){
  return BottomAppBar(
    height: MediaQuery.of(context).size.height * 0.07,
    padding: const EdgeInsets.all(0),
    shape: const CircularNotchedRectangle(),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background/bac_app_bar.png'),
            fit: BoxFit.fill),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/images/icons/shopping_basket.svg', height: 30),
          //   onPressed: () => showDialog(context: context,
          //     builder: (_)=> const AlertDialog(title: Text('Добавить в список покупок'),),),
          // ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/images/icons/to_pdf.svg', height: 30),
          //   onPressed: () => showDialog(context: context,
          //     builder: (_)=> const AlertDialog(title: Text('Сгенерирывать рецепт в PDF'),),),
          // ),
          IconButton(
            icon: SvgPicture.asset('assets/images/icons/qr_icon.svg',
                height: 30),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                title: Text('Считать QR код рецепта'),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Color(0xff322316),
            ),
            onPressed: () => function(),
          ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/images/icons/help.svg', height: 30),
          //   onPressed: () => showDialog(context: context,
          //     builder: (_)=> AlertDialog(content: Text('${catalog.info}'),),
          //   ),
          // ),
        ],
      ),
    ),
  );
}