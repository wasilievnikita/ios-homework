//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кристина on 29.04.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let animatingImage: UIImageView = {
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
        animatingImage.image = UIImage(named: model.image)
    }
    
    private func addViews(){
        contentView.addSubview(animatingImage)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            animatingImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            animatingImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            animatingImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            animatingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    //    private func animateImageToInitial(rect: CGRect) {
    //        UIView.animate(withDuration: 0.6) {
    //            self.animatingImage.frame = rect
    //            self.animatingImage.layer.cornerRadius = 0
    //        } completion: { _ in
    //            self.animatingImage.removeFromSuperview()
    //        }
    //    }
    //
    //    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
    //        animatingImage.image = image
    //        animatingImage.alpha = 1.0
    //        animatingImage.frame = CGRect(x: imageFrame.origin.x,
    //                                          y: imageFrame.origin.y,
    //                                          width: imageFrame.width,
    //                                          height: imageFrame.height)
    //
    //        UIView.animate(withDuration: 0.6) {
    //            self.animatingImage.frame.size = CGSize(width: UIScreen.main.bounds.width,
    //                                                        height: UIScreen.main.bounds.width)
    //            self.animatingImage.center = self.contentView.center
    //            self.animatingImage.layer.cornerRadius = UIScreen.main.bounds.width / 2
    //        }
    //    }
    //}
    }
