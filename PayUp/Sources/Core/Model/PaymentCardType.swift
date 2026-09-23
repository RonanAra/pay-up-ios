//
//  PaymentCardType.swift
//  PayUp
//
//  Created by Ronan Fernandes on 16/09/26.
//

import Foundation

enum PaymentCardType {
    case incoming
    case transaction
    
    var iconName: String {
        switch self {
        case .incoming:
            return "calendarDollar"
        case .transaction:
            return "coins"
        }
    }
    
    var subtitle: String {
        switch self {
        case .incoming:
            return "A Receber"
        case .transaction:
            return "Lançamento"
        }
    }
}
