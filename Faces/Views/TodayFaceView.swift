//
//  TodayFaceView.swift
//  Faces
//
//  Created by Mihail Verejan on 11.04.2025.
//



import SwiftUI




struct TodayFaceView: View {
    @State private var selectedMood: MoodType = .okay
    
    var body: some View {
        ZStack {
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Today is \(formattedDate())")
                    .font(.headline)
                    .padding(.top)
                
                Text("🌞 Choose your mood")
                    .font(.system(size: 40))
                
                HStack {
                    ForEach(MoodType.allCases, id: \.self) { mood in
                        Button(action: {
                            selectedMood = mood
                        }) {
                            Text(mood.emotions)
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()
                
                Text("“You are doing great. Just keep going.”")
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
}


#Preview {
    TodayFaceView()
}
