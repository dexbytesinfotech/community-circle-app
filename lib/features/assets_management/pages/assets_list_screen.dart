import '../../../app_global_components/common_floating_add_button.dart';
import '../../../imports.dart';
import '../../../widgets/common_search_bar.dart';
import '../widgets/assets_card_view.dart';

class AssetsListScreen extends StatefulWidget {
  const AssetsListScreen({super.key});

  @override
  State<AssetsListScreen> createState() => _AssetsListScreenState();
}

class _AssetsListScreenState extends State<AssetsListScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> assets = [
      {
        "assetName": "Laptop - Dell XPS 15",
        "category": "Electronics",
        "vendor": "Vendor 1",
        "purchaseDate": "Jan 15, 2024",
        "warrantyDate": "Jan 15, 2026",
        "assignedTo": "",
      },
      {
        "assetName": "Office Chair - Ergonomic",
        "category": "Furniture",
        "vendor": "Vendor 2",
        "purchaseDate": "Feb 20, 2024",
        "warrantyDate": "Feb 20, 2025",
        "assignedTo": "John Doe",
      },
      {
        "assetName": "Conference Table",
        "category": "Furniture",
        "vendor": "Vendor 3",
        "purchaseDate": "Mar 10, 2024",
        "warrantyDate": "Mar 10, 2025",
        "assignedTo": "",
      },
    ];

    Widget searchBar() {
      return CommonSearchBar(
        controller: controller,
        onChangeTextCallBack: (searchText) {
          // Add filtering logic if needed
        },
        onClickCrossCallBack: () {
          controller.clear();
          FocusScope.of(context).unfocus();
        },
        hintText: AppString.searchAssets,
      );
    }

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: false,
      isFixedDeviceHeight: true,
      isListScrollingNeed: true,
      isOverLayStatusBar: false,
      appBarHeight: 56,
      appBar: CommonAppBar(
        title: AppString.assetsManagement,
        icon: WorkplaceIcons.backArrow,
        isHideBorderLine: true,
      ),
      containChild: Stack(
        children: [
          Column(
            children: [
              searchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    final asset = assets[index];
                    return AssetCardView(
                      assetName: asset["assetName"],
                      category: asset["category"],
                      vendor: asset["vendor"],
                      purchaseDate: asset["purchaseDate"],
                      warrantyDate: asset["warrantyDate"],
                      assignedTo: asset["assignedTo"],
                      onViewDetail: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text('Viewing: ${asset["assetName"]}'),
                          ),
                        );
                      },
                      onAssign: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Assign clicked for ${asset["assetName"]}'),
                          ),
                        );
                      },
                      isAssigned:
                      asset["assignedTo"].toString().isNotEmpty,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomMenuView: CommonFloatingAddButton(
        onPressed: () {
          // Handle Add New Asset
        },
      ),
    );
  }
}
