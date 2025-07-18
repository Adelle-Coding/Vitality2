//
//  Resources.swift
//  Vitality2
//
//  Created by Cheryl Yu on 16/7/2025.
//

import SwiftUI

struct Resources: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the resources page!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.34, green: 0.276, blue: 0.251))
            Spacer()
            
            Image("light")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(55)
            
            Link("Activities", destination: URL(string: "https://www.healthline.com/health/mind-body/mindfulness-activities")!)
                .foregroundStyle(Color(red: 0.34, green: 0.276, blue: 0.251))
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.937, green: 0.894, blue: 0.812))
                .cornerRadius(100)
            
            Link("Healthy Recipes", destination: URL(string: "https://www.allrecipes.com/recipes/84/healthy-recipes/")!)
                .foregroundStyle(Color(red: 0.34, green: 0.276, blue: 0.251))
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.937, green: 0.894, blue: 0.812))
                .cornerRadius(100)
            
            Link("Beginner Workout Plan", destination: URL(string: "https://www.womenshealthmag.com/fitness/a42803758/beginner-workout-plan/")!)
                .foregroundStyle(Color(red: 0.34, green: 0.276, blue: 0.251))
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.937, green: 0.894, blue: 0.812))
                .cornerRadius(100)
        }
       
        .padding(.horizontal, 35.0)
        .padding(.vertical, 70)

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.514, green: 0.773, blue: 0.745)) // Light green background
        .ignoresSafeArea()
            
        }
    
    }
    
    
    #Preview {
        Resources()
    }



//NavigationStack {
    //   VStack {
      //  Text("This is my root view 🌳")
      //  NavigationLink(destination: SecondView()){
        //    Text("Click Me!")
            //    .navigationTitle("Home!")


//NavigationStack {
 //   VStack {
     //   Text("This is your second view!")
     //   NavigationLink(destination: Text("love you too!! ♥️")) {
       //     Text("click here if you love me!")
      //          .navigationTitle("take back the love 😔")
    //    }
