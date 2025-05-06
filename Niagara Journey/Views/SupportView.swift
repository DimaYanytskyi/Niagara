import SwiftUI

struct SupportView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 24)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                    )
                    .onTapGesture {
                        navigationViewModel.back()
                    }
                
                Spacer()
                
                Text("Support")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                    )
                    .opacity(0)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    VStack {
                        Text("Add Photo / Image")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .padding(.top)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.1))
                                .frame(height: 150)
                            
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white.opacity(0.6))
                            }
                        }
                        .onTapGesture {
                            showActionSheet.toggle()
                        }
                    }
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(
                            title: Text("Select Image Source"),
                            message: Text("Choose where to get the image"),
                            buttons: [
                                .default(Text("Camera")) {
                                    sourceType = .camera
                                    showImagePicker = true
                                },
                                .default(Text("Photo Library")) {
                                    sourceType = .photoLibrary
                                    showImagePicker = true
                                },
                                .cancel()
                            ]
                        )
                    }
                    
                    TextField("", text: $email)
                        .modifier(PlaceholderStyle(show: email.isEmpty, text: "Email"))
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $message)
                            .modifier(PlaceholderStyle(show: message.isEmpty, text: "Message"))
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .scrollContentBackground(.hidden)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                    } else {
                        TextEditor(text: $message)
                            .modifier(PlaceholderStyle(show: message.isEmpty, text: "Enter your message"))
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                UITextView.appearance().backgroundColor = .clear
                            }
                    }
                    
                    Button(action: {
                        validateAndSend()
                    }) {
                        Text("Send Message")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundStyle(Color("3A3A3A"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("FEC90D"))
                            )
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage, sourceType: sourceType)
        }
    }
    
    private func validateAndSend() {
        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        guard !email.isEmpty, !message.isEmpty else {
            alertMessage = "Please fill in all fields."
            showAlert = true
            return
        }
        
        alertMessage = "Your message has been sent successfully!"
        showAlert = true
        email = ""
        message = ""
        selectedImage = nil
    }
        
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

#Preview {
    SupportView()
        .background(Color("206E49").ignoresSafeArea(.all))
}
