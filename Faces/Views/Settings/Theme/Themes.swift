//
//  Themes.swift
//  Faces
//
//  Created by Mihail Verejan on 10.06.2025.
//

import SwiftUI

struct Themes: View {
    var body: some View {
        ZStack {
            Color.AppBackground.ignoresSafeArea()
            VStack {
                Text("Hello, Themes!")
                    .font(.largeTitle)
            }
        }
        
    }
}

#Preview {
    Themes()
}
