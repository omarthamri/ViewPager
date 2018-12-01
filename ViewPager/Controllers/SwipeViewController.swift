//
//  SwipeViewController.swift
//  ViewPager
//
//  Created by MACBOOK PRO RETINA on 30/11/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class SwipeViewController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
    Page(imageName: "haha", headerText: "Life is 10% what happens to you and 90% how you react to it"),
    Page(imageName: "wow", headerText: "Life is 10% what happens to you and 90% how you react to it"),
    Page(imageName: "angry", headerText: "Life is 10% what happens to you and 90% how you react to it"),
    Page(imageName: "sad", headerText: "Life is 10% what happens to you and 90% how you react to it")
    ]
    
    let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREVIOUS PAGE", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(PreviousButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT PAGE", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(NextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let pagecontrol : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBottomControl()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    func settingBottomControl() {
        let BottomStackView = UIStackView(arrangedSubviews: [previousButton,pagecontrol,nextButton])
        BottomStackView.translatesAutoresizingMaskIntoConstraints = false
        BottomStackView.distribution = .fillEqually
        view.addSubview(BottomStackView)
        NSLayoutConstraint.activate([
            BottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            BottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            BottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            BottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func NextButtonTapped() {
        let nextIndexPath = min(pagecontrol.currentPage + 1,pages.count - 1)
        collectionView?.scrollToItem(at: IndexPath(item: nextIndexPath, section: 0) , at: .centeredHorizontally, animated: true)
        pagecontrol.currentPage = nextIndexPath
    }
    
    @objc func PreviousButtonTapped() {
        let nextIndexPath = max(pagecontrol.currentPage - 1,0)
        collectionView?.scrollToItem(at: IndexPath(item: nextIndexPath, section: 0) , at: .centeredHorizontally, animated: true)
        pagecontrol.currentPage = nextIndexPath
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        cell.page = pages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pagecontrol.currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
    }
    
    
}
