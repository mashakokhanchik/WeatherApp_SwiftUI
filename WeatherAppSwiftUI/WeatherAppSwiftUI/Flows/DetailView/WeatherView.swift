//
//  WeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Мария Коханчик on 02.10.2022.
//

import SwiftUI

struct WeatherView: View {
    
    // MARK: - Properties
    
    @State private var searchText = ""
    
    var searchResults: [ForecastModel] {
        if searchText.isEmpty {
            return ForecastModel.cities
        } else {
            return ForecastModel.cities.filter { $0.location.contains(searchText) }
        }
    }
    
    // MARK: - Content view
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color.background
                .ignoresSafeArea()
            
            // MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidgetView(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            // MARK: Navigation Bar
            NavigationBarView(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or airport")
    }
}

// MARK: - Screen content view

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
