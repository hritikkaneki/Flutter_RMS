# TODO List - Flutter RMS

**Last Updated:** June 25, 2026  
**Current Phase:** 2 (Authentication - 90% Complete)

---

## 🔴 CRITICAL - Do First!

### 1. Fix Compilation Issues ⚠️
**Status:** In Progress  
**Priority:** CRITICAL  
**Time Estimate:** 15-30 minutes

**Quick Steps:**
```bash
# Try this first
flutter clean
flutter pub get
dart run build_runner build
flutter run -d chrome

# If that doesn't work
rm -rf .dart_tool
flutter clean
flutter pub get
dart run build_runner build

# Or just try running despite errors
flutter run -d chrome --no-sound-null-safety
```

**Expected:** 20 analyzer warnings (Freezed cache) - might work anyway

---

### 2. Test Authentication Flow ✅
**Status:** Ready to test  
**Priority:** CRITICAL  
**Time Estimate:** 15 minutes

**Test Steps:**
1. Run: `flutter run -d chrome`
2. See splash screen → login screen
3. Try login: `admin@restaurant.com` / `Admin@123`
4. Should see success screen
5. Test logout button
6. Close and reopen app (should remember user)

**Success Criteria:**
- [ ] App loads without crash
- [ ] Login works
- [ ] Success screen shows user name and role
- [ ] Logout works
- [ ] User is cached (reopening app skips login)

---

## 🟡 HIGH PRIORITY - This Week

### 3. Add GoRouter Navigation 🚧
**Status:** Not Started  
**Priority:** HIGH  
**Time Estimate:** 2-3 hours

**Files to Create:**
- [ ] `lib/core/router/app_router.dart`
- [ ] `lib/core/router/route_names.dart`
- [ ] `lib/core/router/auth_guard.dart`

**Implementation:**
```dart
// app_router.dart
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authState),
    redirect: (context, state) {
      final isAuth = authState.valueOrNull != null;
      final isLoggingIn = state.location == '/login';
      
      if (!isAuth && !isLoggingIn) return '/login';
      if (isAuth && isLoggingIn) return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => SplashScreen()),
      GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
      GoRoute(path: '/home', builder: (_, __) => HomeScreen()),
    ],
  );
});
```

**Checklist:**
- [ ] Install go_router (already in pubspec.yaml)
- [ ] Create router provider
- [ ] Add route definitions
- [ ] Implement auth guard
- [ ] Add role-based guards
- [ ] Update main.dart to use router
- [ ] Test navigation flow
- [ ] Add deep linking support

---

### 4. Implement Token Auto-Refresh 🔄
**Status:** Not Started  
**Priority:** HIGH  
**Time Estimate:** 1 hour

**File to Update:**
- [ ] `lib/core/network/dio_client.dart` (ErrorInterceptor)

**Implementation:**
```dart
// In ErrorInterceptor.onError()
if (err.response?.statusCode == 401) {
  try {
    // 1. Get refresh token
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken == null) throw UnauthorizedException();
    
    // 2. Call refresh endpoint
    final response = await _dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    
    // 3. Save new tokens
    final newAccessToken = response.data['data']['accessToken'];
    await _secureStorage.saveAccessToken(newAccessToken);
    
    // 4. Retry original request
    err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
    return handler.resolve(await _dio.fetch(err.requestOptions));
  } catch (e) {
    // Refresh failed - logout user
    await _secureStorage.clearAuthTokens();
    return handler.next(err);
  }
}
```

**Checklist:**
- [ ] Implement refresh logic in interceptor
- [ ] Handle refresh token expiry
- [ ] Clear tokens on refresh failure
- [ ] Test with expired access token
- [ ] Test with expired refresh token

---

### 5. Add Unit Tests 🧪
**Status:** Not Started  
**Priority:** HIGH  
**Time Estimate:** 3-4 hours

**Files to Create:**
- [ ] `test/features/auth/domain/usecases/login_usecase_test.dart`
- [ ] `test/features/auth/domain/usecases/logout_usecase_test.dart`
- [ ] `test/features/auth/data/repositories/auth_repository_impl_test.dart`
- [ ] `test/features/auth/data/datasources/auth_remote_datasource_test.dart`
- [ ] `test/features/auth/data/mappers/auth_mapper_test.dart`
- [ ] `test/features/auth/presentation/providers/auth_provider_test.dart`

