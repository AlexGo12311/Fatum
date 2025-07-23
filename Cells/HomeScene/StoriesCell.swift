//
//  StoriesCell.swift
//  Fatum
//
//  Created by Alex Neumark on 08.07.2025.
//

import UIKit

class StoriesCell: UITableViewCell {
    static let identifier = "StoriesCell"
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset.right = 36
        layout.sectionInset.left = 36
        layout.minimumLineSpacing = 40
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
        contentView.addSubview(collection)
        collection.backgroundColor = AccentColors.bgColor
        collection.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func layoutSubviews() {
        collection.frame = contentView.bounds
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
    }
}

extension StoriesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as? StoryCell else { return UICollectionViewCell()}
        cell.imageView = UIImageView(image: UIImage(resource: .home))
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 60, height: 60)
//    }
    
    
}
