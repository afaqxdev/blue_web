import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../Core/Provider/cityProvider.dart';
import 'model.dart';

// ... DataModalRoute and routeDataModelList definitions go here ...

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RoutesProvider(),
      child: Column(
        children: [
          Consumer<RoutesProvider>(
            builder: (context, provider, child) {
              return DropdownButton<String>(
                value: provider.selectedCity,
                items: routeDataModelList.first.keys
                    .map((city) => DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  provider.setSelectedCity(value!);
                },
              );
            },
          ),
          Consumer<RoutesProvider>(
            builder: (context, provider, child) {
              return DataTable(
                columns: const [
                  DataColumn(label: Text('Route')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: provider.filteredRoutes
                    .map((route) => DataRow(cells: [
                          DataCell(Text(route.route)),
                          DataCell(Text(route.status)),
                          DataCell(
                            Consumer<RoutesProvider>(
                              builder: (context, provider, child) {
                                bool isHovered = false;
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onHover: (PointerHoverEvent event) {
                                    if (!isHovered) {
                                      isHovered = true;
                                    }
                                  },
                                  onExit: (PointerExitEvent event) {
                                    if (isHovered) {
                                      isHovered = false;
                                    }
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.red, width: 1),
                                      color: isHovered
                                          ? Colors.grey.withOpacity(0.5)
                                          : route.action
                                              ? Colors.white
                                              : Colors.red,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: isHovered
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
