//
//  ViewController.swift
//  OddEvenGame2
//
//  Created by HyeonJoonYang on 2023/05/23.
//

/*
 1. 컴퓨터가 임의의 1~10 까지의 숫자를 선택
 2. 사용자는 가진 구슬 개수를 걸고 홀짝 중에 하나를 선택
 3. 결과값이 화면에 보여짐
 */


import UIKit

class ViewController: UIViewController {

    @IBOutlet var comBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!
    @IBOutlet var resultLabel: UILabel!
    var comBallCount : Int = 20
    var userBallCount : Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userBallCountLbl.text = "user \(userBallCount) 남았습니다."
        comBallCountLbl.text = "com \(comBallCount) 남았습니다."
    }


    @IBAction func gameStart(_ sender: Any) {
        
        // 게임 시작시 나올 화면 알림, 버튼
        let alert = UIAlertController(title: "GAME START", message: "홀 or 짝을 선택해 주세요", preferredStyle: .alert)
        let oddBtn = UIAlertAction(title: "홀", style: .default){ _ in

            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            

            guard let value = Int(input) else {
                return
            }
            
            self.getWinner(count: value, select: "홀")
            self
        }
        let evenBtn = UIAlertAction(title: "짝", style: .default){ _ in
       
            guard let input = alert.textFields?.first?.text else {
                return
            }

            guard let value = Int(input) else {
                return
            }
            self.getWinner(count: value, select: "짝")
            
        }
        // UIAlertController에 UIAlertAction (버튼)을 추가
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        // UIAlertController에 textfield 추가
        alert.addTextField { textfield in
            textfield.placeholder = "배팅할 구슬의 갯수를 입력해 주세요"
        }
        
        // UIAlertController를 화면(ViewController)에 추가
        self.present(alert, animated: true)
    }
    func getWinner(count : Int, select : String){
        let comNum = self.getRandom()
        let conNumType = comNum % 2 == 0 ? "짝" : "홀"

        var result : String
     
        if(conNumType == select){
            result =  "승리!"
            self.calculate(winner: "user", count: count)
        }else{
            result =  "패배!"
            self.calculate(winner: "com", count: count)
        }
        resultLabel.text = result
    }
    
    func calculate(winner : String, count : Int){
        if (winner == "com"){
            self.comBallCount = self.comBallCount + count
            self.userBallCount = self.userBallCount - count
        } else if(winner == "user"){
            self.comBallCount = self.comBallCount - count
            self.userBallCount = self.userBallCount + count
        }else{}
        self.userBallCountLbl.text = "user \(self.userBallCount) 남았습니다."
        self.comBallCountLbl.text = "com \(self.comBallCount) 남았습니다."
    }
    
    func getRandom()-> Int{
        return Int(arc4random_uniform(10)+1) // 0~9까지 난수 +1
    }
}

