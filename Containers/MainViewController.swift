//
//  MainViewController.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/06.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var infinityContainerView: UIView!
    @IBOutlet weak var actionsheetContainerView: UIView!
    
//    let drawButton: DrawButtons = DrawButtons(type: .small)
    let drawButton: DrawButtons = DrawButtons(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self ContainerView 관리
        infinityContainerView.layer.addBorder([.top, .bottom], color: UIColor.lightGray, width: 1.0)
        actionsheetContainerView.layer.addBorder([.bottom], color: UIColor.lightGray, width: 1.0)
        
        // viewDidLoad 클리어 뷰 숨기기 on
        drawButton.clearView.isHidden = true
        
        // 제스쳐로
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clearViewTap))
        drawButton.clearView.addGestureRecognizer(gesture)
        
        // 클리어 뷰를 바깥쪽 2번째에 붙이기
        self.view.addSubview(drawButton.clearView)
        self.view.bringSubviewToFront(drawButton.clearView)
        
        // frame으로 생성한 버튼을 가장 바깥쪽에 붙이기
        self.view.addSubview(drawButton)
        self.view.bringSubviewToFront(drawButton)
        
    }
    
    @objc func clearViewTap() {
        print("ClearView Gesture로 동작!")
        drawButton.menuBtn()
    }
    
}

