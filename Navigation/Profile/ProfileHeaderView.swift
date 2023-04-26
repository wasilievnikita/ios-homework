//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Васильев on 12.04.2023.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private let signature: UILabel = {
        let signature = UILabel()
        signature.text = "Waiting for action..."
        signature.font = UIFont(name: "HelveticaNeue", size: 14)
        return signature
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.text = "Snoop Dogg"
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return name
    }()
    
    private let photo: UIImageView = {
        let photo = UIImageView()
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 65
        photo.image = UIImage(named: "snoopDogg")
        return photo
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.placeholder = "Введите статус..."
        return textField
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("Показать статус", for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowOffset.width = 4
        statusButton.layer.shadowOffset.height = 4
        statusButton.backgroundColor = .systemBlue
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    func addViews() {
        addSubview(signature)
        addSubview(name)
        addSubview(photo)
        addSubview(statusButton)
        addSubview(textField)

    }
    
    @objc func buttonPressed() {
        if textField.text == "" {
            print("Нет статуса")
        } else {
            print(statusText)
        }
    }
    
    @objc func statusTextChanged(_ textfield: UITextField) {
        if let titleStatus = textField.text {
            statusText = titleStatus
        }
    }
    
    private func layout() {
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        signature.translatesAutoresizingMaskIntoConstraints = false
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            photo.widthAnchor.constraint(equalToConstant: 130),
            photo.heightAnchor.constraint(equalToConstant: 130),
            
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            name.widthAnchor.constraint(equalToConstant: 120),
            
            statusButton.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            signature.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            signature.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
            signature.widthAnchor.constraint(equalToConstant: 150),
            
            textField.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            textField.widthAnchor.constraint(equalToConstant: 150),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -5),
            textField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
