//
//  BookCell.swift
//  iKindle
//
//  Created by Elias Myronidis on 25/08/2018.
//  Copyright © 2018 Elias Myronidis. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var book: Book? {
        didSet {
            titleLabel.text = book?.title
            authorLabel.text = book?.author
            
            guard let coverImageUrl = book?.coverImageUrl else { return }
            guard let url = URL(string: coverImageUrl) else { return }
            
            coverImage.image = nil
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
    
                if let error = error {
                    print("Failed to fetch image: ", error.localizedDescription)
                    return
                }
                
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.coverImage.image = UIImage(data: imageData)
                }
                
            }.resume()
        }
    }
    
    let coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.text = "This is the text for the title of our book inside of our cell."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
//        label.text = "This is some author for the book that we have in this row."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(coverImage)
        coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        coverImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: coverImage.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        addSubview(authorLabel)
        authorLabel.leftAnchor.constraint(equalTo: coverImage.rightAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
