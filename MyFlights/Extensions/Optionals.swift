//
//  Optionals.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import Foundation

extension Optional where Wrapped == String{
    
    var isNilOrEmpty: Bool{
        
        guard let wrappedValue = self else { return false }
        return wrappedValue.isEmpty
        
    }
    
}
