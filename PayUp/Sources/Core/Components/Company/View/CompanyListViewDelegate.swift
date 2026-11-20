//
//  CompanyListViewDelegate.swift
//  PayUp
//
//  Created by Ronan Fernandes on 20/11/26.
//

protocol CompanyListViewDelegate: AnyObject {
    func didSelectCompany(_ company: CompanyItemModel)
}
