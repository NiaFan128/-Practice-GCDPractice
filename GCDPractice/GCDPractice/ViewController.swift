//
//  ViewController.swift
//  GCDPractice
//
//  Created by 乃方 on 2018/8/31.
//  Copyright © 2018年 Nia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var api: API = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        api.getAddressAPI()
        api.getHeadAPI()
        api.getNameAPI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//
//        return 3
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell else {
                return UITableViewCell()
            }
            
            return cell

        } else if indexPath.row == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondCell else {
                return UITableViewCell()
            }
            
            return cell

        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdCell else {
                return UITableViewCell()
            }
            
            return cell
            
        }
        
    }
    

}

class FirstCell: UITableViewCell {
 
    @IBOutlet weak var schoolLabel: UILabel!
    
}

class SecondCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    
}

class ThirdCell: UITableViewCell {
   
    @IBOutlet weak var nameLabel: UILabel!
    
}
