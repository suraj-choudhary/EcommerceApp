//
//  LoginPageModel.swift
//  EcommerceAppKit
//
//  Created by suraj kumar on 01/02/23.
//
import Foundation
class LoginPageModel: ObservableObject {
    
    //loginProperty
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //Register Properties:
    @Published var registerUser: Bool = false
    @Published var re_Enter_password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // Login call
    
    func Login() {
        //Do Action Here
    }
    
    func Register() {
        //Do Action Here

    }
    
    func ForgotPassword() {
        
    }

    
}
