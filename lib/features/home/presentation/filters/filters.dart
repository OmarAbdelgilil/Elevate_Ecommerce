import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/features/home/data/products_filters_enum.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> showFilters(BuildContext context,
    {ProductsFiltersEnum? filter, int? priceFrom, int? priceTo}) async {
  ProductsFiltersEnum selectedSortOption =
      filter ?? ProductsFiltersEnum.highestPrice;
  double minPrice = priceFrom != null ? priceFrom.toDouble() : 0;
  double maxPrice = priceTo != null ? priceTo.toDouble() : 2000;

  return await showModalBottomSheet<Map<String, dynamic>?>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: 540,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Lowest Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Radio<ProductsFiltersEnum>(
                                  value: ProductsFiltersEnum.lowestPrice,
                                  groupValue: selectedSortOption,
                                  fillColor: const WidgetStatePropertyAll(
                                      primaryColor),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSortOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Highest Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Radio<ProductsFiltersEnum>(
                                  value: ProductsFiltersEnum.highestPrice,
                                  groupValue: selectedSortOption,
                                  fillColor: const WidgetStatePropertyAll(
                                      primaryColor),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSortOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'New',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Radio<ProductsFiltersEnum>(
                                  value: ProductsFiltersEnum.newProducts,
                                  groupValue: selectedSortOption,
                                  fillColor: const WidgetStatePropertyAll(
                                      primaryColor),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSortOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Old',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Radio<ProductsFiltersEnum>(
                                  value: ProductsFiltersEnum.oldProducts,
                                  groupValue: selectedSortOption,
                                  fillColor: const WidgetStatePropertyAll(
                                      primaryColor),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSortOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Radio<ProductsFiltersEnum>(
                                  value: ProductsFiltersEnum.discount,
                                  groupValue: selectedSortOption,
                                  fillColor: const WidgetStatePropertyAll(
                                      primaryColor),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedSortOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 5000,
                    divisions: 5000,
                    activeColor: primaryColor,
                    labels: RangeLabels(
                      '\$${minPrice.toInt()}',
                      '\$${maxPrice.toInt()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, {
                          'sortOption': selectedSortOption,
                          'priceRange': [minPrice, maxPrice],
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Filter',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
