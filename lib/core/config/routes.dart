import 'package:flutter/material.dart';
import 'package:community_circle/core/util/animation/slide_right_route.dart';
import 'package:community_circle/features/about_us/pages/about_us_screen.dart';
import 'package:community_circle/features/feed/feed.dart';
import 'package:community_circle/features/presentation/pages/dashboard_screen.dart';
import 'package:community_circle/features/faq/pages/faq_screen.dart';
import 'package:community_circle/features/presentation/pages/forgot_password_screen.dart';
import 'package:community_circle/features/notificaion/pages/notification_screen.dart';
import 'package:community_circle/features/policy/pages/policy_screen.dart';
import 'package:community_circle/features/presentation/pages/profile_settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:community_circle/features/presentation/pages/splash_screen.dart';
import '../../features/my_post/pages/my_post_screen.dart';
import '../../features/new_sign_up/pages/add_home_form.dart';
import '../../features/approval_pending_screen/pages/approval_pending_status_screen.dart';
import '../../features/new_sign_up/pages/complete_profile_form_screen.dart';
import '../../features/new_sign_up/pages/new_login_with_email_screen.dart';
import '../../features/self_profile/pages/my_house.dart';
import '../../features/self_profile/widgets/edit_profile_screen.dart';
import '../../features/vehicle_identification_form/pages/vehicle_from_screen.dart';
import '../../features/find_car_owner/pages/find_car_owner_screen.dart';

const dashBoardScreen = 'dashBoardScreen';



class Routes {
  /// The route configuration.
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      /// Flow for unregistered/non-logged-in user launched first time
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },),
      GoRoute(
        path: '/profileSetup',
        builder: (BuildContext context, GoRouterState state) {
          return const CompleteProfileScreen();
        },
        routes: <RouteBase>[
          GoRoute(
              path: 'searchYourSocietyForm',
              builder: (BuildContext context, GoRouterState state) {
                return const SearchYourSocietyForm();
              }),
        ],
      ),
      GoRoute(
          path: '/approvalPending',
          builder: (BuildContext context, GoRouterState state) {
            return const ApprovalPendingScreen();
          }),

      GoRoute(
          path: '/searchYourSocietyForm',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchYourSocietyForm();
          }),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const NewLoginWithEmail();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'forgotPassword',
            builder: (BuildContext context, GoRouterState state) {
              return const ForgotPasswordScreen();
            },
          ),
          GoRoute(
              path: 'profileSetup',
              builder: (BuildContext context, GoRouterState state) {
                return const CompleteProfileScreen();
              }),
          GoRoute(
              path: 'searchYourSocietyForm',
              builder: (BuildContext context, GoRouterState state) {
                return const SearchYourSocietyForm();
              })
        ],
      ),

      /// Flow for logged-in user launched first time
      GoRoute(
        path: '/dashBoard',
        builder: (BuildContext context, GoRouterState state) {
          return const DashBoardPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const NewLoginWithEmail();
            },
          ),
          GoRoute(
            path: 'post_liked_list',
            builder: (BuildContext context, GoRouterState state) {
              dynamic likeList =
                  state.extra != null ? state.extra as List<dynamic> : [];
              return PostLikeScreen(likes: likeList);
            },
          ),
          GoRoute(
            path: 'post_comment',
            builder: (BuildContext context, GoRouterState state) {
              Map<String, dynamic>? comment = state.extra != null
                  ? state.extra as Map<String, dynamic>
                  : null;
              return CommentNewScreen(
                postId: comment?["postId"],
                focusOnTextField: comment?["focusOnTextField"],
              );
            },
          ),
          GoRoute(
            path: 'notification',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(child: const NotificationScreen()),
          ),
          GoRoute(
              path: 'about',
              pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                  child: const AboutUsScreen())),
          GoRoute(
              path: 'Vehicle_Information',
              pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                  child:  const AddVehicleForm())),
          GoRoute(
              path: 'Search_Vehicle',
              pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                  child:  FindCarOwnerScreen())),
          // GoRoute(
          //     path: 'Vehicle_Details',
          //     pageBuilder: TransitionsBuilder.goRoutePageBuilder(
          //         child:  VehicleDetailsScreen())),
          GoRoute(
              path: 'Search_Vehicle',
              pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                  child:  const FindCarOwnerScreen())),
          GoRoute(
            path: 'my_post',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                child: const MyPostScreen()),
          ),  GoRoute(
            path: 'my_house',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                child: const MyHouse()),
          ),
          GoRoute(
            path: 'edit_profile',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                child: const EditProfileScreen()),
          ),  GoRoute(
            path: 'settings',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                child: const ProfileSettingsScreen()),
          ),
          GoRoute(
            path: 'policy',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(
                child: const PolicyScreen()),
          ),
          GoRoute(
            path: 'faq',
            pageBuilder:
                TransitionsBuilder.goRoutePageBuilder(child: const FaqScreen()),
          ),
          GoRoute(
              path: 'searchYourSocietyForm',
              builder: (BuildContext context, GoRouterState state) {
                return const SearchYourSocietyForm();
              })
        ],
      ),

      /// Flow for logged-in user launched first time
      GoRoute(
        path: '/post_comment',
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic>? comment =
              state.extra != null ? state.extra as Map<String, dynamic> : null;
          return CommentNewScreen(
            postId: comment?["postId"],
            focusOnTextField: comment?["focusOnTextField"],
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'post_liked_list',
            builder: (BuildContext context, GoRouterState state) {
              dynamic likeList =
                  state.extra != null ? state.extra as List<dynamic> : [];
              return PostLikeScreen(likes: likeList);
            },
          ),
          GoRoute(
            path: 'notification',
            pageBuilder: TransitionsBuilder.goRoutePageBuilder(child: const NotificationScreen()),
          ),
        ],
      ),
    ],
  );
}
