//
//  SearchBar.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 04.08.2024.
//

import SwiftUI

enum ImageButtonForSearch: String {
    case mappin = "mappin.and.ellipse"
    case slider = "slider.vertical.3"
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
}

struct SearchBar: View {
    
    @StateObject var viewModel = MainViewModel()
    @State private var searchText: String = ""
    @FocusState.Binding var isFocus: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    viewModel.input.mapButton.send()
                } label: {
                    ImageButtonForSearch.mappin.image
                        .foregroundStyle(.gray)
                }
                
                TextField("Kubernen, Indonesia", text: $searchText)
                    .foregroundStyle(.gray)
                    .focused($isFocus)
                    .onChange(of: searchText, perform: { value in
                        viewModel.input.textFromSearchBar.send(value)
                    })
                
                Spacer()
                
                Button {
                    viewModel.input.sliderButton.send()
                } label: {
                    ImageButtonForSearch.slider.image
                        .foregroundStyle(.gray)
                }
                
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
        }
    }
}
