//
//  PostViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 06.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    var post = Post(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        title = post.title
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let buttonAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = buttonAdd
    }
    
    @objc func add() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}
