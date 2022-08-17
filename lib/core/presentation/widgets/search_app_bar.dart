import 'package:clean_arch_movie_app/core/presentation/app_routes.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
/*
          SizedBox(
              width: 80,
              child: ,
          // Spacer(),
*/

          Text('WOOKIE \nMOVIES', style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          Icon(Icons.search, size: 25),
          Expanded(
              child: TextField(
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
            readOnly: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder()),
          ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90);
}