**Test Structure:**
```dart
// login_usecase_test.dart
void main() {
  group('LoginUseCase', () {
    late MockAuthRepository mockRepository;
    late LoginUseCase useCase;
    
    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = LoginUseCase(mockRepository);
    });
    
    test('should return LoginResponseEntity on success', () async {
      // Arrange
      when(mockRepository.login(any, any))
        .thenAnswer((_) async => Right(tLoginResponse));
      
      // Act
      final result = await useCase(tLoginParams);
      
      // Assert
      expect(result, Right(tLoginResponse));
      verify(mockRepository.login(tEmail, tPassword));
    });
    
    test('should return ValidationFailure when email is empty', () async {
      // Test validation logic
    });
  });
}
```

**Target Coverage:** 80%+

---

## 🟢 MEDIUM PRIORITY - Next Week

### 6. Start Menu Module 📋
**Status:** Not Started  
**Priority:** MEDIUM  
**Time Estimate:** 6-8 hours

**Folder Structure to Create:**
```
lib/features/menu/
├── domain/
│   ├── entities/
│   │   ├── menu_item_entity.dart
│   │   └── category_entity.dart
│   ├── repositories/
│   │   └── menu_repository.dart
│   └── usecases/
│       ├── get_menu_items_usecase.dart
│       ├── get_categories_usecase.dart
│       ├── create_menu_item_usecase.dart
│       ├── update_menu_item_usecase.dart
│       └── delete_menu_item_usecase.dart
├── data/
│   ├── dtos/
│   │   ├── menu_item_dto.dart
│   │   └── category_dto.dart
│   ├── mappers/
│   │   └── menu_mapper.dart
│   ├── datasources/
│   │   ├── menu_remote_datasource.dart
│   │   └── menu_local_datasource.dart
│   └── repositories/
│       └── menu_repository_impl.dart
└── presentation/
    ├── providers/
    │   ├── menu_provider.dart
    │   └── categories_provider.dart
    ├── screens/
    │   ├── menu_list_screen.dart
    │   ├── menu_item_detail_screen.dart
    │   └── menu_item_form_screen.dart
    └── widgets/
        ├── menu_item_card.dart
        ├── category_chip.dart
        └── menu_item_image.dart
```

**Follow Same Pattern as Auth Module**

**API Endpoints:**
- GET /menu-items
- GET /menu-items/{id}
- POST /menu-items
- PUT /menu-items/{id}
- DELETE /menu-items/{id}
- GET /categories
- POST /categories

---

### 7. Create Shared Widget Library 🎨
**Status:** Partially Complete  
**Priority:** MEDIUM  
**Time Estimate:** 2-3 hours

**Widgets to Create:**
- [x] AppButton ✅
- [x] AppTextField ✅
- [ ] AppCard
- [ ] LoadingOverlay
- [ ] ErrorView
- [ ] EmptyStateView
- [ ] StatusBadge
- [ ] OrderCard
- [ ] TableCard
- [ ] SkeletonLoader
- [ ] SearchBar
- [ ] FilterChip
- [ ] PriceTag

---

### 8. Add Image Upload for Menu Items 📸
**Status:** Not Started  
**Priority:** MEDIUM  
**Time Estimate:** 2 hours

**Files to Create:**
- [ ] `lib/core/utils/image_picker_helper.dart`
- [ ] `lib/core/network/multipart_helper.dart`

**Implementation:**
```dart
// Upload menu item image
Future<String> uploadMenuImage(File image) async {
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(image.path),
  });
  
  final response = await dio.post(
    '/menu-items/${menuItemId}/image',
    data: formData,
  );
  
  return response.data['data']['imageUrl'];
}
```

---

## 🔵 LOW PRIORITY - Nice to Have

### 9. Add Offline Support 📶
**Status:** Not Started  
**Priority:** LOW  
**Time Estimate:** 3-4 hours

**Features:**
- Cache menu items locally
- Queue actions when offline
- Sync when back online
- Show offline indicator

---

### 10. Add Loading Skeletons ⏳
**Status:** Not Started  
**Priority:** LOW  
**Time Estimate:** 2 hours

**Use shimmer package for:**
- Menu list loading
- Order list loading  
- Table grid loading
- Detail screen loading

---

### 11. Add Push Notifications 🔔
**Status:** Not Started  
**Priority:** LOW  
**Time Estimate:** 4-5 hours

**Features:**
- Firebase Cloud Messaging setup
- Device token registration
- Order status notifications
- Kitchen notifications

---

### 12. Add Real-time Updates 🔄
**Status:** Not Started  
**Priority:** LOW  
**Time Estimate:** 5-6 hours

**Implementation:**
- WebSocket or SSE connection
- Real-time order updates
- Real-time table status
- Real-time kitchen queue

---

## 📝 Documentation TODOs

### 13. Create User Documentation
**Status:** Not Started  
**Priority:** LOW

**Files to Create:**
- [ ] USER_GUIDE.md
- [ ] TROUBLESHOOTING.md
- [ ] FAQ.md

