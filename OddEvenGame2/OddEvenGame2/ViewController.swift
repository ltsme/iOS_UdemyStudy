//
//  ViewController.swift
//  OddEvenGame2
//
//  Created by HyeonJoonYang on 2023/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userBallCountLbl: UILabel!
    @IBOutlet var computerBallCountLbl: UILabel!
    
    var comBallCount : Int = 20
    var userBallCount : Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userBallCountLbl.text = String(userBallCount)
        computerBallCountLbl.text = String(comBallCount)
    }


    @IBAction func gameStart(_ sender: Any) {
        print("게임 시작")
    }
}

