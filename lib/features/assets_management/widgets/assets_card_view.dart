import 'package:flutter/material.dart';
import 'package:community_circle/core/core.dart';
import '../../presentation/widgets/app_button_common.dart';
import '../../presentation/widgets/workplace_widgets.dart';
import '../../../core/util/app_theme/text_style.dart';
import '../../../widgets/common_card_view.dart';

class AssetCardView extends StatelessWidget {
  final String assetName;
  final String category;
  final String vendor;
  final String purchaseDate;
  final String warrantyDate;
  final String? assignedTo;
  final VoidCallback? onAssign;
  final VoidCallback? onViewDetail;
  final bool isAssigned;
  final bool showButtons;

  const AssetCardView({
    super.key,
    required this.assetName,
    required this.category,
    required this.vendor,
    required this.purchaseDate,
    required this.warrantyDate,
    this.assignedTo,
    this.onAssign,
    this.onViewDetail,
    this.isAssigned = false,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewDetail,
      child: CommonCardView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Asset Name and Category Row ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      assetName,
                      style: appTextStyle.appTitleStyle2(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: appTextStyle.appTitleStyle(
                        color: AppColors.appBlueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // --- Vendor Info ---
              Row(
                children: [
                  Icon(Icons.store_outlined, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 5),
                  Text(
                    "Vendor: $vendor",
                    style: appTextStyle.appSubTitleStyle2(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // --- Purchase Date ---
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 5),
                  Text(
                    "Purchase: $purchaseDate",
                    style: appTextStyle.appSubTitleStyle2(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              // --- Warranty Date ---
              Row(
                children: [
                  Icon(Icons.verified, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 5),
                  Text(
                    "Warranty: $warrantyDate",
                    style: appTextStyle.appSubTitleStyle2(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // --- Assigned To ---
              if (assignedTo != null && assignedTo!.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        "Assigned to: $assignedTo",
                        style: appTextStyle.appSubTitleStyle(fontWeight: FontWeight.w400, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

              if (showButtons) const SizedBox(height: 10),

              // --- Buttons ---
              if (showButtons)
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        buttonHeight: 35,
                        textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                        buttonName: isAssigned ? "Reassign" : "Assign",
                        buttonColor: AppColors.appBlueColor,
                        buttonBorderColor: Colors.grey,
                        flutterIcon: Icons.person_add_alt_1_outlined,
                        isShowIcon: true,
                        iconSize: const Size(18, 18),
                        backCallback: onAssign ?? () {},
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
