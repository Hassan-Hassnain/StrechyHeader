//
//  CollectionViewCell.swift
//  StrechyHeader
//
//  Created by Usama Sadiq on 3/30/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

import UIKit

class MyHeaderClass: UICollectionReusableView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    var animatior : UIViewPropertyAnimator!
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("init(frame:)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init(coder:)")
    }
   
    func setupBlueView() {
        animatior = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: {
            let blurEffect = UIBlurEffect(style: .regular)
            self.visualEffectView.effect = blurEffect
        })
    }
    
    
}
