class MockDataProvider {
  static Map<String, dynamic> get homeResponse => {
        'intro_ar': 'مرحباً بك في شارا',
        'intro_en': 'Welcome to Shara',
        'offers': [
          {
            'id': 1,
            'offers_categories_id': 1,
            'users_companies_id': 1,
            'title_ar': 'عرض 50% على المشتريات',
            'title_en': '50% Off on All Purchases',
            'image_ar': 'offer1_ar.jpg',
            'image_en': 'offer1_en.jpg',
            'partner': {
              'id': 1,
              'name_ar': 'متجر الإلكترونيات',
              'name_en': 'Electronics Store',
            },
          },
          {
            'id': 2,
            'offers_categories_id': 1,
            'users_companies_id': 2,
            'title_ar': 'اشتر 2 واحصل على 1 مجاناً',
            'title_en': 'Buy 2 Get 1 Free',
            'image_ar': 'offer2_ar.jpg',
            'image_en': 'offer2_en.jpg',
            'partner': {
              'id': 2,
              'name_ar': 'مطعم الذواقة',
              'name_en': 'Gourmet Restaurant',
            },
          },
          {
            'id': 3,
            'offers_categories_id': 2,
            'users_companies_id': 3,
            'title_ar': 'خصم 30% على الرحلات',
            'title_en': '30% Discount on Trips',
            'image_ar': 'offer3_ar.jpg',
            'image_en': 'offer3_en.jpg',
            'partner': {
              'id': 3,
              'name_ar': 'وكالة السفر',
              'name_en': 'Travel Agency',
            },
          },
        ],
        'partners': [
          {
            'id': 1,
            'name_ar': 'متجر الإلكترونيات',
            'name_en': 'Electronics Store',
            'logo': 'partner1.png',
            'store_url': 'https://example.com/store1',
          },
          {
            'id': 2,
            'name_ar': 'مطعم الذواقة',
            'name_en': 'Gourmet Restaurant',
            'logo': 'partner2.png',
            'store_url': 'https://example.com/store2',
          },
          {
            'id': 3,
            'name_ar': 'وكالة السفر',
            'name_en': 'Travel Agency',
            'logo': 'partner3.png',
            'store_url': 'https://example.com/store3',
          },
          {
            'id': 4,
            'name_ar': 'متجر الأزياء',
            'name_en': 'Fashion Store',
            'logo': 'partner4.png',
            'store_url': 'https://example.com/store4',
          },
          {
            'id': 5,
            'name_ar': 'صيدلية الصحة',
            'name_en': 'Health Pharmacy',
            'logo': 'partner5.png',
            'store_url': 'https://example.com/store5',
          },
        ],
        'sliders': [
          {
            'id': 1,
            'image_ar': 'slider1_ar.jpg',
            'image_en': 'slider1_en.jpg',
          },
          {
            'id': 2,
            'image_ar': 'slider2_ar.jpg',
            'image_en': 'slider2_en.jpg',
          },
          {
            'id': 3,
            'image_ar': 'slider3_ar.jpg',
            'image_en': 'slider3_en.jpg',
          },
        ],
      };

  static Map<String, dynamic> get offersResponse => {
        'data': [
          {
            'id': 1,
            'name_ar': 'الإلكترونيات',
            'name_en': 'Electronics',
            'next_linke': null,
            'offers': [
              {
                'id': 1,
                'offers_categories_id': 1,
                'users_companies_id': 1,
                'title_ar': 'عرض 50% على المشتريات',
                'title_en': '50% Off on All Purchases',
                'image_ar': 'offer1_ar.jpg',
                'image_en': 'offer1_en.jpg',
                'partner': {
                  'id': 1,
                  'name_ar': 'متجر الإلكترونيات',
                  'name_en': 'Electronics Store',
                },
              },
              {
                'id': 4,
                'offers_categories_id': 1,
                'users_companies_id': 1,
                'title_ar': 'خصم على اللابتوبات',
                'title_en': 'Laptops Discount',
                'image_ar': 'offer4_ar.jpg',
                'image_en': 'offer4_en.jpg',
                'partner': {
                  'id': 1,
                  'name_ar': 'متجر الإلكترونيات',
                  'name_en': 'Electronics Store',
                },
              },
            ],
          },
          {
            'id': 2,
            'name_ar': 'المطاعم',
            'name_en': 'Restaurants',
            'next_linke': null,
            'offers': [
              {
                'id': 2,
                'offers_categories_id': 2,
                'users_companies_id': 2,
                'title_ar': 'اشتر 2 واحصل على 1 مجاناً',
                'title_en': 'Buy 2 Get 1 Free',
                'image_ar': 'offer2_ar.jpg',
                'image_en': 'offer2_en.jpg',
                'partner': {
                  'id': 2,
                  'name_ar': 'مطعم الذواقة',
                  'name_en': 'Gourmet Restaurant',
                },
              },
            ],
          },
          {
            'id': 3,
            'name_ar': 'السفر',
            'name_en': 'Travel',
            'next_linke': null,
            'offers': [
              {
                'id': 3,
                'offers_categories_id': 3,
                'users_companies_id': 3,
                'title_ar': 'خصم 30% على الرحلات',
                'title_en': '30% Discount on Trips',
                'image_ar': 'offer3_ar.jpg',
                'image_en': 'offer3_en.jpg',
                'partner': {
                  'id': 3,
                  'name_ar': 'وكالة السفر',
                  'name_en': 'Travel Agency',
                },
              },
            ],
          },
        ],
      };

