//
//  BlurEffectView.swift
//  StrechyHeader
//
//  Created by Usama Sadiq on 3/30/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class BlurEffectView: UIVisualEffectView {

   var animator: UIViewPropertyAnimator!
    func  setupVisualEffectBlur() {
        animator =  UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
        self            
        })
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
