//
//  PulsingCircleView.swift
//  Faces
//
//  Created by Mihail Verejan on 15.04.2025.
//



import SwiftUI

struct PulsingCircleView: View {
    @State private var animate = false

    var body: some View {
        Circle()
            .fill(Color.SecondaryText) // Center dot
            .frame(width: 5, height: 5)
            .background(
                ZStack {
                    // Pulse layers in background
                    Circle()
                        .fill(Color.SecondaryText.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .scaleEffect(animate ? 1.4 : 0.2)
                        .opacity(animate ? 0 : 1)
                        .blur(radius: 2)

                    Circle()
                        .fill(Color.SecondaryText.opacity(0.4))
                        .frame(width: 30, height: 30)
                        .scaleEffect(animate ? 1.3 : 0.2)
                        .opacity(animate ? 0 : 1)
                        .blur(radius: 2)

                    Circle()
                        .fill(Color.SecondaryText.opacity(0.5))
                        .frame(width: 20, height: 20)
                        .scaleEffect(animate ? 1.2 : 0.2)
                        .opacity(animate ? 0 : 1)
                        .blur(radius: 2)
                }
            )
            .offset(y: 1)
            .onAppear {
                DispatchQueue.main.async {
                    animate = true
                }
            }
            .animation(
                Animation.easeOut(duration: 1.5).repeatForever(autoreverses: false),
                value: animate
            )
    }
}
