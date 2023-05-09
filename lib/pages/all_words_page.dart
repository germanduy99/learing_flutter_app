
import 'package:auto_size_text/auto_size_text.dart';
import 'package:englishapp/models/english_today.dart';
import 'package:englishapp/values/app_assets.dart';
import 'package:englishapp/values/app_colors.dart';
import 'package:englishapp/values/app_styles.dart';
import 'package:flutter/material.dart';



class  AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;
  const AllWordsPage ({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style:
          AppStyles.h3.copyWith(color: Appcolors.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () {
          Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body:ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: (index %2) == 0 ? Appcolors.primaryColor: Appcolors.secondColor,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text('${words[index].noun}',
                style:(index %2) == 0 ? AppStyles.h4 :AppStyles.h4.copyWith(
                  color: Appcolors.textColor
                ),
              ),
              subtitle: Text(words[index].quote ?? 'Think of all the beauty still left around you and be happy.'),
              leading: Icon(Icons.favorite, color: words[index].isFavorite ? Colors.red : Colors.grey,),
            ),
          );
        },
      ),
    );
  }
}

// class AllWordsPage extends StatelessWidget {
//   final List<EnglishToday> words;
//   const AllWordsPage({Key? key,required this.words}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.secondColor,
//       appBar: AppBar(
//         backgroundColor: Appcolors.secondColor,
//         elevation: 0,
//         title: Text(
//           'English today',
//           style:
//           AppStyles.h3.copyWith(color: Appcolors.textColor, fontSize: 36),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Image.asset(AppAssets.leftArrow),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//
//         child: GridView.count(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           children: words.map((e) => Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Appcolors.primaryColor,
//               borderRadius: BorderRadius.all(Radius.circular(8))
//             ),
//             child: AutoSizeText(
//               e.noun??'',
//               style: AppStyles.h3.copyWith(
//                 shadows: [
//                   BoxShadow(
//                     color: Colors.black38,
//                     offset: Offset(3,6),
//                     blurRadius: 6
//                   )
//                 ]
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.fade,
//
//             ),
//           )).toList(),
//         ),
//       ),
//     );
//
//   }
// }
