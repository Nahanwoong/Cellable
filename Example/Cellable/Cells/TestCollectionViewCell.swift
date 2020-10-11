//
//  TestCollectionViewCell.swift
//  Cellable
//
//  Created by MacBook-Na on 2020/10/11.
//  Copyright (c) 2020 CocoaPods. All rights reserved.
//
//
import UIKit
import Cellable

class TestCollectionViewCell: UICollectionViewCell ,Cellable {
    
    static var bundle: Bundle = .main
    static var Identifier: String = "TestCollectionViewCell"
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 10
    }
}
