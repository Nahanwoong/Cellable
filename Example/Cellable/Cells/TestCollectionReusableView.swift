//
//  TestCollectionReusableView.swift
//  Cellable
//
//  Created by MacBook-Na on 2020/10/11.
//  Copyright (c) 2020 CocoaPods. All rights reserved.
//
//
import UIKit
import Cellable

class TestCollectionReusableView: UICollectionReusableView, Cellable {
    
    static var bundle: Bundle = .main
    static var Identifier: String = "TestCollectionReusableView"
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
