//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Никита Васильев on 25.04.2023.
//

import UIKit

//protocol CustomCellDelegate: AnyObject {
//    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
//}

protocol PlusLike: AnyObject {
    func increase(model: inout[Post], indexPath: IndexPath)
    func degrease(model: inout[Post], indexPath: IndexPath)
}

final class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PlusLike?

    private var indexPathCell = IndexPath()
    
    func setIndexPath(indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    var liked = false
    
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
    
    private lazy var like: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private let heart: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image =  UIImage(systemName: "heart.fill")
        imageView.backgroundColor = .white
        imageView.backgroundColor = UIColor.white.withAlphaComponent(0)
        imageView.tintColor = UIColor.red
        imageView.isHidden = true
        return imageView
    }()
    
    @objc func tapFunction() {

        if liked  {
            liked = false
            heart.isHidden =  true
            like.textColor = .black
            delegate?.degrease(model: &posts, indexPath: indexPathCell)
            like.text = "Likes: " + String(posts[indexPathCell.row].likes)
        }

        else {
            like.textColor = .systemRed
            delegate?.increase(model: &posts, indexPath: indexPathCell)
            like.text = "Likes: " + String(posts[indexPathCell.row].likes)
            liked = true
            heart.isHidden = false
        }
    }
    
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
        like.text = nil
        views.text = nil
    }
    
    func setupCell(model: Post) {
        photo.image = UIImage(named: model.photo)
        authorText.text = model.author
        descriptionText.text = model.description
        like.text = "Likes: " + String(model.likes)
        views.text = "Views: " + String(model.views)
    }

    // MARK: - Making Autolayouts
    
    private func layout() {
        [contentWhiteView, photo, authorText, descriptionText, like, views, heart].forEach { contentView.addSubview($0)}
        contentView.addSubview(contentWhiteView)
        contentView.addSubview(photo)
        contentView.addSubview(authorText)
        contentView.addSubview(descriptionText)
        contentView.addSubview(like)
        contentView.addSubview(views)
        contentView.addSubview(heart)
        
        let inset: CGFloat = 16
        let inset2: CGFloat = 12
        let heighInset : CGFloat = 50
        
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
            descriptionText.heightAnchor.constraint(equalToConstant: heighInset),

            like.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: -inset),
            like.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
            like.heightAnchor.constraint(equalToConstant: heighInset),
            like.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset),

            heart.topAnchor.constraint(equalTo: like.topAnchor),
            heart.bottomAnchor.constraint(equalTo: like.bottomAnchor),
            heart.leadingAnchor.constraint(equalTo: like.trailingAnchor, constant: 5),

            views.topAnchor.constraint(equalTo: like.topAnchor),
            views.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -inset),
            views.heightAnchor.constraint(equalToConstant: heighInset),
            views.bottomAnchor.constraint(equalTo: like.bottomAnchor)
        ])
    }
    
}

