//
//  WeatherCellView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 05.08.2024.
//

import SwiftUI

//MARK: General View

struct WeatherCellView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 17) {
                OtherWeatherView()
                OtherWeatherView()
                OtherWeatherView()
                OtherWeatherView()
            }
            .padding(.leading, 25)
        }
    }
}


//MARK: Config for Cell

struct OtherWeatherView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                weatherImage(name: "SunRain", 
                             width: UIScreen.main.bounds.width * 0.12)
                descriptionWeatherText(title: "Location",
                                       value: viewModel.outputOtherCity.locationText.value)
                .padding(.horizontal)
            }
            HStack() {
                descriptionWeatherText(title: "Wind", 
                                       value: viewModel.outputOtherCity.windText.value)
                descriptionWeatherText(title: "Temp",
                                       value: viewModel.outputOtherCity.temperatureText.value)
                descriptionWeatherText(title: "Humidity",
                                       value: viewModel.outputOtherCity.humidityText.value)

            }
        }
        .padding()
        .background(Color("cellColor"))
        .cornerRadius(25)
    }
}

extension OtherWeatherView {
    @ViewBuilder
    func weatherImage(name: String, width: CGFloat) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
    }
    
    func descriptionWeatherText<T>(title: String, value: T) -> some View {
        VStack() {
            Text(title)
                .font(.headline)
                .fontWeight(.thin)
                .foregroundStyle(.white)
            Text("\(value)")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundStyle(.white)
        }
    }
}


#Preview {
    WeatherCellView()
        .background(.black)
}