---

### 14. Create Developer Documentation
**Status:** Partially Complete  
**Priority:** MEDIUM

**Files to Update/Create:**
- [x] ARCHITECTURE.md ✅
- [x] PROGRESS.md ✅
- [ ] CONTRIBUTING.md
- [ ] CODE_STYLE_GUIDE.md
- [ ] API_INTEGRATION.md

---

## 🐛 Known Issues to Fix

### Issue 1: Freezed Cache Warnings
**Status:** Open  
**Priority:** Medium  
**Workaround:** Restart IDE

### Issue 2: Dynamic Type Casts
**Status:** Open  
**Priority:** Low  
**Files:** `auth_remote_datasource.dart`  
**Fix:** Add explicit `as String` casts

### Issue 3: One Theme DialogTheme Error
**Status:** Open  
**Priority:** Low  
**File:** `app_theme.dart:245`

---

## ✅ Completed Tasks

### Phase 1: Core Infrastructure ✅
- [x] Error handling system (Failures + Exceptions)
- [x] Network layer (Dio + Interceptors + Endpoints)
- [x] Storage layer (SecureStorage + Hive)
- [x] Theme system (Material 3 Light/Dark)
- [x] Constants and configuration
- [x] Utilities (Validators + Formatters)
- [x] Extensions (Context + String + DateTime)

### Phase 2: Authentication Module ✅
- [x] Domain layer (Entities + Use Cases + Repository interface)
- [x] Data layer (DTOs + Mappers + Data Sources + Repository impl)
- [x] Presentation layer (Providers + Screens + Widgets)
- [x] Login screen with validation
- [x] Splash screen
- [x] User caching
- [x] Token storage

### Bug Fixes ✅
- [x] Fixed Riverpod Ref type errors
- [x] Fixed Theme type errors (CardTheme/DialogTheme)
- [x] Added Freezed private constructors
- [x] Generated all .g.dart and .freezed.dart files

---

## 📅 Weekly Plan

### This Week (June 25-30)
- [ ] Fix compilation issues (Day 1)
- [ ] Test authentication flow (Day 1)
- [ ] Add GoRouter (Day 1-2)
- [ ] Implement token refresh (Day 2)
- [ ] Start menu module (Day 3-5)

### Next Week (July 1-7)
- [ ] Complete menu module
- [ ] Start orders module
- [ ] Add unit tests for auth
- [ ] Add unit tests for menu

### Week 3 (July 8-14)
- [ ] Complete orders module
- [ ] Start tables module
- [ ] Start kitchen module

### Week 4 (July 15-21)
- [ ] Complete tables module
- [ ] Complete kitchen module
- [ ] Add analytics screens
- [ ] Integration tests
- [ ] Production readiness

---

## 🎯 Sprint Goals

### Current Sprint: Authentication & Navigation
**Goal:** Working auth flow + navigation system  
**Duration:** 2-3 days  
**Status:** 90% Complete

**Definition of Done:**
- [ ] App compiles without errors
- [ ] Login works end-to-end
- [ ] Logout works
- [ ] User cached on restart
- [ ] GoRouter navigation implemented
- [ ] Token auto-refresh working

---

## 📊 Progress Tracking

**Overall Project:** 35% Complete

```
Foundation        [████████████████████] 100%
Auth Module       [█████████████████░░░]  90%
Menu Module       [░░░░░░░░░░░░░░░░░░░░]   0%
Orders Module     [░░░░░░░░░░░░░░░░░░░░]   0%
Tables Module     [░░░░░░░░░░░░░░░░░░░░]   0%
Kitchen Module    [░░░░░░░░░░░░░░░░░░░░]   0%
Analytics Module  [░░░░░░░░░░░░░░░░░░░░]   0%
Users Module      [░░░░░░░░░░░░░░░░░░░░]   0%
Testing           [░░░░░░░░░░░░░░░░░░░░]   0%
Documentation     [████████████░░░░░░░░]  60%
```

---

## 🚀 Quick Commands

### Start Development
```bash
cd c:\Users\DELL\IdeaProjects\flutter_rms
code .  # Open VS Code
flutter run -d chrome
```

### Code Generation
```bash
dart run build_runner build
dart run build_runner watch  # Auto-generate on save
```

### Testing
```bash
flutter test                    # All tests
flutter test --coverage        # With coverage
flutter analyze                # Check for errors
```

### Clean Build
```bash
flutter clean
flutter pub get
dart run build_runner build
```

---

**Last Updated:** June 25, 2026  
**Next Review:** After completing TODO #1-3

---

**Remember:** Focus on getting TODO #1-3 done first! 🎯
