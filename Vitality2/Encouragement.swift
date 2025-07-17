//
//  EncouragementView.swift
//  tester bit app
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

// - HEX COLOR SUPPORT
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - BRANDING COLORS
extension Color {
    static let brandingBrown = Color(hex: "554640")
    static let brandingGreen1 = Color(hex: "12664F")
    static let brandingGreen2 = Color(hex: "87BBA2")
    static let brandingTeal = Color(hex: "83C5BE")
    static let brandingCream = Color(hex: "EFE4CF")
}

// MARK: - ENCOURAGEMENT VIEW
struct EncouragementView: View {
    @State private var selectedDayIndex = Calendar.current.component(.weekday, from: Date()) - 1
    
    let messages = [
        "You are amazing! ✨",
        "You're doing great! 🌟",
        "You deserve love! 💕",
        "Your feelings matter! 🌈",
        "Take a deep breath! 🌸",
        "You are enough! 💖",
        "Celebrate small wins! 🎉"
    ]
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let shortDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var thisWeek: [Date] {
        let today = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: today)
        let startOfWeek = calendar.date(byAdding: .day, value: -((weekday - 1)), to: today)!
        return (0..<7).map { calendar.date(byAdding: .day, value: $0, to: startOfWeek)! }
    }
    
    func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title
                VStack(spacing: 6) {
                    Text("Vitality")
                        .font(.system(size: 40, weight: .bold))
                      .foregroundColor(.brandingBrown)
                    
                    Text("Your daily dose of encouragement")
                        .font(.subheadline)
                      .foregroundColor(.brandingBrown)
                }
                .padding(.top, 30)
                
                // Day Buttons
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                    ForEach(0..<7) { i in
                        let date = thisWeek[i]
                        VStack {
                            Text(shortDays[i])
                                .font(.caption)
                                .bold()
                            
                            Text("\(Calendar.current.component(.day, from: date))")
                                .font(.title3)
                                .bold()
                            
                            if isToday(date) {
                                Text("Today")
                                    .font(.caption2)
                                  .foregroundColor(.brandingGreen1)
                            }
                              }
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(selectedDayIndex == i ? Color.brandingTeal : Color.white)
                             .overlay(
                             RoundedRectangle(cornerRadius: 10)
                             .stroke(isToday(date) ? Color.brandingGreen1 : Color.brandingGreen2, lineWidth: isToday(date) ? 3 : 2)
                             )
                             .cornerRadius(10)
                             .foregroundColor(.brandingBrown)
                             .onTapGesture {
                             selectedDayIndex = i
                             }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Message Box
                    VStack(spacing: 16) {
                        Text(days[selectedDayIndex])
                            .font(.title)
                            .bold()
                             .foregroundColor(.brandingBrown)
                        
                        Text(
                            thisWeek[selectedDayIndex]
                                .formatted(.dateTime.month().day().year())
                        )
                          .foregroundColor(.brandingGreen2)
                        .font(.caption)
                        
                        VStack(spacing: 12) {
                            Text(messages[selectedDayIndex])
                                .font(.headline)
                              .foregroundColor(.brandingBrown)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                         .background(Color.brandingTeal)
                        .cornerRadius(10)
                        
                        Text("Take a moment to breathe deeply and let this message sink in.")
                            .font(.footnote)
                         .foregroundColor(.brandingGreen2)
                        
                        Text("You are worthy of all the love and kindness in the world. 💕")
                            .font(.footnote)
                            .fontWeight(.bold)
                         .foregroundColor(.brandingBrown)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
                    
                    // Footer
                    Text("Remember: Your mental health journey is unique and beautiful. Take it one day at a time. 🌱")
                        .font(.footnote)
                        .foregroundColor(.brandingBrown)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                }
                
                .frame(maxWidth: .infinity)
                
                
            }
            .background(
                  Color.brandingCream
                   .ignoresSafeArea()
            )
        }
    }


#Preview {
    EncouragementView()
}

