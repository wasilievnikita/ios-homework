//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Никита Васильев on 25.04.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private let contentWhiteView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let photo: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .black
            return imageView
        }()
        
        private let authorText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.numberOfLines = 2
            return label
        }()
        
        private let descriptionText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = UIColor.systemGray
            label.numberOfLines = 0
            return label
        }()
        
        private let likes: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        private let views: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            label.numberOfLines = 0
            return label
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          layout()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      override func prepareForReuse() {
          super.prepareForReuse()
          photo.image = nil
          authorText.text = nil
          descriptionText.text = nil
          likes.text = nil
          views.text = nil
      }
      
      func setupCell(model: Post) {
          photo.image = UIImage(named: model.photo)
          authorText.text = model.author
          descriptionText.text = model.description
          likes.text = "Likes: " + String( model.likes)
          views.text = "Views: " + String(model.views)
      }
    
    private func layout() {
                [contentWhiteView, photo, authorText, descriptionText, likes, views].forEach { contentView.addSubview($0)}
        
                let inset: CGFloat = 16
                let inset2: CGFloat = 12
                
                NSLayoutConstraint.activate([

                    contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    
                    authorText.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: inset),
                    authorText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
                    authorText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -inset),
                    authorText.heightAnchor.constraint(equalToConstant: 30),
                    
                    photo.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: inset2),
                    photo.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
                    photo.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
                    photo.heightAnchor.constraint(equalToConstant: 200),
                    
                    descriptionText.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: inset),
                    descriptionText.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
                    descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
                    descriptionText.heightAnchor.constraint(equalToConstant: 50),
                    
                    likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: -inset),
                    likes.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
                    likes.heightAnchor.constraint(equalToConstant: 50),
                    likes.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),
                    
                    views.topAnchor.constraint(equalTo: likes.topAnchor),
                    views.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -inset),
                    views.heightAnchor.constraint(equalToConstant: 50),
                    views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
                ])
            }
    
}
