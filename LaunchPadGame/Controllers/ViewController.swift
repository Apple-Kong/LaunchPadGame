//
//  ViewController.swift
//  LaunchPadGame
//
//  Created by GOngTAE on 2021/12/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var HpGageView: UIProgressView!
    let player = AudioPlayer.shared
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.buttonCollectionView.delegate = self
        self.buttonCollectionView.dataSource = self
        
        buttonCollectionView.backgroundColor = .clear
        
        player.setCurrentItem(songName: "ily")
        
        
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        player.playCurrentSong()
        
        
                
    }
    @IBAction func switchButtonTapped(_ sender: UIButton) {
        
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.30),
                                   initialSpringVelocity: CGFloat(3.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )

    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    //옆간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 10
        let size = CGSize(width: width, height: width)
        
        return size
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

func startNote() {
    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
        button.
    }
}
