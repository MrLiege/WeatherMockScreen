//
//  DateTextView.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 04.08.2024.
//

import SwiftUI

struct DateTextView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        HStack {
            Text("Today, \(viewModel.output.dateText.value)")
                .font(.title3)
                .fontWeight(.thin)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    VStack {
        DateTextView()
        Spacer()
    }
    .padding()
    .frame(width: .infinity)
    .background { Color.blue.ignoresSafeArea() }
}
