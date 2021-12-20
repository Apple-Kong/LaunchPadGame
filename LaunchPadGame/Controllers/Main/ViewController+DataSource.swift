//
//  ViewController+DataSource.swift
//  LaunchPadGame
//
//  Created by GOngTAE on 2021/12/20.
//

import UIKit
import Lottie


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
        
        //준비된 버튼 터치시 점수 증가
        
        if player.player.isPlaying {
            if readiedButton[indexPath.row] {
                readiedButton[indexPath.row] = false
                
                if isFever {
                    count = count + 100
                } else {
                    count = count + 10
                }
                
                if HpGageView.progress == 1, !isFever {
                    // Fever Event!
                    
                    
                    let animationView = AnimationView(name: "fever")
                    
                    feverFireView.addSubview(animationView)
                    feverFireView.bringSubviewToFront(self.feverImageView)
                    animationView.frame = animationView.superview!.bounds
                    animationView.contentMode = .scaleToFill
                    
                    animationView.play()
                    animationView.loopMode = .loop
                    
                    isFever = true
                    feverImageView.isHidden = false
                }
                HpGageView.progress = HpGageView.progress + 0.2
            } else {
                count = count - 10
            }
        }
        

        
        //터치시 스프링 애니메이션
        if let cell = collectionView.cellForItem(at: indexPath) as? ButtonCollectionViewCell {
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: CGFloat(0.40), initialSpringVelocity: CGFloat(4.0), options: UIView.AnimationOptions.allowUserInteraction) {
                cell.transform = CGAffineTransform.identity
            } completion: { Void in()
                
            }

        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
 
    }
}
