import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter_app/models/readme.dart';
import 'package:universal_html/controller.dart';

final readmeStocks = FutureProvider((ref) async {
  // URL
  const _url = "https://github.com/azuma317";
  // Controller
  final controller = WindowController();
  await controller.openHttp(uri: Uri.parse(_url));
  final document = controller.window!.document;
  final nameDom = document.querySelector(
      "#js-pjax-container > div.container-xl.px-3.px-md-4.px-lg-5 > div > div.Layout-sidebar > div > div.js-profile-editable-replace > div.clearfix.d-flex.d-md-block.flex-items-center.mb-4.mb-md-0 > div.vcard-names-container.float-left.js-profile-editable-names.col-12.py-3.js-sticky.js-user-profile-sticky-fields > h1 > span.p-name.vcard-fullname.d-block.overflow-hidden");
  final idDom = document.querySelector(
      "#js-pjax-container > div.container-xl.px-3.px-md-4.px-lg-5 > div > div.Layout-sidebar > div > div.js-profile-editable-replace > div.clearfix.d-flex.d-md-block.flex-items-center.mb-4.mb-md-0 > div.vcard-names-container.float-left.js-profile-editable-names.col-12.py-3.js-sticky.js-user-profile-sticky-fields > h1 > span.p-nickname.vcard-username.d-block");
  final imageUrlDom = document.querySelector(
      "#js-pjax-container > div.container-xl.px-3.px-md-4.px-lg-5 > div > div.Layout-sidebar > div > div.js-profile-editable-replace > div.clearfix.d-flex.d-md-block.flex-items-center.mb-4.mb-md-0 > div.position-relative.d-inline-block.col-2.col-md-12.mr-3.mr-md-0.flex-shrink-0 > a > img");
  final name = nameDom?.text ?? "";
  final id = idDom?.text ?? "";
  final imageUrl = imageUrlDom?.getAttribute("src") ?? "";

  return Readme(id, name, imageUrl);
});
