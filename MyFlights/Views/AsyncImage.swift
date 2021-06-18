//
//  AsyncImage.swift
//  MyFlights
//
//  Created by Marjan on 3/27/1400 AP.
//

import SwiftUI

struct AsyncImage: View {
    
    @StateObject private var loader: ImageLoader
    
    init(url: URL) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        ZStack{
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                
            }
        }.onAppear {
            loader.load()
        }
    }
    
}
