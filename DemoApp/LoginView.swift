//
//  LoginView.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import SwiftUI

struct LoginView: View {
    @State private var userName:String = ""
    @State private var password:String = ""
    @State private var isPasswordVisible:Bool = false

var body: some View {
    
    ZStack{
        LinearGradient(
            gradient:Gradient(
                colors: [Color.white,                                          Color(hex: "7A6FC5")]),
            startPoint: .top, endPoint: .bottom
        ).edgesIgnoringSafeArea(.all)
    
        VStack(spacing: 20) {
            Image("homeSign")
                .resizable()
                .scaledToFit()
                .frame(width: 200,
                       height: 180)
            
            VStack(spacing: 5) {
                Text("Welcome Back!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Please enter your details")
                    .font(.title3)
                    .fontWeight(.light)
            }
            .padding(.bottom,20)
            
            TextField("Enter Your Name", text: $userName)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal,30)
            
            HStack{
                if isPasswordVisible{
                    TextField("Password", text: $password)
                }
                else{
                    SecureField("Password", text: $password)
                }
                
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.slash":"eye").foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal,30)
            
            HStack {
                Spacer()
                Text("Recovery Password")
                    .foregroundColor(.black)
                    .font(.caption)
            }
            .padding(.horizontal, 35)

            
            Button {
                //Handle login button action
            } label: {
                Text("Sign In")
                   .fontWeight(.bold)
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color(hex: "43328B"))
                   .foregroundColor(.white)
                   .cornerRadius(10)
                   .shadow(radius: 2)
            }
            .padding(.horizontal,30)
            .padding(.top,10)

            // Register Now
            
            HStack{
                Text("_______________________")
            }
            .padding(.horizontal,10)
            
           HStack {
               Text("Not a member?")
               Text("Register now")
                   .foregroundColor(Color(hex: "43328B"))
                   .bold()
           }
           .font(.caption)
           .padding(.top, 10)
        }
    }
}
}

#Preview {
LoginView()
}
