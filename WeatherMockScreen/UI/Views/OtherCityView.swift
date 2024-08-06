//
//  OtherCityView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 05.08.2024.
//

import SwiftUI

struct OtherCityView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        HStack {
            Text("Other City")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
            
            Button(action: {
                viewModel.input.viewAllButton.send()
            }) {
                Text("View All")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
            }
        }
        .padding()
    }
}

#Preview {
    OtherCityView()
        .background(.black)
}