  static Map<String, dynamic> offerDetailsResponse(int id) => {
        'id': id,
        'offers_categories_id': 1,
        'users_companies_id': 1,
        'title_ar': 'عرض 50% على المشتريات',
        'title_en': '50% Off on All Purchases',
        'desc_ar':
            'احصل على خصم 50% على جميع المشتريات من متجر الإلكترونيات. العرض ساري حتى نهاية الشهر.',
        'desc_en':
            'Get 50% off on all purchases from the Electronics Store. Offer valid until end of month.',
        'image_ar': 'offer1_ar.jpg',
        'image_en': 'offer1_en.jpg',
        'partner': {
          'id': 1,
          'name_ar': 'متجر الإلكترونيات',
          'name_en': 'Electronics Store',
          'logo': 'partner1.png',
          'store_url': 'https://example.com/store1',
        },
        'category': {
          'id': 1,
          'name_ar': 'الإلكترونيات',
          'name_en': 'Electronics',
        },
      };

  static List<Map<String, dynamic>> get partnersResponse => [
        {
          'id': 1,
          'name_ar': 'متجر الإلكترونيات',
          'name_en': 'Electronics Store',
          'logo': 'partner1.png',
          'store_url': 'https://example.com/store1',
        },
        {
          'id': 2,
          'name_ar': 'مطعم الذواقة',
          'name_en': 'Gourmet Restaurant',
          'logo': 'partner2.png',
          'store_url': 'https://example.com/store2',
        },
        {
          'id': 3,
          'name_ar': 'وكالة السفر',
          'name_en': 'Travel Agency',
          'logo': 'partner3.png',
          'store_url': 'https://example.com/store3',
        },
        {
          'id': 4,
          'name_ar': 'متجر الأزياء',
          'name_en': 'Fashion Store',
          'logo': 'partner4.png',
          'store_url': 'https://example.com/store4',
        },
        {
          'id': 5,
          'name_ar': 'صيدلية الصحة',
          'name_en': 'Health Pharmacy',
          'logo': 'partner5.png',
          'store_url': 'https://example.com/store5',
        },
        {
          'id': 6,
          'name_ar': 'مركز اللياقة',
          'name_en': 'Fitness Center',
          'logo': 'partner6.png',
          'store_url': 'https://example.com/store6',
        },
      ];

