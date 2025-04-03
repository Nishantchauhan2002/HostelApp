//
//  SignUpView.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 03/04/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var userName:String = ""
    @State private var password:String = ""
    @State private var isPasswordVisible:Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                LinearGradient(
                    gradient:Gradient(
                        colors: [Color.white,                                          Color(hex: "7A6FC5")]),
                    startPoint: .top, endPoint: .bottom
                ).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20){
                    VStack(alignment: .leading,){
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Let’s Know about yourself")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,20)
                    
                    Image("signupTop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250,
                               height: 180)
                    
                    HStack(spacing: 10){
                        TextField("Enter Your Name", text: $userName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        
                        TextField("Enter Roll no", text: $userName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .padding(.horizontal,20)
                    
                    TextField("Enter Your email", text: $userName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .padding(.horizontal,20)
                    
                    HStack(spacing: 10){
                        TextField("Contact Number", text: $userName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        
                        Button("Send OTP") {
                            
                        }
                        .padding()
                        .background(Color(hex: "43328B"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal,20)
                    
                    TextField("Enter OTP", text: $userName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                        .padding(.horizontal,20)
                    
                    
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
                    .padding(.horizontal,20)

                    
                    Button {
                        //Handle login button action
                    } label: {
                        Text("Authenticate")
                           .fontWeight(.bold)
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color(hex: "43328B"))
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .shadow(radius: 2)
                    }
                    .padding(.horizontal,50)
                    .padding(.top,10)
                    
                    Button {
                        //Handle login button action
                    } label: {
                        Text("Next")
                           .fontWeight(.bold)
                           .frame(maxWidth: .infinity,maxHeight: 150)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .shadow(radius: 2)
                           .padding(.top,-35)
                    }
                    .padding(.horizontal,50)

                    
                }
                
                
                
            }
            
        }
    }
}

#Preview {
    SignUpView()
}
