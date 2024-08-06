//
//  MainView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 03.08.2024.
//

import SwiftUI

struct MainView: View {
    
    @FocusState private var isFocus: Bool
    
    var body: some View {
        ScrollView([]) {
            VStack {
                DateTextView()
                SearchBar(isFocus: $isFocus)
                    .padding(.horizontal, 25)
                TemperTextView()
                    .padding(.horizontal, 25)
                DescriptionView()
                    .padding(.horizontal, 25)
                OtherCityView()
                    .padding(.horizontal, 25)
                WeatherCellView()
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                isFocus = false
            }
        }
        .background {
            LinearGradient.backgroundLinearGradient().ignoresSafeArea(.all)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MainView()
}
