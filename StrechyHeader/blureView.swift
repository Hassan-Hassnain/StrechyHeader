//
//  blureView.swift
//  StrechyHeader
//
//  Created by Usama Sadiq on 3/30/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class blureView: UIVisualEffectView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var animator: UIViewPropertyAnimator!
    func  setupVisualEffectBlur() {
        animator =  UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView1 = UIVisualEffectView(effect: blurEffect)
            self.addSubview(visualEffectView1)
            visualEffectView1.fillSuperview()
            
        })
    }
}
