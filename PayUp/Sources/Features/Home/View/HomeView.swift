//
//  HomeView.swift
//  PayUp
//
//  Created by Ronan Fernandes on 05/09/26.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    private let mockCompanies = [
        CompanyItemModel(name: "Aurora Tech Soluçoes Digitais"),
        CompanyItemModel(name: "Valtrix Labs"),
        CompanyItemModel(name: "Rocketseat"),
    ]
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bell"), for: .normal)
        button.tintColor = Colors.textHeading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let daySelectorView: DaySelectorView = {
        let daySelectorView = DaySelectorView()
        daySelectorView.translatesAutoresizingMaskIntoConstraints = false
        return daySelectorView
    }()
    
    private let paymentCardView: PaymentCardView = {
        let cardView = PaymentCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private var companyListView: CompanyListView
    
    override init(frame: CGRect) {
        self.companyListView = CompanyListView(companies: mockCompanies)
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.backgroundPrimary
        addSubview(logoImage)
        addSubview(bellButton)
        addSubview(profileImage)
        addSubview(daySelectorView)
        addSubview(paymentCardView)
        
        addSubview(companyListView)
        companyListView.disableAutoresizingMaskTranslation()
        
        setupConstraints()
        setupPaymentCard()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -24),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImage.heightAnchor.constraint(equalToConstant: 24),
            logoImage.widthAnchor.constraint(equalToConstant: 82),
            
            bellButton.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            bellButton.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: -24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            
            profileImage.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            profileImage.heightAnchor.constraint(equalToConstant: 44),
            profileImage.widthAnchor.constraint(equalToConstant: 44),
            
            daySelectorView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 55),
            daySelectorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            daySelectorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            daySelectorView.heightAnchor.constraint(equalToConstant: 48),
            
            paymentCardView.topAnchor.constraint(equalTo: daySelectorView.bottomAnchor, constant: 24),
            paymentCardView.leadingAnchor.constraint(equalTo: daySelectorView.leadingAnchor),
            paymentCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            paymentCardView.heightAnchor.constraint(equalToConstant: 95),
            
            companyListView.topAnchor.constraint(equalTo: paymentCardView.bottomAnchor, constant: 24),
            companyListView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            companyListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyListView.heightAnchor.constraint(equalToConstant: 141),
        ])
    }
    
    private func setupPaymentCard() {
        paymentCardView.configure(name: "Aurora Digital Solutions", value: "R$ 100,00")
    }
}
