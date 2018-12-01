//
//  PageCell.swift
//  ViewPager
//
//  Created by MACBOOK PRO RETINA on 30/11/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    var page: Page?  {
        didSet {
            MyImgView.image = UIImage(named: (page?.imageName)!)
            let attributedtext = NSMutableAttributedString(string: (page?.headerText)!, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
            descriptionTextView.attributedText = attributedtext
            descriptionTextView.textAlignment = .center
        }
    }
    
   private let MyImgView : UIImageView = {
        let Img = UIImageView(image: #imageLiteral(resourceName: "haha"))
        Img.translatesAutoresizingMaskIntoConstraints = false
        Img.contentMode = .scaleAspectFit
        return Img
    }()
    
    private let descriptionTextView : UITextView = {
        let textview = UITextView()
        let attributedtext = NSMutableAttributedString(string: "Join us today and live the life you always dream to have", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedtext.append(NSMutableAttributedString(string: "\n\n\nTogether we will achieve a lot of nice things and one day we will be considered as successful people because we worked harder than any one else in this earth :)", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textview.attributedText = attributedtext
        textview.textAlignment = .center
        textview.isEditable = false
        textview.isScrollEnabled = false
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        let topViewContainer = UIView()
        addSubview(topViewContainer)
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        topViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topViewContainer.addSubview(MyImgView)
        MyImgView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
        MyImgView.centerYAnchor.constraint(equalTo: topViewContainer.centerYAnchor).isActive = true
        MyImgView.heightAnchor.constraint(equalTo: topViewContainer.heightAnchor, multiplier: 0.6)
        addSubview(descriptionTextView)
          descriptionTextView.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor,constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
