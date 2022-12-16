//
//  TouchViewController.swift
//  03Game
//
//  Created by 황예진 on 2022/12/16.
//

import UIKit

class TouchViewController: UIViewController {

    @IBOutlet weak var touchCountlabel: UILabel!
    @IBOutlet var touchView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainPresentImage: UIImageView!
    
    @IBOutlet weak var backgoroundImage: UIImageView!
    @IBOutlet weak var cycleManImage: UIImageView!
    @IBOutlet weak var greenImage: UIImageView!
    @IBOutlet weak var countBackgroundView: UIView!
    
    @IBOutlet weak var disCountlabel: UILabel!
    var cycleManIsTrue = false
    var animationImageList = RobotModel().mainChaAniImages
    let robotInfo = RobotModel().RobotInfoList
    var presentX: Double = 0
    var presentY: Double = 0
    var robotAnimeIsTrue = [false, false, false, false, false]
    var discount: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.touchCountlabel.layer.cornerRadius = 8
        self.touchCountlabel.clipsToBounds = true
        self.touchCountlabel.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMaxXMinYCorner)

        
        self.countBackgroundView.clipsToBounds = true
        self.countBackgroundView.layer.cornerRadius = 8
        self.countBackgroundView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner)

        self.disCountlabel.clipsToBounds = true
        self.disCountlabel.layer.cornerRadius = 8
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkCount), name: Notification.Name("userCount"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notiTab), name: Notification.Name("tab"), object: nil)
        
        presentX = self.mainImage.frame.origin.x
        presentY = self.mainImage.bounds.origin.y
        
        // 1. create a gesture recognizer (tap gesture)
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
       // 2. add the gesture recognizer to a view
       self.touchView.addGestureRecognizer(tapGesture)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Count"), object: nil )
            self.checkCount()
        }
        
        // discount Count
        DispatchQueue.global().async {
            let runloop = RunLoop.current
            var count = UserModel.count
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.discount == 0 {
                    print(count, UserModel.count)
                    if UserModel.count > 0 && count == UserModel.count {
                        UserModel.count -= 1
                    }
                    self.discount = 10
                    count = UserModel.count
                }else {
                    self.discount -= 1
                }
            }
            runloop.run()
        }
    }
    
    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
        UserModel.count += UserModel.userTapPlusGift
        self.touchCountlabel.text = String(UserModel.count) + "   "
        self.startAnimating()
    }
        
    @objc func checkCount(){
        self.touchCountlabel.text = String(UserModel.count) + "   "
        self.disCountlabel.text = String(self.discount)
    }
    
    @objc func notiTab(_ noti: Notification){
        let at = noti.object as! Int
        
        if UserModel.characterLevel[at] > 0 && at != 0 && !robotAnimeIsTrue[at]{
            robotAnimeIsTrue[at] = true
            
            self.startTimer(at)
            
            
        }
    }
    
    // main
    func startAnimating(){
        
//        self.mainPresentImage.transform = CGAffineTransform(translationX: presentX, y: presentY)
        mainImage.animationImages = animationImageList
        mainImage.animationDuration = 0.5
        mainImage.animationRepeatCount = 1
        mainImage.image = mainImage.animationImages?.first
        
        mainImage.startAnimating()
//        UIImageView.animate(withDuration: 0.8, animations: {
//            self.mainPresentImage.transform = CGAffineTransform(translationX: -200, y: 0)
//        })
    }
    
    func startTimer(_ at: Int){
        if robotAnimeIsTrue[at] {
            
            switch at {
            case 1:
                self.cycleAimationStart()
                Timer.scheduledTimer(withTimeInterval: self.robotInfo[at].interval, repeats: true) { timer in
                    self.cycleAimationStart()
                    UserModel.count += UserModel.characterAutoIncrease[at]
                    self.checkCount()
                }
            case 2:
                self.greenAimationStart()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 10){
//                    self.greenAimationStart()
//                }
                Timer.scheduledTimer(withTimeInterval: robotInfo[at].interval, repeats: true) { timer in
                    self.greenAimationStart()
                    UserModel.count += UserModel.characterAutoIncrease[at]
                    self.checkCount()
                }
            case 3:
                Timer.scheduledTimer(withTimeInterval: robotInfo[at].interval, repeats: true) { timer in
                    self.blueAimationStart()
                    UserModel.count += UserModel.characterAutoIncrease[at]
                    self.checkCount()
                }
            case 4:
                Timer.scheduledTimer(withTimeInterval: robotInfo[at].interval, repeats: true) { timer in
                    self.yellowAimationStart()
                    UserModel.count += UserModel.characterAutoIncrease[at]
                    self.checkCount()
                }
            default :
                print("error")
            }
            
        }
    }
    
    func cycleAimationStart(){
//        while true {
//            print(#function)
            
                self.cycleManImage.transform = CGAffineTransform(translationX: -100, y: 0)
            
                self.cycleManImage.animationImages = RobotModel().cycleManImages
                self.cycleManImage.animationDuration = 2
                self.cycleManImage.animationRepeatCount = 0
                self.cycleManImage.startAnimating()

                UIImageView.animate(withDuration: 5, animations: {
                    self.cycleManImage.transform = CGAffineTransform(translationX: 400, y: 0)
                })

//        }
                }
    
    func greenAimationStart(){
        self.greenImage.transform = CGAffineTransform(translationX: -100, y: 0)

        UIImageView.animate(withDuration: 12, animations: {
            self.greenImage.animationImages = RobotModel().greenImages
            self.greenImage.animationDuration = 2
            self.greenImage.animationRepeatCount = 0
            self.greenImage.startAnimating()

            self.greenImage.transform = CGAffineTransform(translationX: 400, y: 0)
        })
    }

    func blueAimationStart(){
//        self.cycleManImage.transform = CGAffineTransform(translationX: -100, y: 0)
//
//        UIImageView.animate(withDuration: 17, animations: {
//            self.cycleManImage.animationImages = RobotModel().cycleManImages
//            self.cycleManImage.animationDuration = 2
//            self.cycleManImage.animationRepeatCount = 0
//            self.cycleManImage.startAnimating()
//
//            self.cycleManImage.transform = CGAffineTransform(translationX: 400, y: 0)
//        })
    }

    func yellowAimationStart(){
//        self.cycleManImage.transform = CGAffineTransform(translationX: -100, y: 0)
//
//        UIImageView.animate(withDuration: 6, animations: {
//            self.cycleManImage.animationImages = RobotModel().cycleManImages
//            self.cycleManImage.animationDuration = 2
//            self.cycleManImage.animationRepeatCount = 0
//            self.cycleManImage.startAnimating()
//
//            self.cycleManImage.transform = CGAffineTransform(translationX: 400, y: 0)
//        })
    }

}
