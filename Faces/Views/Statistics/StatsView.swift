//
//  SecondView.swift
//  Faces
//
//  Created by Mihail Verejan on 16.04.2025.
//



import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.AppBackground
                .ignoresSafeArea()
                
                Text("Statistics")
                
                    .listStyle(InsetGroupedListStyle())
                    .navigationTitle("Statistics")
                    .scrollContentBackground(.hidden)
            }
        }
            
    }
}



#Preview {
    StatsView()
}
