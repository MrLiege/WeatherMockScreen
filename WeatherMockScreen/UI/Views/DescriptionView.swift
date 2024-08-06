//
//  DescriptionView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 04.08.2024.
//

import SwiftUI

struct DescriptionView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        HStack(spacing: 30) {
            Image("SunRain")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            VStack(alignment: .leading) {
                
                textForDespriptionView(title: "Wind", value: viewModel.output.windText.value)
                textForDespriptionView(title: "Humidi", value: viewModel.output.humidityText.value, withPrecent: true)
                
                Button(action: {
                    viewModel.input.detailButton.send()
                }) {
                    Text("Detailed")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundStyle(.white)
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 26)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension DescriptionView {
    
    @ViewBuilder
    func textForDespriptionView(title: String, value: Int, withPrecent: Bool = false) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.thin)
                .foregroundStyle(.white)
            Text("\(value)\(withPrecent ? "%" : "")")
                .font(.title)
                .fontWeight(.regular)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        DescriptionView()
        Spacer()
    }
    .padding()
    .frame(width: .infinity)
    .background { Color.blue.ignoresSafeArea() }
}
