//
//  HapticManager.swift
//  Faces
//
//  Created by Mihail Verejan on 11.06.2025.
//

import SwiftUI

final class HapticManager: ObservableObject {
    static let shared = HapticManager() // Singleton

    @AppStorage("hapticsEnabled") var hapticsEnabled: Bool = true

    @Published var trigger = false

    func triggerHaptic() {
        guard hapticsEnabled else { return }
        trigger.toggle()
    }
}
