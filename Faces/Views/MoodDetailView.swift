//
//  MoodDetailView.swift
//  Faces
//
//  Created by Mihail Verejan on 16.04.2025.
//

import SwiftUI

struct MoodDetailView: View {
    let mood: MoodType
    let date: Date
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                HStack {
                    Spacer()
                    //Dismiss button
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                            .font(.system(size: 14, weight: .bold))
                            .padding(10)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Circle())
                    }
                    
                    
                }
                
                Text(formattedDate)
                    .font(.system(size: 18, design: .serif))
                    .foregroundColor(.PrimaryText)
                
                VStack {
                    Text(mood.emotions)
                        .font(.system(size: 100))
                        .padding(.top, 32)
                }
                
                Text(mood.description)
                    .font(.body)
                    .foregroundColor(.PrimaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}

#Preview {
    MoodDetailView(mood: MoodType.okay, date: Date())
}
