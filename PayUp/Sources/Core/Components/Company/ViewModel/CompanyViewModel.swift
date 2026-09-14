//
//  CompanyViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 14/09/26.
//

import Foundation

final class CompanyViewModel {
    
    var companies: [CompanyItemModel] = []
    
    init(companies: [CompanyItemModel]) {
        self.companies = companies
    }
}
