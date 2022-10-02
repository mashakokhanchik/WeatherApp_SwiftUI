//
//  ForecastView.swift
//  WeatherAppSwiftUI
//
//  Created by Мария Коханчик on 02.10.2022.
//

import SwiftUI

struct ForecastView: View {
    
    // MARK: - Properties
    
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    
    // MARK: - Content view
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // MARK: Segmented Control
                SegmentedControlView(selection: $selection)
                
                // MARK: Forecast Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(ForecastModel.hourly) { forecast in
                                ForecastCardView(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(ForecastModel.daily) { forecast in
                                ForecastCardView(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                // MARK: Forecast Widgets
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

// MARK: - Screen content view

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}

