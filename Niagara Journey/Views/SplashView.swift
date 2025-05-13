import SwiftUI
import FirebaseRemoteConfig

struct SplashView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("kdkdk") private var first: String = ""
    @AppStorage("djjd") private var second: Bool = false
    
    @State private var remoteConfigValue1: String? = nil
    @State private var remoteConfigValue2: Bool? = nil
    
    @AppStorage("username") private var username: String = ""
    @AppStorage("logged") private var logged: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Loading...")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            if !second {
                DispatchQueue.main.async {
                    let remoteConfig = RemoteConfig.remoteConfig()
                    let settings = RemoteConfigSettings()
                    settings.minimumFetchInterval = 3600
                    remoteConfig.configSettings = settings
                    
                    remoteConfig.fetchAndActivate { status, error in
                        if let error = error {
                            remoteConfigValue1 = ""
                            remoteConfigValue2 = false
                            print(error)
                        } else {
                            remoteConfigValue1 = remoteConfig["nia"].stringValue
                            remoteConfigValue2 = remoteConfig["gara"].boolValue
                            
                            if remoteConfigValue2! {
                                let uuid = UserDefaults.standard.string(forKey: "external_id") ?? ""
                                let uuid_str = "?externalid=" + uuid
                                let lksj = remoteConfigValue1! + uuid_str
                                
                                navigationViewModel.navigate(to: .journey(lksj))
                            } else {
                                if logged {
                                    navigationViewModel.navigate(to: .home)
                                } else {
                                    if username != "" {
                                        navigationViewModel.navigate(to: .signIn)
                                    } else {
                                        navigationViewModel.navigate(to: .onboarding)
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if first.isEmpty {
                    if logged {
                        navigationViewModel.navigate(to: .home)
                    } else {
                        if username != "" {
                            navigationViewModel.navigate(to: .signIn)
                        } else {
                            navigationViewModel.navigate(to: .onboarding)
                        }
                    }
                } else {
                    navigationViewModel.navigate(to: .journey(first))
                }
            }
        }
    }
}

