//
//  BookPagerController.swift
//  iKindle
//
//  Created by Elias Myronidis on 25/08/2018.
//  Copyright © 2018 Elias Myronidis. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController {
    
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        navigationItem.title = book?.title
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        collectionView?.isPagingEnabled = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    @objc private func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - CollectionView methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = book?.pages[indexPath.item]
        pageCell.page = page
        return pageCell
    }
}

extension BookPagerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.height - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
}
