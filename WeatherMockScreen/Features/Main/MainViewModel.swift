//
//  MainViewModel.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 04.08.2024.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    let input: Input
    @Published var output: Output
    @Published var outputOtherCity: Output
    
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        self.outputOtherCity = Output()
        
        bind()
    }
}

private extension MainViewModel {
    func bind() {
        
        //MARK: -- Output Methods
        
        //MARK: - For Your Location
        output.dateText.send("\(Date().customeDate())")
        output.temperatureText.send(18)
        output.windText.send(342)
        output.humidityText.send(25)
        
        //MARK: -- For Other City
        outputOtherCity.locationText.send("Jakarta")
        outputOtherCity.windText.send(367)
        outputOtherCity.temperatureText.send(14)
        outputOtherCity.humidityText.send(25)
        
        
        //MARK: -- Input Methods
        
        // MARK: - Elements from SearchBar
        input.textFromSearchBar
            .delay(for: 0.2, scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                print("\(text)")
                self?.output.searchText.send(text)
            }
            .store(in: &cancelables)
        
        input.mapButton
            .sink {
                print("Click Map")
            }
            .store(in: &cancelables)
        
        input.sliderButton
            .sink {
                print("Click Slider")
            }
            .store(in: &cancelables)
        
        // MARK: - Element from DescriptionView
        input.detailButton
            .sink {
                print("Click Detailed")
            }
            .store(in: &cancelables)
        
        // MARK: - Element from OtherCityView
        input.viewAllButton
            .sink {
                print("Click View All")
            }
            .store(in: &cancelables)
    }
}


extension MainViewModel {
    struct Input {
        let textFromSearchBar = PassthroughSubject<String, Never>()
        let mapButton = PassthroughSubject<Void, Never>()
        let sliderButton = PassthroughSubject<Void, Never>()
        let detailButton = PassthroughSubject<Void, Never>()
        let viewAllButton = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var searchText = CurrentValueSubject<String, Never>("")
        var dateText = CurrentValueSubject<String, Never>("")
        var temperatureText = CurrentValueSubject<Int, Never>(0)
        var windText = CurrentValueSubject<Int, Never>(0)
        var humidityText = CurrentValueSubject<Int, Never>(0)
        var locationText = CurrentValueSubject<String, Never>("Unknown")
    }
}
