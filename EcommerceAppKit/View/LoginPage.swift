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
            
            VStack {
                
            }
            .frame(height: getRect().height / 3.5)
            
            ScrollView {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
