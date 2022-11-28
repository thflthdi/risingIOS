//
//  ViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/27.
//

import UIKit

class ViewController: UIViewController {
    
    var curruntPage: Int = 0
    let dataArray: Array<UIImage> = [UIImage(named: "banner1.png")!, UIImage(named: "banner2.png")!, UIImage(named: "banner3.png")!, UIImage(named: "banner4.png")!, UIImage(named: "banner5.png")!, UIImage(named: "banner6.png")!]
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var membershipUIV: UIView!
    @IBOutlet weak var kingorderUIV: UIView!
    @IBOutlet weak var deliveryUIV: UIView!
    
    @IBOutlet weak var barcodeButton: UIButton!
    @IBOutlet weak var bannerLabel: UILabel!
    
    @IBOutlet weak var bannerCtnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "logo")
            navigationItem.titleView = UIImageView(image: image)
        membershipUIV.layer.cornerRadius = 10
        kingorderUIV.layer.cornerRadius = 10
        deliveryUIV.layer.cornerRadius = 10
        barcodeButton.layer.cornerRadius = barcodeButton.frame.width / 2
        barcodeButton.tintColor = UIColor(red: 0.84, green: 0.14, blue: 0.02, alpha: 1)
        barcodeButton.layer.masksToBounds = true
        bannerCtnView.layer.cornerRadius = 5
        bannerCtnView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerTimer()
    }

    func bannerTimer() {
           let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
               self.bannerMove()
           }
       }
       // 배너 움직이는 매서드
       func bannerMove() {
           // 현재페이지가 마지막 페이지일 경우
           if curruntPage == dataArray.count-1 {
           // 맨 처음 페이지로 돌아감
               bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
               bannerLabel.text = "1"
               curruntPage = 0
               return
           }
           // 다음 페이지로 전환
           curruntPage += 1
           bannerCollectionView.scrollToItem(at: NSIndexPath(item: curruntPage, section: 0) as IndexPath, at: .right, animated: true)
           bannerLabel.text = "\(curruntPage+1)"
       }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width  , height:  bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        curruntPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

