//
//  ViewController.swift
//  MyFavoritePlaceInTokyoMap
//
//  Created by 宏輝 on 01/05/2019.
//  Copyright © 2019 Hiroki Kondo. All rights reserved.
//

import UIKit
import Lottie

//アニメーションを表示されるには、Lottieをcocoapodでインストールする必要があります。

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //説明文を入れた配列
    var onboardStringArray = ["地図を表示します","東京でよく行くところです"]

    
    var animationArray = ["live-map","location"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        
        setUpScroll()
        
        for i in 0...1 {
        
            let animationView = AnimationView()
            let animation = Animation.named(animationArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
            
        }
        
        
    }
    
    func setUpScroll() {
        
        //スクロールビューを貼り付ける
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 2, height: view.frame.size.height)
        
        
        for i in 0...1 {
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
        }
    }

    
    
    

    
    @IBAction func goToNextPage(_ sender: Any) {
        performSegue(withIdentifier: "goToNext", sender: nil)
    }
    
}

