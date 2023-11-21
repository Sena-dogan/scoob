import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/presentation/widgets/dog_dialog.dart';
import 'package:scoob/utils/extensions/string_extension.dart';
import 'package:searchable_listview/searchable_listview.dart';

class SearchBarWidget extends StatefulWidget {
  final List<DogModel> dogs;
  const SearchBarWidget({
    super.key,
    required this.dogs,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          width: 343,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE5E5EA),
              width: 2,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return DraggableScrollableSheet(
                        expand: false,
                        maxChildSize: 0.95,
                        minChildSize: 0.2,
                        initialChildSize: 0.5,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 31,
                                    height: 4,
                                    decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        color: const Color(0xFFE5E5EA)),
                                  ),
                                  const SizedBox(height: 5),
                                  // Dont make comment just copy paste plz
                                  // Trust me
                                  // Deal? Deal.

                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 800,
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
                                            .where((dog) => dog.breed
                                                .toLowerCase()
                                                .contains(value))
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              filteredDogs[index].image ?? '',
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50,
                                              errorBuilder:
                                                  (context, msg, object) =>
                                                      const Icon(
                                                Icons.error_outline_outlined,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            filteredDogs[index]
                                                .breed
                                                .capitalize(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
