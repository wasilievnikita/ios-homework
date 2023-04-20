//
//  ViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 06.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Аккаунт"
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        layout()
    }
    
    private lazy var newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("Включить уведомления", for: .normal)
        newButton.layer.cornerRadius = 4
        newButton.layer.shadowRadius = 4
        newButton.layer.shadowColor = UIColor.black.cgColor
        newButton.layer.shadowOpacity = 0.7
        newButton.layer.shadowOffset.width = 4
        newButton.layer.shadowOffset.height = 4
        newButton.backgroundColor = .systemCyan
        return newButton
    }()
    
    func layout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        newButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50)])
   
    }

    
}

