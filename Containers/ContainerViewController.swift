//
//  ContainerViewController.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/03.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    @IBOutlet weak var subContainerLeading: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subContainerLeading.constant = -150;
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu),
        name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @objc func toggleSideMenu() {
        print("ToggleSideMenu 메세지 수신")
        
        if subContainerLeading.constant == 0 {
            subContainerLeading.constant = -150
        } else if subContainerLeading.constant == -150 {
            subContainerLeading.constant = 0
        }
        
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
