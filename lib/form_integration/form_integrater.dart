import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/password_reset_guideliness.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/sign_in.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/splash_screen.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/welcome_note1_category1.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/welcome_note2_category1.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/welcome_note3_category1.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/book_categories.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/book_category_results.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/borrowed_book_specific_details.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/borrowed_books.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/dashboard.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/dynamic_book.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/favourite_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/home_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/notification_message.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/notification_new_message.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/profile.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/reserved_study_room_details.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/reserved_sudy_rooms.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/search_results.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/study_room_results.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/study_room_selection.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/notification.dart'
    // ignore: library_prefixes
    as Notification;
import 'package:nlib_library_assistant/app_files/category_i_files/study_room_userselection.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/user_search_result.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/user_settings.dart';
import 'package:nlib_library_assistant/app_files/screens/wrapper.dart';

class FormIntegrator {
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String profile = "/profile";
  static const String notification = "/notification";
  static const String favouriteBooks = "/favourite-books";
  static const String userSettings = "/user-settings";
  static const String dashboard = "/dashboard";

  static const String notificationMessage = "/notification-message";
  static const String newNotificationMessage = "/new-notification-message";

  static const String dynamicBook = "/dynamic-book";
  static const String searchResult = "/search-results";
  static const String bookCategories = "/book-categories";
  static const String bookCategoryResult = "/book-category-result";
  static const String borrowedBooks = "/borrowed-books";
  static const String borrowedBookSpecificDetails =
      "/borrowed-book-specific-details";

  static const String reservedStudyRoomSelection =
      "/reserved-study-room-selection";
  static const String reservedStudyRoomSelectionDetails =
      "/reserved-study-room-selection-details";
  static const String studyRoomSelection = "/study-room-selection";
  static const String studyRoomResults = "/study-room-results";
  static const String studyRoomUserSelection = "/study-room-user-selection";
  static const String userSearchResult = "/user-search-result";

  static const String signIn = "/sign-in";
  static const String welcomeNote1Category1 = "/welcome-note-1-category-1";
  static const String welcomeNote2Category1 = "/welcome-note-2-category-1";
  static const String welcomeNote3Category1 = "/welcome-note-3-category-1";
  static const String passwordResetGuidelines = "/password-reset-guidelines";
  
  static const String wrapper = "/wrapper";

  
  static String getInitial() => "$initial";
  static String getHomePage() => "$homePage";
  static String getProfile(int pageId) => "$profile?pageId=$pageId";
  static String getNotification() => notification;
  static String getFavouriteBooks() => favouriteBooks;
  static String getUserSettings() => userSettings;
  static String getDashboard() => dashboard;

  static String getNotificationMessage() => notificationMessage;
  static String getNewNotificationMessage() => newNotificationMessage;

  static String getDynamicBook(int pageId) => "$dynamicBook?pageId=$pageId";
  static String getSearchResults(String bookName) =>
      "$searchResult?bookName=$bookName";
  static String getBookCategories() => bookCategories;
  static String getBookCategoryResult(int pageId) =>
      "$bookCategoryResult?pageId=$pageId";
  static String getBorrowedBooks() => borrowedBooks;
  static String getBorrowedBookSpecificDetails(int pageId) =>
      "$borrowedBookSpecificDetails?pageId=$pageId";

  static String getResrvedStudyRoomSelection() => reservedStudyRoomSelection;
  static String getReservedStudyRoomSelectionDetails() =>
      reservedStudyRoomSelectionDetails;
  static String getStudyRoomSelection() => studyRoomSelection;
  static String getStudyRoomResults(int pageId) =>
      "$studyRoomResults?pageId=$pageId";
  static String getStudyRoomUserSelection() => studyRoomUserSelection;
  static String getUserSearchResult() => userSearchResult;

  static String getSignIn() => signIn;
  static String getWelcomeNote1Category1() => welcomeNote1Category1;
  static String getWelcomeNote2Category1() => welcomeNote2Category1;
  static String getWelcomeNote3Category1() => welcomeNote3Category1;
  static String getPasswordResetGuidelines() => passwordResetGuidelines;

