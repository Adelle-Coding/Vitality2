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
                Text("bloom into your full potential!")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.071, green: 0.398, blue: 0.309))
                
                Image("daisy")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(55)
                
                
                VStack(spacing: 20) {
                    NavigationLink(destination: Checklist()) {
                        Text("Checklist")
                            .foregroundColor(Color(red: 0.937, green: 0.894, blue: 0.812)) // Sand text
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.071, green: 0.398, blue: 0.309)) // Dark green button
                            .cornerRadius(100)
                    }
                    
                    NavigationLink(destination: EncouragementView()) {
                        Text("Encouragement")
                            .foregroundColor(Color(red: 0.937, green: 0.894, blue: 0.812))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.071, green: 0.398, blue: 0.309))
                            .cornerRadius(100)
                    }
                    
                    NavigationLink(destination: Resources()) {
                        Text("Resources Page")
                            .foregroundColor(Color(red: 0.937, green: 0.894, blue: 0.812))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.071, green: 0.398, blue: 0.309))
                            .cornerRadius(100)
                            
                            //     Text("This is my root view 🌳")
                            //    NavigationLink(destination: SecondView()){
                            //   Text("Click Me!")
                            //.navigationTitle("Home!")
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 35.0)
                    .padding(.vertical, 10)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.576, green: 0.804, blue: 0.698)) // Light green background
                .ignoresSafeArea()
            }
        }
    }
