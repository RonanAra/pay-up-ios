//
//  ClientFormView.swift
//  PayUp
//
//  Created by Ronan Fernandes on 30/09/26.
//

import UIKit

final class ClientFormView: UIView {
    private let mode: ClientFormMode
    weak var delegate: ClientFormViewDelegate?
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundPrimary
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.disableAutoresizingMaskTranslation()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = mode == .add ? "Adicionar cliente" : "Editar cliente"
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let recurringLabel: UILabel = {
        let label = UILabel()
        label.text = "Cobrança recorrente?"
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let recurringSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.onTintColor = Colors.accentBrand
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }()
    
    private let frequencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mensalmente", for: .normal)
        button.setTitleColor(Colors.textLabel, for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let frequencyOptions = [
        "Mensalmente",
        "Semanalmente",
        "Anualmente"
    ]
    
    private var selectedFrequency = "Mensalmente"
    
    private lazy var clientNameField = InputTextFieldView(title: "Nome do cliente", placeHolder: "Ex: Joao Silva", type: .normal)
    private lazy var contactField = InputTextFieldView(title: "Contato", placeHolder: "Ex: joao.silva@exemplo.com", type: .normal)
    private lazy var phoneField = InputTextFieldView(title: "Telefone", placeHolder: "Ex: (31) 91234-5678", type: .cellphone)
    private lazy var cnpjField = InputTextFieldView(title: "CNPJ", placeHolder: "Ex: 12.345.678/0001-90", type: .cnpj)
    private lazy var addressField = InputTextFieldView(title: "Endereço", placeHolder: "Ex: Rua das Flores, 123, Centro", type: .normal)
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(Colors.textLabel, for: .normal)
        button.titleLabel?.font = Fonts.titleSmall()
        button.backgroundColor = Colors.backgroundTertiary
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(mode == .add ? "Salvar" : "Salvar alterações", for: .normal)
        button.setTitleColor(Colors.textLabel, for: .normal)
        button.titleLabel?.font = Fonts.titleSmall()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = Colors.accentRed
        button.backgroundColor = Colors.backgroundTertiary
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(mode: ClientFormMode) {
        self.mode = mode
        super.init(frame: .zero)
        backgroundColor = Colors.backgroundPrimary
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9)
        ])
        setupStack()
    }
    
    private func setupStack() {
        let formStack = UIStackView(arrangedSubviews: [
            titleLabel
        ])
        
        formStack.axis = .vertical
        formStack.spacing = 16
        formStack.isLayoutMarginsRelativeArrangement = true
        formStack.layoutMargins = UIEdgeInsets(top: 12, left: 24, bottom: 24, right: 24)
        formStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(formStack)
        NSLayoutConstraint.activate([
            formStack.topAnchor.constraint(equalTo: containerView.topAnchor),
            formStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            formStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            formStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
