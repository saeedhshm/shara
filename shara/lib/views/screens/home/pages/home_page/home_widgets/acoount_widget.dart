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
        height: 136,
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
            Positioned(top: -20, right: -10,
              child: Container(width: 100, height: 100,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(color: goldAccent.withValues(alpha: 0.08), width: 2)))),
            Positioned(top: 10, right: 50,
              child: Container(width: 60, height: 60,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(color: goldAccent.withValues(alpha: 0.05), width: 1.5)))),
            Positioned(bottom: -30, left: -20,
              child: Transform.rotate(angle: math.pi / 4,
                child: Container(width: 80, height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: goldAccent.withValues(alpha: 0.06), width: 1.5))))),
            Positioned(bottom: 10, right: 100,
              child: Container(width: 30, height: 30,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  color: goldAccent.withValues(alpha: 0.04)))),
            Positioned(top: 20, left: 30,
              child: Container(width: 8, height: 8,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  color: goldAccent.withValues(alpha: 0.08)))),
          ],
        ),
      ),
    );
  }

  Widget _buildFrostedGlass() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(color: Colors.white.withValues(alpha: 0.12)),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F383C),
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            user.membership?.mempName(isArabic) ?? '',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            goldAccent.withValues(alpha: 0.3),
            goldAccent.withValues(alpha: 0.5),
            goldAccent.withValues(alpha: 0.3),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBadge(user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
            color: goldAccent.withValues(alpha: 0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'your_points'.tr,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${user.points?.toInt() ?? 0}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.1,
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
        height: 1.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.transparent,
              goldAccent.withValues(alpha: 0.25),
              goldAccent.withValues(alpha: 0.4),
              goldAccent.withValues(alpha: 0.25),
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
            border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1),
          ),
        ),
      ),
    );
  }
}