  static Map<String, dynamic> get membershipsResponse => {
        'memberships': {
          'current_page': 1,
          'data': [
            {
              'id': 1,
              'name_ar': 'العضوية الأساسية',
              'name_en': 'Basic Membership',
              'image_ar': 'basic_ar.png',
              'image_en': 'basic_en.png',
              'details_ar': 'عضوية أساسية مع مميزات محدودة',
              'details_en': 'Basic membership with limited features',
              'features': [
                {
                  'id': 1,
                  'membership_types_id': 1,
                  'icon': 'star',
                  'name_ar': 'نقاط مضاعفة',
                  'name_en': 'Double Points',
                },
                {
                  'id': 2,
                  'membership_types_id': 1,
                  'icon': 'gift',
                  'name_ar': 'هدية ترحيبية',
                  'name_en': 'Welcome Gift',
                },
              ],
            },
            {
              'id': 2,
              'name_ar': 'العضوية الفضية',
              'name_en': 'Silver Membership',
              'image_ar': 'silver_ar.png',
              'image_en': 'silver_en.png',
              'details_ar': 'عضوية فضية مع مميزات متوسطة',
              'details_en': 'Silver membership with medium features',
              'features': [
                {
                  'id': 3,
                  'membership_types_id': 2,
                  'icon': 'star',
                  'name_ar': 'نقاط مضاعفة ×2',
                  'name_en': 'Double Points x2',
                },
                {
                  'id': 4,
                  'membership_types_id': 2,
                  'icon': 'gift',
                  'name_ar': 'هدية شهرية',
                  'name_en': 'Monthly Gift',
                },
                {
                  'id': 5,
                  'membership_types_id': 2,
                  'icon': 'truck',
                  'name_ar': 'شحن مجاني',
                  'name_en': 'Free Shipping',
                },
              ],
            },
            {
              'id': 3,
              'name_ar': 'العضوية الذهبية',
              'name_en': 'Gold Membership',
              'image_ar': 'gold_ar.png',
              'image_en': 'gold_en.png',
              'details_ar': 'عضوية ذهبية مع جميع المميزات',
              'details_en': 'Gold membership with all features',
              'features': [
                {
                  'id': 6,
                  'membership_types_id': 3,
                  'icon': 'star',
                  'name_ar': 'نقاط مضاعفة ×3',
                  'name_en': 'Triple Points x3',
                },
                {
                  'id': 7,
                  'membership_types_id': 3,
                  'icon': 'gift',
                  'name_ar': 'هدية أسبوعية',
                  'name_en': 'Weekly Gift',
                },
                {
                  'id': 8,
                  'membership_types_id': 3,
                  'icon': 'truck',
                  'name_ar': 'شحن مجاني فوري',
                  'name_en': 'Instant Free Shipping',
                },
                {
                  'id': 9,
                  'membership_types_id': 3,
                  'icon': 'support',
                  'name_ar': 'دعم فني 24/7',
                  'name_en': '24/7 Support',
                },
              ],
            },
          ],
          'first_page_url': 'https://sharaksa.com/api/customer/memberships?page=1',
          'from': 1,
          'last_page': 1,
          'last_page_url': 'https://sharaksa.com/api/customer/memberships?page=1',
          'next_page_url': null,
          'path': 'https://sharaksa.com/api/customer/memberships',
          'per_page': 10,
          'prev_page_url': null,
          'to': 3,
          'total': 3,
        },
        'intro_ar': 'اختر عضويتك المفضلة',
        'intro_en': 'Choose your preferred membership',
      };

  static Map<String, dynamic> membershipDetailsResponse(int id) => {
        'id': id,
        'name_ar': id == 1
            ? 'العضوية الأساسية'
            : id == 2
                ? 'العضوية الفضية'
                : 'العضوية الذهبية',
        'name_en': id == 1
            ? 'Basic Membership'
            : id == 2
                ? 'Silver Membership'
                : 'Gold Membership',
        'image_ar': '${id}_ar.png',
        'image_en': '${id}_en.png',
        'details_ar': 'تفاصيل العضوية مع جميع المميزات المتاحة',
        'details_en': 'Membership details with all available features',
        'features': [
          {
            'id': 1,
            'membership_types_id': id,
            'icon': 'star',
            'name_ar': 'نقاط مضاعفة',
            'name_en': 'Double Points',
          },
          {
            'id': 2,
            'membership_types_id': id,
            'icon': 'gift',
            'name_ar': 'هدية ترحيبية',
            'name_en': 'Welcome Gift',
          },
        ],
      };

  static List<Map<String, dynamic>> get calcPointsResponse => [
        {
          'id': 1,
          'name_ar': 'المشتريات العادية',
          'name_en': 'Regular Purchases',
          'earn_ratio': 10,
          'loss_ratio': 5,
        },
        {
          'id': 2,
          'name_ar': 'المشتريات المميزة',
          'name_en': 'Premium Purchases',
          'earn_ratio': 20,
          'loss_ratio': 10,
        },
        {
          'id': 3,
          'name_ar': 'المشتريات الذهبية',
          'name_en': 'Gold Purchases',
          'earn_ratio': 30,
          'loss_ratio': 15,
        },
      ];

