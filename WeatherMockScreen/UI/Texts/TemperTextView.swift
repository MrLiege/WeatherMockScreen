//
//  TemperTextView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 04.08.2024.
//

import SwiftUI

struct TemperTextView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        HStack {
            Text("\(viewModel.output.temperatureText.value)°C")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TemperTextView()
        .background(.black)
}
