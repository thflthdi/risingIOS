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
    
    var menuTag: Int = 0    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var membershipUIV: UIView!
    @IBOutlet weak var kingorderUIV: UIView!
    @IBOutlet weak var deliveryUIV: UIView!
    @IBOutlet weak var barcodeButton: UIButton!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var bannerCtnView: UIView!
    
    @IBOutlet weak var mainScrollV: UIScrollView!
    @IBOutlet weak var itsNewScrollV: UIScrollView!
    
    //어떤 UIView를 클릭했는지 알기 위해 리스트로 가져옴
    @IBOutlet var newBurgerStackView: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "logo")
            navigationItem.titleView = UIImageView(image: image)
        let redColor = UIColor(red: 0.84, green: 0.14, blue: 0.02, alpha: 1)
        
        //app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var isFirstBoot = appDelegate.isFirstboot
        
        if isFirstBoot {
            print("iFist?\(isFirstBoot)")
            firstActiveAlert()
            appDelegate.isFirstboot = false
        }
        
        membershipUIV.layer.cornerRadius = 10
        kingorderUIV.layer.cornerRadius = 10
        deliveryUIV.layer.cornerRadius = 10
        
        barcodeButton.layer.cornerRadius = barcodeButton.frame.width / 2
        barcodeButton.tintColor = redColor
        barcodeButton.layer.masksToBounds = true
        
        bannerCtnView.layer.cornerRadius = 5
        bannerCtnView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerTimer()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = redColor
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket.fill"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = redColor
        self.navigationItem.rightBarButtonItem?.action
        
        self.mainScrollV.showsVerticalScrollIndicator = false
        self.itsNewScrollV.showsHorizontalScrollIndicator = false
        
        // UIView 탭 제스처 인식
        for view in newBurgerStackView{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
            view.addGestureRecognizer(tapGesture)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handelTapToOrder(sender:)))
        deliveryUIV.addGestureRecognizer(tapGesture)
        
        self.hidesBottomBarWhenPushed = true
        
    }
    
    @objc func handelTapToOrder(sender: UITapGestureRecognizer){
        let orderVC = self.storyboard?.instantiateViewController(withIdentifier: "orderVC") as! OrderViewController
        self.navigationController?.pushViewController(orderVC, animated: true)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.menuTag = sender.view!.tag - 1
        
        self.navigationController?.pushViewController(detailVC, animated: true)
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
    
    //첫 실행 시 alert
    func firstActiveAlert() {
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "popupVC") as! PopupViewController
        popupVC.modalPresentationStyle = .overFullScreen
        present(popupVC, animated: false)
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

