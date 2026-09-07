//
//  DaySelectorViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 07/09/26.
//

import Foundation

final class DaySelectorViewModel {
    
    let days = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
    
    private let calendar = Calendar.current
    
    var selectedIndex: Int {
        let weekday = calendar.component(.weekday, from: Date())
        return (weekday + 5) % 7
    }
    
    var onDaySelected: ((Int) -> Void)?
    
    func selectDay(at index: Int) {
        onDaySelected?(index)
    }
}
