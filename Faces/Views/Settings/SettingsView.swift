//
//  SettingsView.swift
//  Faces
//
//  Created by Mihail Verejan on 18.04.2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    var body: some View {
        NavigationView {
            ZStack {
                Color.AppBackground
                .ignoresSafeArea()
                
                List {
                    Section(header: Text("Appearance")) {
                        NavigationLink(destination: Themes()) {
                            HStack {
                                Image(systemName: "paintbrush")
                                .font(.system(size: 20))
                                .frame(width: 40, height: 40)
                                Text("Theme")
                                .foregroundColor(Color.PrimaryText)
                            }
                            .padding(.vertical, 12)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1)))
                        
                        NavigationLink(destination: Icons()) {
                            HStack {
                                Image(systemName: "app")
                                    .font(.system(size: 20))
                                    .frame(width: 40, height: 40)
                                Text("App Icon")
                                .foregroundColor(Color.PrimaryText)
                            }
                            .padding(.vertical, 12)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1)))
                    }
                    Section {
                        Toggle(isOn: $notificationsEnabled) {
                            HStack {
                                Image(systemName: "bell")
                                    .font(.system(size: 20))
                                    .frame(width: 40, height: 40)
                                Text("Notifications")
                                .foregroundColor(Color.PrimaryText)
                            }
                            .padding(.vertical, 12)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1)))
                    }
                    Section {
                        NavigationLink(destination: Text("Help content coming soon")) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .font(.system(size: 20))
                                    .frame(width: 40, height: 40)
                                Text("Help")
                                .foregroundColor(Color.PrimaryText)
                            }
                            .padding(.vertical, 12)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1))
                        )
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Settings")
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    SettingsView()
}
