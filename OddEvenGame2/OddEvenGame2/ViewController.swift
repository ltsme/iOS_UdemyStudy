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
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var comBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var imageUiView: UIView!
    @IBOutlet var firstImage: UIImageView!
    
    var player: AVAudioPlayer?
    var comBallCount : Int = 20
    var userBallCount : Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userBallCountLbl.text = "user \(userBallCount) 남았습니다."
        comBallCountLbl.text = "com \(comBallCount) 남았습니다."
        self.imageUiView.isHidden = true
        
        self.play(fileName: "intro")
    }
    
    func play(fileName : String) {
        let filePath = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        
        // filePath = URL? optional URL? 형태이므로 guard문을 통해 filePath가 nil일 경우 return
        guard let path = filePath else {
            return
        }
        
        // 경로에 파일이 있을지 여부에 대한 try catch 예외처리
        //self.player = try? AVAudioPlayer(contentsOf: filePath) // 결과 값이 없을 경우 nil을 반환
        
        // 경로에 파일이 있을지 여부에 대한 do catch
        do {
            self.player = try AVAudioPlayer(contentsOf: path)
            
            guard let soundPlayer = self.player else {
                return
            }
            
            soundPlayer.prepareToPlay()
            soundPlayer.play()
            
        }catch let error{
            print("error : \(error.localizedDescription)")
        }
    }

    @IBAction func gameStart(_ sender: Any) {
        self.play(fileName: "gamestart")
        self.imageUiView.isHidden = false
        UIView.animate(withDuration: 2.0){
            self.firstImage.transform = CGAffineTransform(scaleX: 5, y: 5  )
            self.firstImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        }completion: { _ in
            self.imageUiView.isHidden = true
            self.showAlert()
        }
        
    }
    
    func checkAccountEmpty(ball:Int) -> Bool {
        return ball == 0
    }
    
    func showAlert(){
        // 게임 시작시 나올 화면 알림, 버튼
        let alert = UIAlertController(title: "GAME START", message: "홀 or 짝을 선택해 주세요", preferredStyle: .alert)
        let oddBtn = UIAlertAction(title: "홀", style: .default){ _ in
            self.play(fileName: "click")

            guard let input = alert.textFields?.first?.text else {
                return
            }

            guard let value = Int(input) else {
                return
            }
            
            self.getWinner(count: value, select: "홀")
            
        }
        let evenBtn = UIAlertAction(title: "짝", style: .default){ _ in
            self.play(fileName: "click")
       
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
            result =  " User 승리!"
            self.resultLabel.text = result
            self.calculate(winner: "user", count: count)
            
        }else{
            result =  "User 패배!"
            self.resultLabel.text = result
            self.calculate(winner: "com", count: count)
        }
        
    }
    
    func calculate(winner : String, count : Int){
        if (winner == "com"){
            self.comBallCount = self.comBallCount + count
            self.userBallCount = self.userBallCount - count
            if self.checkAccountEmpty(ball: self.userBallCount){
                self.resultLabel.text = "컴퓨터의 최종 승리"
            }
        } else if(winner == "user"){
            self.comBallCount = self.comBallCount - count
            self.userBallCount = self.userBallCount + count
            if self.checkAccountEmpty(ball: self.comBallCount){
                self.resultLabel.text = "사용자의 최종 승리"
            }
        }
        self.userBallCountLbl.text = "user \(self.userBallCount) 남았습니다."
        self.comBallCountLbl.text = "com \(self.comBallCount) 남았습니다."
    }
    
    func getRandom()-> Int{
        return Int(arc4random_uniform(10)+1) // 0~9까지 난수 +1
    }
}

