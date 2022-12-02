// ------------- Package ----------------
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

// ------------- Package App --------------
import 'package:warta/app/data/app_data.dart';
import 'package:warta/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ------------- Modules ----------------
// Splash module
part 'splash/views/splash_view.dart';
part 'splash/bindings/splash_binding.dart';
part 'splash/controllers/splash_controller.dart';

// Home module
part 'home/views/home_view.dart';
part 'home/views/item_view.dart';
part 'home/views/item_view_shimmer.dart';
part 'home/views/list_kategori.dart';
part 'home/views/search_bar.dart';
part 'home/bindings/home_binding.dart';
part 'home/controllers/home_controller.dart';


// Detail module
part 'detail/views/detail_view.dart';
part 'detail/bindings/detail_binding.dart';
part 'detail/controllers/detail_controller.dart';
