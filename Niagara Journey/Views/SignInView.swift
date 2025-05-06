import SwiftUI

struct SignInView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @State private var username: String = ""
    @State private var password: String = ""
    @AppStorage("username") private var username1: String = ""
    @AppStorage("pass") private var password1: String = ""
    @AppStorage("logged") private var logged: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("Sign In to Your Account")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            Text("Welcome back! Sign in to stay updated with the latest news, personalized reminders, and exciting new features. Enter your details below to access your account and continue exploring Niagara.")
                .foregroundStyle(.white)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
            
            TextField("", text: $username, prompt: Text("Username").foregroundColor(Color.white.opacity(0.5)))
                .font(.system(size: 16, weight: .heavy))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white.opacity(0.1))
                .foregroundColor(.white)
                .cornerRadius(8)
            
            SecureField("", text: $password, prompt: Text("Password").foregroundColor(Color.white.opacity(0.5)))
                .font(.system(size: 16, weight: .heavy))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white.opacity(0.1))
                .foregroundColor(.white)
                .cornerRadius(8)
            
            Button(action: {
                username1 = username
                password1 = password
                logged = true
                navigationViewModel.navigate(to: .avatar)
            }) {
                Text("Continue")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("3A3A3A"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("FEC90D"))
                    )
            }
            .opacity(username.isEmpty || password.isEmpty ? 0.5 : 1)
            .disabled(username.isEmpty || password.isEmpty)
            
            Text("Don't have an account yet? Sign up")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
            
            LabelledDivider(label: "or")
            
            Button(action: {
                logged = true
                navigationViewModel.navigate(to: .avatar)
            }) {
                Text("Continue as Guest")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("428C6B"))
                    )
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SignInView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

