//
//  CarouselView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 26/09/2025.
//

import SwiftUI

struct CarouselView: View {
    
    var items: [AvatarModel] = AvatarModel.mocks
    @State private var selection: AvatarModel?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        HeroCellView(
                            title: item.name,
                            subtitle: item.characterDescription,
                            imageName: item.profileImageName
                        )
                        .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1 : 0.9)
                        })
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: items.count, { oldValue, newValue in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }
            
            HStack {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? .accent : .secondary.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil {
            selection = items.first
        }
    }
}

#Preview {
    CarouselView()
        .padding()
}
