import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/presentation/widgets/dog_dialog.dart';
import 'package:scoob/presentation/widgets/search_bar_widget.dart';
import 'package:scoob/utils/extensions/string_extension.dart';
import 'package:searchable_listview/searchable_listview.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.widget,
  });

  final SearchBarWidget widget;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: SearchableList<DogModel>(
        initialList: widget.dogs,
        emptyWidget: const Center(
          child: Text('No dogs found'),
        ),
        inputDecoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color(0xFFC4C4C4),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
        filter: (String value) {
          return widget.dogs
              .where((dog) => dog.breed.toLowerCase().contains(value))
              .toList();
        },
        builder: (filteredDogs, index, dog) {
          return ListTile(
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DogDialog(
                    dog: filteredDogs[index],
                  );
                },
              );
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                filteredDogs[index].image ?? '',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
                errorBuilder: (context, msg, object) => const Icon(
                  Icons.error_outline_outlined,
                  size: 20,
                ),
              ),
            ),
            title: Text(
              filteredDogs[index].breed.capitalize(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
