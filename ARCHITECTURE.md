# Flutter Restaurant Management System - Architecture

**Version:** 1.0.0  
**Architecture:** Clean Architecture + Feature-First  
**State Management:** Riverpod 2.x with Code Generation  
**Target Users:** Admin, Manager, Waiter, Chef/Kitchen  
**Platforms:** Android, iOS, Web, Windows, macOS

---

## 📐 Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
│  • Screens (UI)                                              │
│  • Widgets (Reusable components)                             │
│  • Riverpod Providers (State management)                     │
│  • View Models (Business logic)                              │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│                     Domain Layer                             │
│  • Entities (Business models)                                │
│  • Use Cases (Business logic)                                │
│  • Repository Interfaces (Contracts)                         │
│  • Failures (Error types)                                    │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                              │
│  • Repository Implementations                                │
│  • Data Sources (Remote API / Local Cache)                   │
│  • DTOs (Data Transfer Objects)                              │
│  • Mappers (DTO ↔ Entity)                                    │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│                    Core / Infrastructure                      │
│  • DI (Dependency Injection)                                 │
│  • Network (Dio, Interceptors)                               │
│  • Storage (Hive, Secure Storage)                            │
│  • Theme, Constants, Utils                                   │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗂️ Folder Structure

```
lib/
├── main.dart                          # App entry point + DI setup
│
├── core/                              # Shared infrastructure
│   ├── di/
│   │   └── injection.dart             # Riverpod provider setup
│   ├── network/
│   │   ├── dio_client.dart            # Dio + interceptors + JWT
│   │   ├── api_endpoints.dart         # Backend URLs
│   │   └── network_info.dart          # Connectivity check
│   ├── storage/
│   │   ├── hive_storage.dart          # Local cache (Hive)
│   │   └── secure_storage.dart        # Token storage
│   ├── theme/
│   │   ├── app_theme.dart             # Material 3 theme
│   │   ├── app_colors.dart            # Color palette
│   │   └── app_text_styles.dart       # Typography
│   ├── constants/
│   │   ├── app_constants.dart         # Static values
│   │   └── asset_paths.dart           # Asset URLs
│   ├── utils/
│   │   ├── logger.dart                # Logging
│   │   ├── validators.dart            # Form validation
│   │   └── formatters.dart            # Date/Currency
│   ├── router/
│   │   └── app_router.dart            # GoRouter + guards
│   └── error/
│       ├── failures.dart              # Failure types (sealed)
│       └── exceptions.dart            # Exception types
│
├── features/                          # Feature modules
│   │
│   ├── auth/                          # Authentication
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_remote_datasource.dart
│   │   │   │   └── auth_local_datasource.dart
│   │   │   ├── dtos/
│   │   │   │   ├── login_request_dto.dart
│   │   │   │   └── login_response_dto.dart
│   │   │   ├── mappers/
│   │   │   │   └── auth_mapper.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart   # Freezed model
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart  # Abstract interface
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       ├── logout_usecase.dart
│   │   │       └── refresh_token_usecase.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   ├── auth_provider.dart     # @riverpod
│   │       │   └── auth_state_provider.dart
│   │       ├── screens/
│   │       │   ├── login_screen.dart
│   │       │   └── splash_screen.dart
│   │       └── widgets/
│   │           ├── login_form.dart
│   │           └── role_selector.dart
│   │
│   ├── menu/                          # Menu management
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── menu_remote_datasource.dart
│   │   │   │   └── menu_local_datasource.dart
│   │   │   ├── dtos/
│   │   │   │   ├── menu_item_dto.dart
│   │   │   │   └── category_dto.dart
│   │   │   ├── mappers/
│   │   │   │   └── menu_mapper.dart
│   │   │   └── repositories/
│   │   │       └── menu_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── menu_item_entity.dart
│   │   │   │   └── category_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── menu_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_menu_items_usecase.dart
│   │   │       ├── create_menu_item_usecase.dart
│   │   │       └── update_menu_item_usecase.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── menu_provider.dart
│   │       ├── screens/
│   │       │   ├── menu_list_screen.dart
│   │       │   └── menu_item_detail_screen.dart
│   │       └── widgets/
│   │           ├── menu_item_card.dart
│   │           └── category_chip.dart
│   │
│   ├── orders/                        # Order management
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── tables/                        # Table management
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── kitchen/                       # Kitchen display
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── analytics/                     # Reports & dashboard
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── users/                         # User management
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── shared/                            # Shared widgets & utils
    ├── widgets/
    │   ├── app_button.dart
    │   ├── app_text_field.dart
    │   ├── loading_overlay.dart
    │   ├── error_view.dart
    │   ├── empty_state.dart
    │   ├── status_badge.dart
    │   └── order_card.dart
    └── extensions/
        ├── context_extensions.dart
        ├── string_extensions.dart
        └── datetime_extensions.dart
```

---

## 🔄 Data Flow

### Example: Login Flow

```
┌──────────────┐
│ LoginScreen  │  User taps "Login"
└──────┬───────┘
       │
       ↓ [ref.read(authProvider.notifier).login()]
┌──────────────┐
│ AuthProvider │  @riverpod notifier
└──────┬───────┘
       │
       ↓ [loginUseCase.call()]
┌──────────────┐
│ LoginUseCase │  Business logic
└──────┬───────┘
       │
       ↓ [repository.login()]
┌──────────────────┐
│ AuthRepository   │  Abstract interface
└──────┬───────────┘
       │
       ↓ [Impl]
┌────────────────────┐
│ AuthRepositoryImpl │
└──────┬─────────────┘
       │
       ├─→ RemoteDataSource (API call via Dio)
       │   ├─ POST /auth/login
       │   └─ Returns LoginResponseDTO
       │
       └─→ LocalDataSource (Cache token)
           └─ Save to SecureStorage

       ↓ [Either<Failure, UserEntity>]
┌──────────────┐
│ AuthProvider │  Update state → AsyncValue
└──────┬───────┘
       │
       ↓ [Consumer watches state]
┌──────────────┐
│ LoginScreen  │  Show success / Navigate
└──────────────┘
```

