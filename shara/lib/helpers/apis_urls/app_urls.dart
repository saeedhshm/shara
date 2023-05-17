

const String mainUrl = 'https://sharaksa.com'; //live url
// const String mainUrl = 'https://dev.sharaksa.com'; //http://dev.sharaksa.com/ {{domain}}


const partnerImage = '$mainUrl/public/uploads/partners/source';
const membershipImage = '$mainUrl/public/uploads/membership/source';
const offersImage = '$mainUrl/public/uploads/offers/source';
const slidersImage = '$mainUrl/public/uploads/sliders/source';
const discountCouponsImage = '$mainUrl/public/uploads/coupons/source';


const String registerUrl = '$mainUrl/api/customer/auth/register';
const String loginUrl = '$mainUrl/api/customer/auth/login';
const String loginSendConfirmCodeUrl = '$mainUrl/api/customer/auth/login_send_confirm_code';

const String profileDataUrl = '$mainUrl/api/customer/profile_data';


const String validateConfirmCodeUrl = '$mainUrl/api/customer/auth/register_validate_confirm_code';

const String sendConfirmCodeUrl = '$mainUrl/api/customer/auth/register_send_phone';

const String forgetPasswordByEmailUrl = '$mainUrl/api/customer/auth/forgot_password';
const String forgetPasswordByPhoneUrl = '$mainUrl/api/customer/auth/forgot_password_mobile';
const String resetPasswordUrl = '$mainUrl/api/customer/auth/reset_password';
const String logoutUrl = '$mainUrl/api/customer/auth/logout'   ;
const String updateProfileUrl = '$mainUrl/api/customer/auth/save_my_profile';
const String getProfileUrl = '$mainUrl/api/auth/save_my_profile';
const String updatePasswordUrl = '$mainUrl/api/customer/auth/save_my_password';
const String updateEmailUrl = '$mainUrl/api/customer/auth/save_my_email';

const sendMessageUrl = '$mainUrl/api/customer/send_message';

const String myTransactionsUrl = '$mainUrl/api/customer/transactions';
const String myCouponsUrl = '$mainUrl/api/customer/gift_cards';

const String allDiscountCouponsUrl = '$mainUrl/api/customer/coupons';

const String partnersUrl = '$mainUrl/api/customer/partners' ;
const String membershipUrl = '$mainUrl/api/customer/memberships';
const String calcPointsUrl = '$mainUrl/api/customer/calc_points';
const String homePageUrl = '$mainUrl/api/customer/home';
const String offersUrl = '$mainUrl/api/customer/offers';

const String promoCodesTypesUrl = '$mainUrl/api/customer/get_promo_codes_types';
const String promoCodesUrl = '$mainUrl/api/customer/get_promo_codes';
const String buyPromoCodePayUrl = '$mainUrl/api/customer/promo-codes-pay';

const String innerTransferUrl = '$mainUrl/api/customer/transfer/inner_transfer';

const String syncPhonesUrl = '$mainUrl/api/customer/transfer/synchronize_phones';

// payments {{domain}}/api/customer/payment/generate_payment_url
const String urlPaymentGeneratorUrl = '$mainUrl/api/customer/payment/generate_payment_url';