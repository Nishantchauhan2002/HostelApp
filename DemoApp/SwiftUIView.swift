//
//  SwiftUIView.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 28/03/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selectedTab: Int = 0  // Track the selected tab

        let tabs: [(image: String, tag: Int)] = [
            ("square.grid.2x2", 0),  // Example SF Symbols
            ("person.badge.key", 1),
            ("house.fill", 2),
            ("fork.knife", 3),
            ("indianrupeesign", 4)
        ]
        
        var body: some View {
            VStack {
                Spacer()
                HStack {
                    ForEach(tabs, id: \.tag) { tab in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedTab = tab.tag
                            }
                        }) {
                            VStack {
                                Image(systemName: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(
                                        Circle()
                                            .fill(Color.init(hex: "5F529C").opacity(selectedTab == tab.tag ? 1 : 0))
                                            .shadow(color: selectedTab == tab.tag ? Color.white.opacity(0.9) : Color.clear, radius: 5)
                                    )
                                    .offset(y: selectedTab == tab.tag ? -20 : 0)  // Move the selected button up
                                    .scaleEffect(selectedTab == tab.tag ? 1.2 : 1) // Scale effect for selected tab
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.init(hex: "43328B")))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
}


struct ContentView: View {
    var body: some View {
        SwiftUIView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    SwiftUIView()
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (no alpha)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
