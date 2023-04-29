//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кристина on 29.04.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: GalleryImages) {
        image.image = UIImage(named: model.image)
    }
    
    private func addViews(){
        contentView.addSubview(image)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