---

## 🧩 Key Patterns

### 1. Riverpod Providers (Code Generated)

```dart
// auth_provider.dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<UserEntity?> build() async {
    // Check if user is logged in
    return ref.read(authLocalDataSourceProvider).getUser();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    
    final result = await ref.read(loginUseCaseProvider).call(
      LoginParams(email: email, password: password),
    );
    
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }
}
```

### 2. Use Cases (Single Responsibility)

```dart
// login_usecase.dart
@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
}

class LoginUseCase {
  final AuthRepository _repository;
  
  LoginUseCase(this._repository);
  
  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return _repository.login(params.email, params.password);
  }
}
```

### 3. Repository Pattern

```dart
// auth_repository.dart (Abstract)
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, String>> refreshToken();
}

// auth_repository_impl.dart (Concrete)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  
  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    
    try {
      final dto = await _remoteDataSource.login(email, password);
      final entity = AuthMapper.toEntity(dto);
      await _localDataSource.cacheUser(entity);
      return Right(entity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
```

### 4. Freezed Entities (Immutable)

```dart
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    String? avatar,
  }) = _UserEntity;
  
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
```

### 5. Failures (Sealed Union)

```dart
@freezed
class Failure with _$Failure {
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.network() = NetworkFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.validation(String message) = ValidationFailure;
}
```

---

## 🛡️ Error Handling Strategy

```dart
// In UI
ref.listen(authProvider, (prev, next) {
  next.whenOrNull(
    error: (error, stack) {
      if (error is Failure) {
        error.when(
          server: (msg) => showSnackBar('Server error: $msg'),
          network: () => showSnackBar('No internet connection'),
          unauthorized: () => router.go('/login'),
          validation: (msg) => showSnackBar(msg),
        );
      }
    },
  );
});
```

---

## 🔐 Authentication Flow

```
1. User opens app
   ↓
2. SplashScreen checks token in SecureStorage
   ↓
3a. Token valid → Navigate to role-based home
3b. Token expired → Refresh token
3c. No token → Navigate to LoginScreen
```

**Dio Interceptor (Auto-refresh):**
```dart
// On 401 response → auto-refresh → retry original request
```

---

## 🚀 Performance Optimizations

1. **Provider Caching**: Riverpod auto-caches providers
2. **Local-first**: Hive for offline support
3. **Lazy Loading**: `AutoDispose` for screens
4. **Image Caching**: `cached_network_image`
5. **Pagination**: Infinite scroll with `ListView.builder`

---

## 🧪 Testing Strategy

```
lib/                    → Production code
test/                   → Mirror structure
  ├── unit/             → Use cases, repositories
  ├── widget/           → Widget tests
  └── integration/      → E2E flows
```

**Test Coverage Target:** 80%+

---

## 📱 Responsive Design

**Breakpoints:**
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

**Adaptive Layout:**
```dart
// Use LayoutBuilder
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) return MobileLayout();
    if (constraints.maxWidth < 1024) return TabletLayout();
    return DesktopLayout();
  },
)
```

---

## 🎨 Design System

**Theme:** Material 3 (Material You)  
**Typography:** Inter font family  
**Color Scheme:**
- Primary: Teal/Cyan (restaurant theme)
- Secondary: Amber (food theme)
- Error: Red
- Success: Green

---

## 🔑 Environment Configuration

```dart
// .env (not committed)
API_BASE_URL=http://localhost:8080/api/v1
ENVIRONMENT=development

// lib/core/config/env.dart
abstract class Env {
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
}
```

---

## 📦 Dependencies Rationale

| Package | Purpose | Why? |
|---------|---------|------|
| `flutter_riverpod` | State management | Type-safe, testable, scalable |
| `riverpod_annotation` | Code generation | Zero boilerplate |
| `go_router` | Navigation | Declarative routing + deep links |
| `dio` | HTTP client | Interceptors, retry, logging |
| `freezed` | Immutable models | Sealed unions, copyWith |
| `hive_flutter` | Local storage | Fast NoSQL for offline |
| `flutter_secure_storage` | Token storage | Encrypted key-value store |
| `reactive_forms` | Form validation | Reactive, testable forms |
| `dartz` | Functional programming | `Either<Failure, Success>` |

---

## 🚦 Git Workflow

**Branches:**
- `main` → Production
- `develop` → Integration
- `feature/*` → New features
- `bugfix/*` → Bug fixes

**Commits:** Conventional Commits
```
feat: add login screen
fix: resolve menu image loading
chore: update dependencies
```

---

## 📈 Next Steps

1. ✅ Setup core infrastructure (DI, network, storage)
2. ✅ Implement auth module (login, logout, refresh)
3. ✅ Create shared widgets library
4. → Implement menu module
5. → Implement orders module
6. → Implement tables module
7. → Implement kitchen module
8. → Implement analytics module
9. → Add offline support
10. → Comprehensive testing

---

**Let's build a production-grade app! 🚀**
