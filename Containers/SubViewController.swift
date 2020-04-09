//
//  SubViewController.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/07.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

class SubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subTableView: UITableView!
    
    @IBOutlet weak var lblMenuTitle: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblIdentifire: UILabel!
    @IBOutlet weak var lblSignInCheck: UILabel!
    
    
    let regionData: Array = ["전국", "서울", "경기", "인천", "부산",
                             "대구", "대전", "광주", "세종", "울산",
                             "강원", "경남", "경북", "전남", "전북",
                             "충남", "충북", "제주"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subTableView.delegate = self
        subTableView.dataSource = self
        
        lblMenuTitle.text = "환영합니다"
        imgProfile.image = UIImage(named: "profile_placeholder")
        subTableView.separatorStyle = .none
        
        subTableView.cellLayoutMarginsFollowReadableWidth = false
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.regionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCell", for: indexPath) as! SubTableViewCell
        let region = self.regionData[indexPath.row]
        cell.lblRegionName.text = region

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return
//    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }

//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
    
}
