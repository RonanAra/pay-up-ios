//
//  HomeView.swift
//  PayUp
//
//  Created by Ronan Fernandes on 05/09/26.
//

import Foundation
import UIKit

final class HomeView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.disableAutoresizingMaskTranslation()
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.disableAutoresizingMaskTranslation()
        return view
    }()
    
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
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let addClientButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar cliente", for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 8
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    private let paymentCardView: PaymentCardView = {
        let cardView = PaymentCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private var companyListView: CompanyListView = {
        let view = CompanyListView(companies: [
            CompanyItemModel(name: "Aurora Tech Soluçoes Digitais"),
            CompanyItemModel(name: "Valtrix Labs"),
            CompanyItemModel(name: "Rocketseat"),
        ])
        view.disableAutoresizingMaskTranslation()
        return view
    }()
    
    private let transactionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lançamentos"
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let transactionDateLabel: UILabel = {
        let label = UILabel()
        label.text = "01 de abril"
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionCardView: PaymentCardView = {
        let cardView = PaymentCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ver Todos", for: .normal)
        button.titleLabel?.font = Fonts.titleSmall()
        button.setTitleColor(Colors.accentBrand, for: .normal)
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Filtrar", for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.setTitleColor(Colors.textHeading, for: .normal)
        button.tintColor = Colors.textHeading
        button.backgroundColor = Colors.backgroundSecondary
        button.layer.cornerRadius = 6
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.backgroundPrimary
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        setupConstraints()
        setupPaymentCard()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        setupViewsOnScroll()
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            logoImage.heightAnchor.constraint(equalToConstant: 24),
            logoImage.widthAnchor.constraint(equalToConstant: 82),
            
            profileImage.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            profileImage.heightAnchor.constraint(equalToConstant: 44),
            profileImage.widthAnchor.constraint(equalToConstant: 44),
            
            bellButton.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            bellButton.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: -24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            
            daySelectorView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 55),
            daySelectorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            daySelectorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            daySelectorView.heightAnchor.constraint(equalToConstant: 48),
            
            todayLabel.topAnchor.constraint(equalTo: daySelectorView.bottomAnchor, constant: 24),
            todayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            paymentCardView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 8),
            paymentCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            paymentCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            paymentCardView.heightAnchor.constraint(equalToConstant: 95),
            
            addClientButton.topAnchor.constraint(equalTo: paymentCardView.bottomAnchor, constant: 16),
            addClientButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            addClientButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            addClientButton.heightAnchor.constraint(equalToConstant: 48),
            
            viewAllButton.topAnchor.constraint(equalTo: addClientButton.bottomAnchor, constant: 24),
            viewAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            viewAllButton.heightAnchor.constraint(equalToConstant: 24),
            
            companyListView.topAnchor.constraint(equalTo: viewAllButton.bottomAnchor, constant: 16),
            companyListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            companyListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            companyListView.heightAnchor.constraint(equalToConstant: 141),
            
            transactionLabel.topAnchor.constraint(equalTo: companyListView.bottomAnchor, constant: 24),
            transactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            filterButton.centerYAnchor.constraint(equalTo: transactionLabel.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            filterButton.heightAnchor.constraint(equalToConstant: 40),
            
            transactionDateLabel.topAnchor.constraint(equalTo: transactionLabel.bottomAnchor, constant: 16),
            transactionDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            transactionCardView.topAnchor.constraint(equalTo: transactionDateLabel.bottomAnchor, constant: 8),
            transactionCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            transactionCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            transactionCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            transactionCardView.heightAnchor.constraint(equalToConstant: 95)
        ])
    }
    
    private func setupViewsOnScroll() {
        let views: [UIView] = [
            logoImage,
            bellButton,
            profileImage,
            daySelectorView,
            todayLabel,
            paymentCardView,
            addClientButton,
            viewAllButton,
            companyListView,
            transactionLabel,
            transactionDateLabel,
            filterButton,
            transactionCardView
        ]
        views.forEach { contentView.addSubview($0) }
    }
    
    private func setupPaymentCard() {
        paymentCardView.configure(
            with: .init(
                type: .incoming,
                name: "Aurora Digital Solutions",
                value: "R$ 100,00"
            )
        )
        
        transactionCardView.configure(
            with: .init(
                type: .transaction,
                name: "Duna Sports",
                value: "R$ 450,00"
            )
        )
    }
}
