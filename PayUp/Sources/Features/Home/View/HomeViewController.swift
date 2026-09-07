//
//  HomeViewController.swift
//  PayUp
//
//  Created by Ronan Fernandes on 05/09/26.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
