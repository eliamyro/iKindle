//
//  PageCell.swift
//  iKindle
//
//  Created by Elias Myronidis on 26/08/2018.
//  Copyright © 2018 Elias Myronidis. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            textLabel.text = page?.text
        }
    }
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.text = "Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label Some text for our label"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
