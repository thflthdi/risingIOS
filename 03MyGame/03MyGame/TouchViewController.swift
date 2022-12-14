//
//  TouchViewController.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/12.
//

import UIKit

class TouchViewController: ViewController {

    
    var count = 0
    @IBOutlet weak var touchCountLabel: UILabel!
    @IBOutlet var touchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

        // 2. add the gesture recognizer to a view
        self.touchView.addGestureRecognizer(tapGesture)
    }

    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
        UserModel.count += 1
        self.touchCountLabel.text = String(UserModel.count)
    }
}
