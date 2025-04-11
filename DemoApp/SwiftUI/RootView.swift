//
//  RootView.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 11/04/25.
//

import SwiftUI

struct RootView: View {
    @State private var isRegisterPresented = false

    
    var body: some View {
        NavigationStack {
            LoginView(
                onRegisterTapped: {
                    isRegisterPresented = true
                },
                onSignIn: { username, password in
                    print("Login Data: \(username), \(password)")
                }
            )
            .navigationDestination(isPresented: $isRegisterPresented) {
                SignUpView()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RootView()
}
