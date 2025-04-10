//
//  FaceView.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//



import SwiftUI


struct FaceView: View {
    let mood: MoodType
    
    var body: some View {
        
        Text(mood.emoji)
            .font(.system(size: 15))
            .frame(width: 20, height: 20)
        }
            
    }
    
   

