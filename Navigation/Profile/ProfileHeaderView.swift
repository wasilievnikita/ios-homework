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
        photo.layer.cornerRadius = 75
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
        addSubview(signature)
        addSubview(name)
        addSubview(photo)
        addSubview(statusButton)
        addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        name.frame = CGRect(x: 200, y: 150, width: 200, height: 20)
        signature.frame = CGRect(x: 200, y: 230, width: 200, height: 20)
        statusButton.frame = CGRect(x: 16, y: 300, width: frame.width - 32, height: 50)
        photo.frame = CGRectMake(16, 120, 150, 150)
        textField.frame = CGRect(x: 200, y: 180, width: 150, height: 40)
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
}
