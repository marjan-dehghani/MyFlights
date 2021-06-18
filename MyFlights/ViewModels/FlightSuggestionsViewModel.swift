//
//  FlightsViewModel.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//

import Foundation
import Combine

class FlightSuggestionsViewModel: ObservableObject{
    
    //MARK: - VARIABLES
    private var store: FlightSuggestionStore
    private var cancellables = Set<AnyCancellable>()
    @Published var flightSuggestions: [FlightSuggestion] = []
    @Published var isFetchingData: Bool = false
    @Published var showAlert: Bool = false
    var alertMessage = ""
    
    //MARK: - init
    init(store: FlightSuggestionStore) {
        
        self.store = store
        
        self.isFetchingData = true
                
        store.flightSuggestions.sink { [weak self] (value) in

            if value.isEmpty{

                self?.fetchNewSuggestionsFromServer()

            }else{

                self?.isFetchingData = false

                self?.flightSuggestions = value

            }

        }.store(in: &cancellables)
        
    }
    
    //MARK: - CUSTOM FUNCTIONS
    
    private func fetchNewSuggestionsFromServer(){
        
        self.isFetchingData = true
        
        let params: Parameters = ["v": 3,
                                  "sort":"popularity",
                                  "asc": 1,"children": 0,
                                  "infants": 0,
                                  "flyFrom": "PRG",
                                  "to": "anywhere",
                                  "featureName": "aggregateResults",
                                  "dateFrom": DateHelper.shared.current(format: .allNumeric) ?? "",
                                  "typeFlight": "oneway",
                                  "wait_for_refresh": 0,
                                  "adults": 1,
                                  "limit": 20,
                                  "partner": "skypicker"]
        
        let endpoint = FlightsEndpoint.search(params: params)
        let publisher: AnyPublisher<Response<FlightsSearchResult>, Error> = APIAgent.run(endpoint)
        
        publisher.sink { (_) in
            
        } receiveValue: { [weak self] (receivedValue) in
            
            if let result = receivedValue.value{
                
                self?.store.add(result.data ?? [])
                
            }else{
                
                self?.alertMessage = receivedValue.error.debugDescription
                self?.showAlert = true
                
            }
            
        }.store(in: &cancellables)
        
        
    }
    
}
