import SwiftUI

struct ContentView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    var body: some View {
        VStack {
            switch navigationViewModel.navigations.last {
            case .splash:
                SplashView()
            case .onboarding:
                OnboardingView()
            case .signIn:
                SignInView()
            case .signUp:
                SignUpView()
            case .avatar:
                AvatarView()
            case .interests:
                InterestsView()
            case .welcome:
                WelcomeView()
            case .home:
                HomeView()
            case .favorites:
                FavoritesView()
            case .notifications:
                NotificationView()
            case .settings:
                SettingsView()
            case .profile:
                ProfileView()
            case .support:
                SupportView()
            case .hotelMap:
                HotelMapView()
            case .hotelDetails(let hotel):
                HotelDetailsView(hotel: hotel)
            case .restaurantMap:
                RestaurantMapView()
            case .restaurantDetails(let restaurant):
                RestaurantDetailsView(restaurant: restaurant)
            case .quizList:
                QuizListView()
            case .quiz(let quiz):
                QuizView(quiz: quiz)
            case .journey(let journey):
                JourneyView(plan: journey)
            default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("206E49").ignoresSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
