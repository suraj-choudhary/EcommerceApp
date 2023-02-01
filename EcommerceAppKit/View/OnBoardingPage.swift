//
//  OnBoardingPage.swift
//  EcommerceAppKit
//
//  Created by suraj kumar on 01/02/23.
//
import SwiftUI
let customFont = "Raleway-Regular"
struct OnBoardingPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find Your\nGadgets")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20.0)
            Button {
                print("hi")
            } label: {
                Text("Get Started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color.purple)
                
            }
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 0 : 40)
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.purple
        )
    }
}
struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
        
    }
}
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
