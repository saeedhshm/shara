import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:get/get.dart';

import '../../profile.dart';

class AccountHomeWidget extends StatelessWidget {
  final InitAppController initAppController = Get.find();

  AccountHomeWidget({Key? key}) : super(key: key);

  static const Color goldAccent = Color(0xFFC89B4A);
  static const Color darkCharcoal = Color(0xFF2F383C);
  static const Color softWhite = Color(0xFFFEFDFB);

  @override
  Widget build(BuildContext context) {
    final user = initAppController.userData.value.user;
    if (user == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final isArabic = initAppController.isArabicLang;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            _buildBackground(),
            _buildFrostedGlass(),
            _buildContent(user, isArabic),
            _buildBottomAccent(),
            _buildBorder(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFEFDFB),
              Color(0xFFF9F6F1),
              Color(0xFFF4EFE7),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Enhanced geometric watermark with more sophisticated pattern
            Positioned(top: -25, right: -15,
              child: Container(width: 130, height: 130,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(color: goldAccent.withValues(alpha: 0.06), width: 1.5)))),
            Positioned(top: -5, right: 40,
              child: Container(width: 90, height: 90,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(color: goldAccent.withValues(alpha: 0.04), width: 1)))),
            Positioned(bottom: -35, left: -25,
              child: Transform.rotate(angle: math.pi / 6,
                child: Container(width: 110, height: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: goldAccent.withValues(alpha: 0.05), width: 1.2))))),
            Positioned(bottom: 15, right: 110,
              child: Container(width: 40, height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  color: goldAccent.withValues(alpha: 0.03)))),
            // Subtle central monogram (abstract geometric monogram for "Shara")
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Opacity(
                  opacity: 0.02,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: goldAccent.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 32,
                        color: goldAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrostedGlass() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(color: Colors.white.withValues(alpha: 0.1)),
      ),
    );
  }

  Widget _buildContent(user, bool isArabic) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.to(() => ProfilePage(onBack: Get.back)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  _buildUserInfo(user, isArabic),
                  _buildDivider(),
                  _buildPointsBadge(user),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(user, bool isArabic) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${user.firstName} ${user.lastName}',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: darkCharcoal,
              height: 1.2,
              letterSpacing: -0.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            user.membership?.mempName(isArabic) ?? '',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
              height: 1.3,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            goldAccent.withValues(alpha: 0.25),
            goldAccent.withValues(alpha: 0.45),
            goldAccent.withValues(alpha: 0.25),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBadge(user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFC89B4A),
            Color(0xFFD4AA50),
            Color(0xFFB8893E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: goldAccent.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
            blurStyle: BlurStyle.inner,
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'your_points'.tr,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '${user.points?.toInt() ?? 0}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.0,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAccent() {
    return Positioned(
      bottom: 0,
      left: 24,
      right: 24,
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.transparent,
              goldAccent.withValues(alpha: 0.2),
              goldAccent.withValues(alpha: 0.35),
              goldAccent.withValues(alpha: 0.2),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBorder() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
