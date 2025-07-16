//
//  ContentView.swift
//  Vitality2
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Vitality!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.071, green: 0.398, blue: 0.309))
                    .padding(70)
                Text("discover the best version of you!")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.071, green: 0.398, blue: 0.309))
            
                Image("daisy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(110)
                
                
                VStack(spacing: 20) {
                    NavigationLink(destination: Checklist()) {
                        Text("Checklist")
                            .foregroundColor(Color(red: 0.937, green: 0.894, blue: 0.812)) // Sand text
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.071, green: 0.398, blue: 0.309)) // Dark green button
                            .cornerRadius(100)
                    }

                    NavigationLink(destination: Encouragement()) {
                        Text("Encouragement")
                            .foregroundColor(Color(red: 0.937, green: 0.894, blue: 0.812))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.071, green: 0.398, blue: 0.309))
                            .cornerRadius(100)
                    }
                }
                .padding(.horizontal, 40)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.576, green: 0.804, blue: 0.698)) // Light green background
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