  static Map<String, dynamic> couponsResponse(int page) => {
        'current_page': page,
        'data': [
          {
            'id': 1,
            'name_en': 'SAVE10',
            'name_ar': 'وفر10',
            'image': 'coupon1.png',
            'value': '10%',
            'created_at': '2024-01-01T00:00:00.000000Z',
            'updated_at': '2024-01-01T00:00:00.000000Z',
          },
          {
            'id': 2,
            'name_en': 'SAVE20',
            'name_ar': 'وفر20',
            'image': 'coupon2.png',
            'value': '20%',
            'created_at': '2024-01-02T00:00:00.000000Z',
            'updated_at': '2024-01-02T00:00:00.000000Z',
          },
          {
            'id': 3,
            'name_en': 'FREESHIP',
            'name_ar': 'شحن مجاني',
            'image': 'coupon3.png',
            'value': 'Free Shipping',
            'created_at': '2024-01-03T00:00:00.000000Z',
            'updated_at': '2024-01-03T00:00:00.000000Z',
          },
        ],
        'first_page_url': 'https://sharaksa.com/api/customer/coupons?page=1',
        'from': 1,
        'last_page': 2,
        'last_page_url': 'https://sharaksa.com/api/customer/coupons?page=2',
        'next_page_url': page < 2
            ? 'https://sharaksa.com/api/customer/coupons?page=${page + 1}'
            : null,
        'path': 'https://sharaksa.com/api/customer/coupons',
        'per_page': 3,
        'prev_page_url': page > 1
            ? 'https://sharaksa.com/api/customer/coupons?page=${page - 1}'
            : null,
        'to': 3,
        'total': 5,
      };

  static Map<String, dynamic> get transactionsResponse => {
        'transactions': [
          {
            'id': 1,
            'uuid': 'abc-123-def',
            'customer_id': 1,
            'company_id': 1,
            'type': 1,
            'merchant_order_id': null,
            'status': 200,
            'amount': '150.00',
            'points': '50',
            'currency': 'SAR',
            'redirect_link': null,
            'created_at': '2024-06-01T10:00:00.000000Z',
            'updated_at': '2024-06-01T10:00:00.000000Z',
            'partner': {
              'id': 1,
              'name': 'متجر الإلكترونيات',
              'is_active': 1,
              'logo': 'partner1.png',
            },
            'points_info': {
              'id': 1,
              'transaction_id': 1,
              'points': '50',
              'points_before': '200',
              'points_after': '250',
              'created_at': '2024-06-01T10:00:00.000000Z',
              'updated_at': '2024-06-01T10:00:00.000000Z',
            },
          },
          {
            'id': 2,
            'uuid': 'def-456-ghi',
            'customer_id': 1,
            'company_id': 2,
            'type': 0,
            'merchant_order_id': null,
            'status': 200,
            'amount': '75.00',
            'points': '-30',
            'currency': 'SAR',
            'redirect_link': null,
            'created_at': '2024-06-05T14:30:00.000000Z',
            'updated_at': '2024-06-05T14:30:00.000000Z',
            'partner': {
              'id': 2,
              'name': 'مطعم الذواقة',
              'is_active': 1,
              'logo': 'partner2.png',
            },
            'points_info': {
              'id': 2,
              'transaction_id': 2,
              'points': '-30',
              'points_before': '250',
              'points_after': '220',
              'created_at': '2024-06-05T14:30:00.000000Z',
              'updated_at': '2024-06-05T14:30:00.000000Z',
            },
          },
          {
            'id': 3,
            'uuid': 'ghi-789-jkl',
            'customer_id': 1,
            'company_id': 3,
            'type': 1,
            'merchant_order_id': null,
            'status': 200,
            'amount': '300.00',
            'points': '150',
            'currency': 'SAR',
            'redirect_link': null,
            'created_at': '2024-06-10T09:15:00.000000Z',
            'updated_at': '2024-06-10T09:15:00.000000Z',
            'partner': {
              'id': 3,
              'name': 'وكالة السفر',
              'is_active': 1,
              'logo': 'partner3.png',
            },
            'points_info': {
              'id': 3,
              'transaction_id': 3,
              'points': '150',
              'points_before': '220',
              'points_after': '370',
              'created_at': '2024-06-10T09:15:00.000000Z',
              'updated_at': '2024-06-10T09:15:00.000000Z',
            },
          },
        ],
        'success': true,
        'message': 'Transactions retrieved successfully',
      };

