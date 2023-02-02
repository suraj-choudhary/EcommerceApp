//
//  LoginPage.swift
//  EcommerceAppKit
//
//  Created by suraj kumar on 01/02/23.
//
import SwiftUI
struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack {
            Text("welcome\nback")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack {
                        LinearGradient(colors: [Color.orange, Color.orange.opacity(0.3), Color.orange], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.trailing)
                            .offset(y: -10)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 5)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 5)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    Text("Login")
                        .font(.custom(customFont, size: 25).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    //TextField........
                    
                    customTextfield(icon: "envelope", title: "Email", hint: "@gmail.com", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    customTextfield(icon: "lock", title: "password", hint: "1234", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    if loginData.registerUser {
                        customTextfield(icon: "envelope", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 30)
                    }
                    
                    
                    //Forgot password
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Login Button
                    
                    Button {
                        if loginData.registerUser {
                            loginData.Register()
                        }else {
                            loginData.Login()
                        }
                        
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.0), radius: 5,x: 5, y: 5)
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    
                    
                    //register
                    Button {
                        withAnimation {
                            loginData.registerUser.toggle()

                        }
                    } label: {
                        Text("Create Account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white
                        //applying Custom croner
                .clipShape(CustomCorner(corner: [.topLeft, .topRight], radius: 25))
                .padding(.top, 30)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
    @ViewBuilder
    func customTextfield(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            if title.contains("password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
            }else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            Divider()
                .background(Color.black.opacity(0.4))
                .overlay(alignment: .trailing) {
                    
                    Group {
                        if title.contains("password") {
                            Button {
                                showPassword.wrappedValue.toggle()
                            } label: {
                                Text(showPassword.wrappedValue == true ? "show" : "Hide")
                                    .font(.custom(customFont, size: 13).bold())
                                    .foregroundColor(Color.purple)
                            }
                            .offset(y: -20)
                            
                        }
                    }
                }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
