//
//  SettingViewController.swift
//  OddEvenGame2
//
//  Created by HyeonJoonYang on 2023/06/03.
//

import UIKit

protocol SettingDelegate {
    func getBallCount(BallsCnt : Int)
}

class SettingViewController: UIViewController {

    @IBOutlet var ballsCntTF: UITextField!
    var settingDelegate : SettingDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func setBtnClicked(_ sender: UIButton) {
        
        // textfield 형식은 guard let 문을 통해 nil 체크
        guard let balls = self.ballsCntTF.text, let ballsInt = Int(balls)  else {
            self.settingDelegate?.getBallCount(BallsCnt: 10)
            self.dismiss(animated: true, completion: nil)
            return
        }
    
        self.settingDelegate?.getBallCount(BallsCnt: ballsInt)
        
        self.dismiss(animated: true, completion: nil)
    }
}
