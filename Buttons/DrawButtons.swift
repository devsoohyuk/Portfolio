//
//  DrawButtons.swift
//  Portfolio
//
//  Created by soohyuk hong on 2020/04/02.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

enum ButtonSizeType {
    case big
    case midium
    case small
}

struct ButtonSizeRect {
    var x = 0
    var y = 0
    var width = 0
    var height = 0
    
    mutating func smallRect() -> ButtonSizeRect {
        return ButtonSizeRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
    }
}

class DrawButtons: UIButton {
    
    var isChecked: Bool = true
    var clearView = UIView()
    
    required init?(coder loginBtn: NSCoder) {
        super.init(coder: loginBtn)
        
        switch tag {
        case 1:
            setTitle("로그인", for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            setTitleColor(UIColor.black, for: .normal)
            backgroundColor = UIColor(red: 255/255,
                                      green: 190/255,
                                      blue: 46/255,
                                      alpha: 1.0)
            
            layer.cornerRadius = 25
            layer.borderColor = UIColor.gray.cgColor
            layer.borderWidth = 1
            
        case 2:
            setTitle("", for: .normal)
            
        default:break
            
        }

        
    }
    
    // 사이드 메뉴 버튼
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConfig()
    }
    
    func setConfig() {
        self.addTarget(self, action: #selector(menuBtn), for: .touchUpInside)
        self.setBackgroundImage(UIImage(named: "plus_button"), for: .normal)
        self.adjustsImageWhenHighlighted = false
    }
    
    init(type:ButtonSizeType) {
        switch type {
        case .big:
            super.init(frame: ButtonSizeRect(x: 0, y: 0, width: 100, height: 100))
        case .midium:
            super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        case .small:
            super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        }
        
        setConfig()
    }
    
    @objc func menuBtn() {
        print("정상 동작 확인")
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        DispatchQueue.main.async {
            
            let bounds = UIScreen.main.bounds
            let width = bounds.size.width
            let height = bounds.size.height
            
            self.clearView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            self.clearView.backgroundColor = UIColor.init(white: 1, alpha: 0.9)
            
            self.isChecked = !self.isChecked
            
            UIView.animate(withDuration: 0.25) {
                if self.isChecked {
                    self.transform = CGAffineTransform.identity
                    self.clearView.isHidden = true
                } else {
                    self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
                    self.clearView.isHidden = false
                }
                
                self.setBackgroundImage(UIImage(named: "plus_button"), for: .normal)
                self.adjustsImageWhenHighlighted = false
                
            }
        }
    }
}
