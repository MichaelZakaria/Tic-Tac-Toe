// void _showADraw() {
//
//   isTurnVisible.value = false;
//   disableTap.value = true;
//
//   Future.delayed(
//       const Duration(seconds: 1),
//           () {
//         showDialog(
//             barrierDismissible: false,
//             context: Get.context!,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Draw'),
//                 actions: [
//                   FloatingActionButton(
//                       onPressed: () {
//                         resetBoard();
//                         Navigator.of(context).pop();
//                         nextTurn();
//                         isTurnVisible.value = true;
//                       },
//                       child: const Text('Again')
//                   )
//                 ],
//               );
//             }
//         );
//       }
//   );


//}