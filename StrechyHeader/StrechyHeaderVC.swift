//
//  ViewController.swift
//  StrechyHeader
//
//  Created by Usama Sadiq on 3/30/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

private let collectionViewHeaderReuseIdentifier = "MyHeaderClass"
private let collectionCell = "MyCollectionCell"


class StrechyHeaderVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let padding:CGFloat = 16
    var headerView: MyHeaderClass?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setUpCollectionView() {
        collectionView.register(UINib(nibName: collectionViewHeaderReuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:collectionViewHeaderReuseIdentifier)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
    }
    
    fileprivate func setupLayout() {
        //layout customization of cells insets
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 0  {
            headerView?.animatior.fractionComplete = 0
            headerView?.animatior.stopAnimation(true)
            return
        }
       
            headerView?.animatior.fractionComplete = CGFloat(abs(contentOffsetY) / 200)
   
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderReuseIdentifier, for: indexPath) as? MyHeaderClass
        headerView?.setupBlueView()
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 340.0)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - (padding * 2), height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
