//
//  AppDelegate.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var menuCtnArray: [Int] = [0, 0, 0, 0, 0]
    var menuArray: Array<burgerInfo> = [
        burgerInfo(index:1, name:"비프불고기버거", price: 4800, description: "달콤판 불고기소스와 100% 순쇠고기 패티의 감칠맛나는 조화, 비프불고기버거!", isChecked: true, imageAdd: UIImage(named: "bulgogi")!, category: ""),
        burgerInfo(index:2, name:"골든치즈렐라 X", price: 11500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "x")!, category: ""),
        burgerInfo(index:3, name:"골든치즈렐라와퍼", price: 10500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "whopper")!, category: ""),
        burgerInfo(index:4, name:"골든치즈렐라치킨버거", price: 9500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "chicken")!, category: "")
    ]
    
    var isFirstboot: Bool = false

    //앱이 처음 시작될 때 실행
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        isFirstboot = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
    }

}