  static Map<String, dynamic> get myCouponsResponse => {
        'gift_cards': [
          {
            'id': 1,
            'resal_id': 1001,
            'status': 1,
            'customer_id': 1,
            'variant_id': 1,
            'reference_id': 'REF-001',
            'code': 'GC-AAAA-BBBB',
            'expire_on': '2025-12-31',
            'how_to_use': 'أدخل الرمز عند الدفع',
            'photo': 'giftcard1.png',
            'price': '100',
            'total_price': '100',
            'created_at': '2024-06-01T00:00:00.000000Z',
            'updated_at': '2024-06-01T00:00:00.000000Z',
          },
          {
            'id': 2,
            'resal_id': 1002,
            'status': 1,
            'customer_id': 1,
            'variant_id': 2,
            'reference_id': 'REF-002',
            'code': 'GC-CCCC-DDDD',
            'expire_on': '2026-03-15',
            'how_to_use': 'أدخل الرمز عند الدفع',
            'photo': 'giftcard2.png',
            'price': '50',
            'total_price': '50',
            'created_at': '2024-06-15T00:00:00.000000Z',
            'updated_at': '2024-06-15T00:00:00.000000Z',
          },
        ],
        'success': true,
        'message': 'Gift cards retrieved successfully',
      };

  static Map<String, dynamic> get promoCodesTypesResponse => {
        'success': true,
        'message': 'Types retrieved successfully',
        'productsTypes': [
          {
            'id': 1,
            'name': 'جوجل بلاي',
            'code': 'google_play',
            'description': 'بطاقات جوجل بلاي',
          },
          {
            'id': 2,
            'name': 'آب ستور',
            'code': 'app_store',
            'description': 'بطاقات آب ستور',
          },
          {
            'id': 3,
            'name': 'فيسبوك',
            'code': 'facebook',
            'description': 'بطاقات فيسبوك',
          },
          {
            'id': 4,
            'name': 'أخرى',
            'code': 'other',
            'description': 'بطاقات أخرى',
          },
        ],
      };

  static Map<String, dynamic> promoCodesResponse(int page, int? categoryId) => {
        'success': true,
        'message': 'Products retrieved successfully',
        'products': [
          {
            'id': 1,
            'title': 'بطاقة جوجل بلاي 100 ريال',
            'photo': 'promo1.png',
            'description':
                '<p>بطاقة جوجل بلاي بقيمة 100 ريال سعودي</p>',
            'begin_price': '100',
            'display': true,
            'variants': [
              {
                'id': 1,
                'value': '100',
                'price': '100',
                'vat': '15',
                'service_fees': '0',
                'partner_fees': '0',
                'display': true,
                'country': {
                  'id': 1,
                  'name': 'السعودية',
                  'full_name': 'المملكة العربية السعودية',
                  'code': 'SA',
                  'flag': 'sa.png',
                },
                'stock': {
                  'status': 'in_stock',
                  'quantity': 50,
                },
              },
              {
                'id': 2,
                'value': '200',
                'price': '200',
                'vat': '30',
                'service_fees': '0',
                'partner_fees': '0',
                'display': true,
                'country': {
                  'id': 1,
                  'name': 'السعودية',
                  'full_name': 'المملكة العربية السعودية',
                  'code': 'SA',
                  'flag': 'sa.png',
                },
                'stock': {
                  'status': 'in_stock',
                  'quantity': 30,
                },
              },
            ],
            'types': [
              {
                'id': 1,
                'name': 'جوجل بلاي',
                'code': 'google_play',
                'description': 'بطاقات جوجل بلاي',
              },
            ],
          },
          {
            'id': 2,
            'title': 'بطاقة آب ستور 50 ريال',
            'photo': 'promo2.png',
            'description':
                '<p>بطاقة آب ستور بقيمة 50 ريال سعودي</p>',
            'begin_price': '50',
            'display': true,
            'variants': [
              {
                'id': 3,
                'value': '50',
                'price': '50',
                'vat': '7.5',
                'service_fees': '0',
                'partner_fees': '0',
                'display': true,
                'country': {
                  'id': 1,
                  'name': 'السعودية',
                  'full_name': 'المملكة العربية السعودية',
                  'code': 'SA',
                  'flag': 'sa.png',
                },
                'stock': {
                  'status': 'in_stock',
                  'quantity': 100,
                },
              },
            ],
            'types': [
              {
                'id': 2,
                'name': 'آب ستور',
                'code': 'app_store',
                'description': 'بطاقات آب ستور',
              },
            ],
          },
        ],
      };

