//
//  FlightSuggestionsView.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import SwiftUI

struct FlightSuggestionsView: View {
    
    @State private var index: Int = 0
    @StateObject var vm: FlightSuggestionsViewModel
    @State private var canScrollUp: Bool = false
    @State private var canScrollDown: Bool = true
    @State private var isShowingAlert: Bool = false
    
    init(store: FlightSuggestionStore) {
        
        _vm = StateObject(wrappedValue: FlightSuggestionsViewModel(store: store))
        
    }
    
    var body: some View {
        
        VStack{
            
            if vm.isFetchingData{
                
                ///show loading
                
                ProgressView()
                    .foregroundColor(Colors.darkGreen.color)
                
            }else{
                
                ///show content
                
                if canScrollUp{
                    SwipeIndicator(type: .topToBottom)
                        .frame(width: 56, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.clear)
                }
                
                PagerView(flights: self.vm.flightSuggestions, index: self.$index, canScrollUp: $canScrollUp, canScrollDown: $canScrollDown)
                    .clipped()

                if canScrollDown{
                    SwipeIndicator(type: .bottomToTop)
                        .frame(width: 56, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.clear)
                }
                
            }

        }
        .onReceive(vm.$showAlert, perform: { (value) in
            if value{
                self.isShowingAlert = true
            }
        })
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: Text("Sorry"), message: Text(vm.alertMessage), dismissButton: .default(Text("Ok")))
        })

    }
}
