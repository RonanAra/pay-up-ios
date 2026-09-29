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
        view.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 24, right: 24)
        view.disableAutoresizingMaskTranslation()
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(
            arrangedSubviews: [
                logoImage, spacer, bellButton, profileImage
            ]
        )
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.setCustomSpacing(24, after: bellButton)
        stackView.disableAutoresizingMaskTranslation()
        return stackView
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 82),
        ])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bell"), for: .normal)
        button.tintColor = Colors.textHeading
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 24),
            button.widthAnchor.constraint(equalToConstant: 24),
        ])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 44),
            imageView.widthAnchor.constraint(equalToConstant: 44),
        ])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let daySelectorView: DaySelectorView = {
        let daySelectorView = DaySelectorView()
        daySelectorView.translatesAutoresizingMaskIntoConstraints = false
        daySelectorView.heightAnchor.constraint(equalToConstant: 32).isActive = true
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
    
    private lazy var todayStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            todayLabel, paymentCardView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.disableAutoresizingMaskTranslation()
        return stackView
    }()
    
    private let addClientButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar cliente", for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    private let paymentCardView: PaymentCardView = {
        let cardView = PaymentCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        return cardView
    }()
    
    private var companyListView: CompanyListView = {
        let view = CompanyListView(companies: [
            CompanyItemModel(name: "Aurora Tech Soluçoes Digitais"),
            CompanyItemModel(name: "Valtrix Labs"),
            CompanyItemModel(name: "Rocketseat"),
        ])
        view.heightAnchor.constraint(equalToConstant: 141).isActive = true
        view.disableAutoresizingMaskTranslation()
        return view
    }()
    
    private lazy var companySectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIView(), viewAllButton
        ])
        stackView.axis = .horizontal
        stackView.disableAutoresizingMaskTranslation()
        return stackView
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
        cardView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        return cardView
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ver Todos", for: .normal)
        button.titleLabel?.font = Fonts.titleSmall()
        button.setTitleColor(Colors.accentBrand, for: .normal)
        button.disableAutoresizingMaskTranslation()
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Filtrar", for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.setTitleColor(Colors.textHeading, for: .normal)
        button.setImage(UIImage(systemName: "line.horizontal.3.decrease.circle"), for: .normal)
        button.tintColor = Colors.textHeading
        button.backgroundColor = Colors.backgroundSecondary
        button.layer.cornerRadius = 6
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    private lazy var transactionHeaderStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            transactionLabel, UIView(), filterButton
        ])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.disableAutoresizingMaskTranslation()
        return stackView
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                headerStackView,
                daySelectorView,
                todayStackView,
                addClientButton,
                companySectionStackView,
                companyListView,
                transactionHeaderStack,
                transactionDateLabel,
                transactionCardView
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.disableAutoresizingMaskTranslation()
        return stackView
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
        contentView.addSubview(mainStack)
        
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
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            mainStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
        ])
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