  static String getWrapper() => "$wrapper";

  static List<GetPage> routes = [
    //main home page
    GetPage(
      name: initial,
      page: () {
        return const SplashScreen();
      },
      transition: Transition.fadeIn,
    ),

    //wrapper
    GetPage(
      name: wrapper,
      page: () {
        return Wrapper();
      }
    ),

    //main home page
    GetPage(
      name: homePage,
      page: () {
        return const MainHomePage();
      },
      transition: Transition.fadeIn,
    ),
    //profile
    GetPage(
      name: profile,
      page: () {
        var typeId = Get.parameters["pageId"];
        return Profile(pageId: int.parse(typeId!));
      },
      transition: Transition.fadeIn,
    ),
    //notification
    GetPage(
      name: notification,
      page: () {
        return Notification.notification();
      },
      transition: Transition.fadeIn,
    ),
    //favourite books
    GetPage(
      name: favouriteBooks,
      page: () {
        return FavouriteBooks();
      },
      transition: Transition.fadeIn,
    ),
    //user settings
    GetPage(
      name: userSettings,
      page: () {
        return const UserSettings();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: dashboard,
      page: () {
        return const Dashboard();
      },
      transition: Transition.fadeIn,
    ),
    //dynamic book page
    GetPage(
      name: dynamicBook,
      page: () {
        var typeId = Get.parameters["pageId"];
        return DynamicBook(pageId: int.parse(typeId!));
      },
      transition: Transition.fadeIn,
    ),
    //search result page
    GetPage(
      name: searchResult,
      page: () {
        var text = Get.parameters["bookName"];
        return SearchResult(searchText: text!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: reservedStudyRoomSelection,
      page: () {
        return const ResrvedStudyRooms();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: reservedStudyRoomSelectionDetails,
      page: () {
        return const ReservedStudyRoomDetails();
      },
      transition: Transition.fadeIn,
    ),
    //study room selection
    GetPage(
      name: studyRoomSelection,
      page: () {
        return const StudyRoomSelection();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: studyRoomResults,
      page: () {
        var typeId = Get.parameters["pageId"];
        return StudyRoomResults(pageId: int.parse(typeId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: studyRoomUserSelection,
      page: () {
        return const StudyRoomUserSelection();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: userSearchResult,
      page: () {
        return const UserSearchResult();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signIn,
      page: () {
        return const SignIn();
      },
      transition: Transition.fadeIn,
    ),
    //welcome note1 category 1
    GetPage(
      name: welcomeNote1Category1,
      page: () {
        return const Category1WelcomeNote1();
      },
      transition: Transition.fadeIn,
    ),
    //welcome note2 category 1
    GetPage(
      name: welcomeNote2Category1,
      page: () {
        return const Category1WelcomeNote2();
      },
      transition: Transition.fadeIn,
    ),
    //welcome note3 category1
    GetPage(
      name: welcomeNote3Category1,
      page: () {
        return const Category1WelcomeNote3();
      },
      transition: Transition.fadeIn,
    ),
    //password reset guidelines
    GetPage(
      name: passwordResetGuidelines,
      page: () {
        return const PasswordResetGuideliness();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: bookCategories,
      page: () {
        return const BookCategories();
      },
      transition: Transition.fadeIn,
    ),
    //book category result
    GetPage(
      name: bookCategoryResult,
      page: () {
        var typeId = Get.parameters["pageId"];
        return BookCategoryResult(pageId: int.parse(typeId!));
      },
      transition: Transition.fadeIn,
    ),
    //borrowed books
    GetPage(
      name: borrowedBooks,
      page: () {
        return const BorrowedBooks();
      },
      transition: Transition.fadeIn,
    ),
    //borrowed book specific details
    GetPage(
      name: borrowedBookSpecificDetails,
      page: () {
        var typeId = Get.parameters["pageId"];
        return BorrowedBookDetails(pageId: int.parse(typeId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: notificationMessage,
      page: () {
        return NotificationMessage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: newNotificationMessage,
        page: () {
          return const NotificationNewMessage();
        })
  ];
}
