//
//  ViewController.swift
//  LaunchPadGame
//
//  Created by GOngTAE on 2021/12/19.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBAction func modeChanged(_ sender: UISegmentedControl) {
        if sender.
    }
    
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var HpGageView: UIProgressView!
    @IBOutlet weak var feverFireView: UIView!
    @IBOutlet weak var feverImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    
    @IBOutlet weak var currentSongView: UIView!
    @IBOutlet weak var albumImageView: UIImageView!
   
    
    let player = AudioPlayer.shared
    var readiedButton = Array(repeating: false, count: 16)
    var count = 0 {
        didSet {
            scoreLabel.text = "score: \(count)"
        }
    }
    var isFever = false
    
    
    
    
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.buttonCollectionView.delegate = self
        self.buttonCollectionView.dataSource = self
        
        buttonCollectionView.backgroundColor = .clear
        
        player.setCurrentItem(songName: "ily")
        
        
        albumImageView.layer.cornerRadius = albumImageView.frame.height / 2
        albumImageView.clipsToBounds = true
        
        currentSongView.layer.masksToBounds = true
        currentSongView.layer.cornerRadius = 10
        currentSongView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        
        logoImageView.layer.masksToBounds = true
        logoImageView.layer.cornerRadius = 10
        logoImageView.backgroundColor = UIColor(white: 1, alpha: 0.7)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        albumImageView.image = UIImage(named: player.currentItem?.name ?? "ily")
        
    }
    

   
    @IBAction func playButtonTapped(_ sender: UIButton) {
        
        player.playCurrentSong()
        
        let readyTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        DispatchQueue.main.async {
            
            //미완성 코드 [ ] 하트 콩닥거리는 애니메이션 작성중
            Timer.scheduledTimer(withTimeInterval: 1.12, repeats: true) { timer in
                
                self.heartImageView.transform = readyTransform
            }
        }
        
        DispatchQueue.main.async {
            self.albumImageView.transform = readyTransform
            
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.40), initialSpringVelocity: CGFloat(4.0), options: UIView.AnimationOptions.allowUserInteraction) {
                self.albumImageView.transform = CGAffineTransform.identity
            } completion: { Void in()
                
            }
            self.albumImageView.rotate()
        }
        
        
        //메인스레드 에서 작동
        DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
            Timer.scheduledTimer(withTimeInterval: 0.56, repeats: true) { timer in
                    //난수 발생
                    let randomIndex = Int.random(in: 0...15)
    
                    //난수에 해당하는 버튼 크기 증가
                    UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut]) {
                        self.buttonCollectionView.visibleCells[randomIndex].transform = readyTransform
                    } completion: { done in
                        if done {
                            
                            //크기 증가 완료 시에 준비된 버튼 인덱스 값을 true 로 만듦
                            self.readiedButton[mapIndex(before: randomIndex)] = true
                            print("button readied!! \(randomIndex)")
                        }
                    }
                }
            }
    }
                                      
    @IBAction func switchButtonTapped(_ sender: UIButton) {
        
        
    }
}








func mapIndex(before: Int) -> Int {
    switch before {
    case 15:
        return 0
    case 7:
        return 1
    case 0:
        return 2
    case 8:
        return 3
    case 1:
        return 4
    case 9:
        return 5
    case 2:
        return 6
    case 10:
        return 7
    case 3:
        return 8
    case 11:
        return 9
    case 4:
        return 10
    case 12:
        return 11
    case 5:
        return 12
    case 13:
        return 13
    case 6:
        return 14
    case 14:
        return 15
    default:
        return 0
    }
}



extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
