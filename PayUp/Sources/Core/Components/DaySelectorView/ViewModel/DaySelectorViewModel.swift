//
//  DaySelectorViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 07/09/26.
//

import Foundation

final class DaySelectorViewModel {
    
    let days = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
    private var currentSelectedIndex: Int
    var onDaySelected: ((Int) -> Void)?
    
    private let calendar = Calendar.current
    
    init() {
        let weekDay = calendar.component(.weekday, from: Date())
        currentSelectedIndex = (weekDay + 5) % 7
    }
    
    var selectedIndex: Int {
        let weekday = calendar.component(.weekday, from: Date())
        return (weekday + 5) % 7
    }
    
    func selectDay(at index: Int) {
        onDaySelected?(index)
    }
    
    func getSelectedDay() -> Int? {
        return currentSelectedIndex + 1
    }
}
