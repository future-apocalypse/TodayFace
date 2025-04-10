//
//  ContentView.swift
//  Faces
//
//  Created by Mihail Verejan on 10.04.2025.
//

import SwiftUI

struct YearGridView: View {
    var body: some View {
        
        ZStack {
            //Background
                    Color.AppBackground
                    .ignoresSafeArea()
            
            //Content
            VStack {
                Text("312")
                    .font(.system(size: 56, design: .serif))
                    .foregroundColor(.PrimaryText)
                
                Text("days ")
                    .font(.system(size: 24, design: .serif))
                    .italic()
                    .foregroundColor(.SecondaryText) +
                Text("left in 2025")
                    .font(.system(size: 24, design: .serif))
                    .foregroundColor(.PrimaryText)
                Spacer()
            }
            
            
                 
                }
        
        
    }
}

#Preview {
    YearGridView()
}
