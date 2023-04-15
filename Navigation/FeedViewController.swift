//
//  ListViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 06.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: 125, y: 100, width: 150, height: 30)
        button.setTitle("Показать пост", for: .normal)
        button.backgroundColor = .white
        view.addSubview(button)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)        
    }
    
    @objc func showPost() {
        let post = Post(title: "Пост")
        let postViewController = PostViewController()
        postViewController.title = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
