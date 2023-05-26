//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Никита Васильев on 28.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
   
    private var initialImageRect: CGRect = .zero
    
    var galleryImages = GalleryImages.maketGallery()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        
        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        addViews()
        layout()
      title = "Photo Gallery"
        
    }
    
    func addViews() {
        view.addSubview(collectionView)
    }
    
    //MARK: - Making Autolayouts
    
    func layout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - extensions

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: galleryImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
  
    private var inset: CGFloat { return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}


//extension PhotosViewController: CustomCellDelegate {
//    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
//        let rectCell = collectionView(PhotosViewController, cellForItemAt: indexPath)
//
//        let rectInSuperView = collectionView.
//        initialImageRect = CGRect(x: frameImage.origin.x,
//                                  y: frameImage.origin.y + rectInSuperView.origin.y,
//                                  width: frameImage.width,
//                                  height: frameImage.height)
//
//        animateImage(image, imageFrame: initialImageRect)
//    }
//}
