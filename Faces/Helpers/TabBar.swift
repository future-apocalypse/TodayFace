//
//  TabBar.swift
//  Faces
//
//  Created by Mihail Verejan on 18.04.2025.
//



import SwiftUI




struct TabBar: View {
    @State var currentTab: Tab = .grid
    @Namespace var animation
    
    
    
    var body: some View {
        
        HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    VStack(spacing: 0){
                        Image(systemName: tab.systemImageName)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(currentTab == tab ? .PrimaryText : .gray.opacity(0.6))
                        if currentTab == tab {
                            Circle()
                                .fill(Color.SecondaryText)
                                .frame(width: 5, height: 5)
                                .offset(y: 10)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut){ currentTab = tab }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .contentShape(Rectangle())
            
        
    }
    
    //Change to images in future...
    enum Tab: String, CaseIterable {
        case grid = "Grid"
        case statistic = "Statistic"
        case settings = "Settings"
        
        var systemImageName: String {
            switch self {
            case .grid:
                return "square.grid.2x2"
            case .statistic:
                return "chart.bar"
            case .settings:
                return "gearshape"
            }
        }
    }

}