  static Map<String, dynamic> get buyPromoCodeResponse => {
        'success': true,
        'message': 'تم الشراء بنجاح',
        'mersal Order': {
          'message': 'تم إرسال الطلب بنجاح، وسيتم توصيل الكود خلال دقائق',
        },
      };

  static Map<String, dynamic> get innerTransferResponse => {
        'success': true,
        'message': 'تم التحويل بنجاح',
      };

  static Map<String, dynamic> get syncPhonesResponse => {
        'success': true,
        'message': 'تمت مزامنة جهات الاتصال بنجاح',
      };

  static Map<String, dynamic> get paymentUrlResponse => {
        'success': true,
        'url': 'https://sharaksa.com/api/customer/payment/checkout-mobile-redirect?link=mock-link-123',
      };

  static Map<String, dynamic> get profileDataResponse => {
        'id': 1,
        'is_active': 1,
        'phone': '966555555555',
        'points': '1250.50',
        'email': 'user@shara.com',
        'first_name': 'محمد',
        'last_name': 'السعودي',
        'avatar': 'avatar.png',
        'gender': 1,
        'created_at': '2023-01-01T00:00:00.000000Z',
        'membership_type_id': 2,
        'membership': {
          'id': 2,
          'name_ar': 'العضوية الفضية',
          'name_en': 'Silver Membership',
        },
        'password': 'password123',
      };

  static Map<String, dynamic> get sendConfirmCodeResponse => {
        'success': true,
        'confirmCode': '1234',
        'message': 'تم إرسال كود التفعيل',
      };

  static Map<String, dynamic> get validateConfirmCodeResponse => {
        'success': true,
        'message': 'تم تأكيد الكود بنجاح',
      };

  static Map<String, dynamic> get registerResponse => {
        'success': true,
        'token': {
          'access_token': 'mock-access-token-123',
          'token_type': 'Bearer',
          'expires_in': 3600,
        },
        'user': {
          'id': 1,
          'is_active': 1,
          'phone': '966555555555',
          'points': '0',
          'email': null,
          'first_name': 'محمد',
          'last_name': 'السعودي',
          'avatar': null,
          'gender': 1,
          'created_at': '2024-06-01T00:00:00.000000Z',
          'membership_type_id': 1,
          'membership': {
            'id': 1,
            'name_ar': 'العضوية الأساسية',
            'name_en': 'Basic Membership',
          },
        },
      };

  static Map<String, dynamic> get loginResponse => {
        'success': true,
        'token': {
          'access_token': 'mock-access-token-456',
          'token_type': 'Bearer',
          'expires_in': 3600,
        },
        'user': {
          'id': 1,
          'is_active': 1,
          'phone': '966555555555',
          'points': '1250.50',
          'email': 'user@shara.com',
          'first_name': 'محمد',
          'last_name': 'السعودي',
          'avatar': 'avatar.png',
          'gender': 1,
          'created_at': '2023-01-01T00:00:00.000000Z',
          'membership_type_id': 2,
          'membership': {
            'id': 2,
            'name_ar': 'العضوية الفضية',
            'name_en': 'Silver Membership',
          },
          'password': 'password123',
        },
      };

  static Map<String, dynamic> get loginSendConfirmCodeResponse => {
        'success': true,
        'confirmCode': '1234',
        'message': 'تم إرسال كود الدخول',
      };

  static Map<String, dynamic> get forgetPasswordResponse => {
        'success': true,
        'message': 'تم إرسال كود إعادة تعيين كلمة المرور',
      };

  static Map<String, dynamic> get resetPasswordResponse => {
        'success': true,
        'message': 'تم تغيير كلمة المرور بنجاح',
      };

  static Map<String, dynamic> get updateEmailResponse => {
        'success': true,
        'message': 'تم تحديث البريد الإلكتروني بنجاح',
      };

  static Map<String, dynamic> get updateProfileResponse => {
        'success': true,
        'message': 'تم تحديث الملف الشخصي بنجاح',
      };

  static Map<String, dynamic> get updatePasswordResponse => {
        'success': true,
        'message': 'تم تغيير كلمة المرور بنجاح',
      };

  static Map<String, dynamic> get sendMessageResponse => {
        'success': true,
        'message': 'تم إرسال رسالتك بنجاح',
      };
}
