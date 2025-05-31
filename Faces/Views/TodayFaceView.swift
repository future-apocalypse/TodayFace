//
//  TodayFaceView.swift
//  Faces
//
//  Created by Mihail Verejan on 11.04.2025.
//



import SwiftUI




struct TodayFaceView: View {
    @State private var selectedMood: MoodType? = nil
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            //Background
            Color.AppBackground
                .ignoresSafeArea()
            
            VStack{
                // Close button at the top left
                HStack {
                    Spacer()
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
                .padding(.bottom, 5)
                
                // Dynamic greeting
                HStack {
                    Text("\(greetingSymbol()) \(greetingMessage())")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                        .fontWeight(.medium)
                }
               
                
                // Main question
                HStack {
                    Text("How are you")
                        .font(.system(size: 32, design: .serif))
                        .fontWeight(.medium)
                        .foregroundColor(.PrimaryText)
                    
                    +
                    
                    Text(" feeling ")
                    
                        .font(.system(size: 44, design: .serif))
                        
                        .italic()
                        .foregroundColor(.SecondaryText)
                        .fontWeight(.semibold)
                    +
                    
                    Text("today?")
                        .font(.system(size: 32, design: .serif))
                        .fontWeight(.medium)
                        .foregroundColor(.PrimaryText)
                    }
                .padding(.top, 40)
                 
                //Mood picker
                HStack {
                    ForEach(MoodType.allCases, id: \.self) { mood in
                        Button(action: {
                            selectedMood = mood
                        }) {
                            Text(mood.emotions)
                                .font(.system(size: 40))
                                //.padding(6)
                                //.background(selectedMood == mood ? Color.accentColor.opacity(0.15) : Color.clear)
                                .clipShape(Circle())
                        }
                        .scaleEffect(selectedMood == mood ? 1.5 : 1.0)
                        .animation(.spring(response: 0.35, dampingFraction: 0.5), value: selectedMood)
                    }
                }
                .padding()
    
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.system(size: 20, design: .serif))
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Button(action: {
                    if let mood = selectedMood {
                        MoodStorage.saveMood(mood, for: Date())
                        dismiss()
                    }
                }) {
                    Text("Confirm")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedMood != nil ? Color.SecondaryText : Color.gray.opacity(0.3))
                        .foregroundColor(.PrimaryText)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
                .disabled(selectedMood == nil)
            }
            .padding()
            
        }
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
    //Greetings
    private func greetingMessage() -> String {
            let hour = Calendar.current.component(.hour, from: Date())
            
            switch hour {
            case 5..<12:
                return "Good Morning"
            case 12..<17:
                return "Good Afternoon"
            case 17..<22:
                return "Good Evening"
            default:
                return "Good Night"
            }
        }
    
    private func greetingSymbol() -> Image {
            let hour = Calendar.current.component(.hour, from: Date())
            switch hour {
                case 5..<12:
                    return Image(systemName: "sun.and.horizon.fill") // Morning
                case 12..<17:
                    return Image(systemName: "sun.max.fill") // Afternoon
                case 17..<20:
                    return Image(systemName: "sun.horizon.fill") // Evening
                default:
                    return Image(systemName: "moon.fill") // Night
                }
        }
}


#Preview {
    TodayFaceView()
}
