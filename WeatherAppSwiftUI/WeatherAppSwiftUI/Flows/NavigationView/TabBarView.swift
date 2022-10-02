//
//  TabBarView.swift
//  WeatherAppSwiftUI
//
//  Created by Мария Коханчик on 02.10.2022.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Properties
    
    var action: () -> Void
    
    // MARK: - Content view
    
    var body: some View {
        ZStack {
            // MARK: Arc Shape
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay {
                    // MARK: Arc Border
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
            
            // MARK: Tab Items
            HStack {
                // MARK: Expand Button
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                // MARK: Navigation Button
                NavigationLink {
                    WeatherView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

// MARK: - Screen content view

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(action: {})
            .preferredColorScheme(.dark)
    }
}

