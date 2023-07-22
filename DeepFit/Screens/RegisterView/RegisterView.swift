//
//  ContentView.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 17.07.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = RegisterViewModel()
    @State private var name: String = ""
    @State private var nickName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    @State var nameErrorText: String = ""
    @State var emailErrorText: String = ""
    
    
    @State private var checkAgreement = false
    @State var showPassword: Bool = false
    @State var showEmailError: Bool = false
    
    var body: some View {
        VStack (alignment: .leading){
                signUpTitle
                    .padding(.vertical, 5)
            ScrollView{
                nameField
                nickNameField
                emailField
                passwordField
                agreement
                createButton
                dividerView
                signInWithGoogle
            }

                Spacer()
            
        }
        .padding(.horizontal)
    }
    
    
    var signUpTitle: some View {
        VStack(alignment: .leading){
            Text("Hesap Oluştur")
                .font(
                Font.custom("Gilroy", size: 40)
                .weight(.bold)
                )
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            
            Text("10 saniyede hesabın kullanıma hazır.")
        }
        .padding()
    }
    
    var nameField: some View {
        InputView(textValue: $name, errorText: $nameErrorText, hint: "erdal cinar")
    }
    
    var nickNameField: some View {
        InputView(textValue: $nickName, errorText: $nickName, hint: "Email Adresi giriniz", textFieldTitle: "Kullanici Adi Giriniz")
    }
    
    var emailField: some View {
        InputView(textValue: $email, errorText: $emailErrorText, leftIcon: Image(systemName: "at"), hint: "Email Adresi giriniz", textFieldTitle: "Email Adresi Giriniz")
    }
    
    var passwordField: some View {
//        VStack(alignment: .leading){
//            Text("Parola")
//                .font(
//                    Font.custom("Inter", size: 18)
//                        .weight(.medium)
//                )
//                .foregroundColor(Color(red: 0.52, green: 0.54, blue: 0.56))
//
//            ZStack(alignment: .trailing) {
//                if showPassword {
//                    TextField("Lutfen Paraolanizi Giriniz", text: $password)
//                        .textContentType(.password)
//                        .opacity(showPassword ? 1 : 0)
//                } else {
//                    SecureField("Password", text: $password)
//                        .textContentType(.password)
//                        .opacity(showPassword ? 0 : 1)
//                }
//                   Button(action: {
//                       showPassword.toggle()
//
//                   }, label: {
//                       Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill").font(.system(size: 16, weight: .regular))
//                           .foregroundColor(.gray)
//                           .padding()
//                   })
//               }
//
//            .frame(height:60)
//            .padding(.horizontal)
//            .keyboardType(.emailAddress)
//            .disableAutocorrection(true)
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .inset(by: 1)
//                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.98), lineWidth: 2)
//            )
//
//
//           }
        SecureTextField(label: password, text: $password)
            .textContentType(.newPassword)
        }
    
    
    var agreement: some View {
        VStack{
            Toggle(isOn: $checkAgreement) {
                Text("KVKK vb. sözleşmeleri kabul ederim.")
                  .font(
                    Font.custom("Gilroy", size: 20)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.52, green: 0.54, blue: 0.56))
                
            }
            .toggleStyle(iOSCheckboxToggleStyle())

        }
    }
    
    var createButton: some View {
        VStack{
            Button {
                viewModel.RegisterWithEmail(email: email)
                showEmailError.toggle()
            } label: {
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame( height: 66)
                      .background(Color(red: 0.98, green: 0.29, blue: 0.29))
                      .cornerRadius(10)
                    
                    Text("Hesabımı Oluştur")
                      .font(
                        Font.custom("Gilroy", size: 20)
                          .weight(.semibold)
                      )
                      .foregroundColor(.white)
               
                }
               
             
            }

        }
    }
    
    
    var dividerView: some View {
        HStack {
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                            .overlay(.gray)

               Text("yada")
                   .font(.headline)
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                            .overlay(.gray)
            
        }
    }
    
    var signInWithGoogle: some View {
        HStack{
            Button {
                print("google")
            } label: {
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame( height: 66)
                      .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                      .cornerRadius(10)
                    HStack{
                        Image("Google")

                        Text("Google ile Kaydol")
                          .font(
                            Font.custom("Gilroy", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.22, green: 0.49, blue: 1))
                    }
                }
            }
            
            Button {
                print("google")
            } label: {
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame( height: 66)
                      .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                      .cornerRadius(10)
                    HStack{
                        Image(systemName: "apple.logo")

                        Text("Apple \n ile Kaydol")
                          .font(
                            Font.custom("Gilroy", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.22, green: 0.49, blue: 1))
                    }
                }
            }
        }
    }
    


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




