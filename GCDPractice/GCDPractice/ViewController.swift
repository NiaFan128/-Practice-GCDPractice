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
    var school: String = ""
    var address: String = ""
    var head: String = ""
    
    let dispatchGroup = DispatchGroup()

    func run(after seconds: Int, completion: @escaping () -> Void) {
        
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getGroupA()
        getGroupB()
        getGroupC()
        
        dispatchGroup.notify(queue: .main) {
            print("reloading data")
            self.tableView.reloadData()
        }
        
    }
    
    func getGroupA() {
        
        dispatchGroup.enter()
        
        api.getNameAPI { (data, error) in
            
            print(data!)
            
            self.run(after: 2, completion: {
            
                self.school = data!
                self.dispatchGroup.leave()
                
            })
            
        }
        
    }
        
    func getGroupB() {
        
        dispatchGroup.enter()
        
        api.getAddressAPI { (data, error) in
            
            print(data!)
            
            self.run(after: 4, completion: {
                self.address = data!
                self.dispatchGroup.leave()
            })
                
        }
            
    }
        
    func getGroupC() {
        
        dispatchGroup.enter()

        api.getHeadAPI { (data, error) in
            
            print(data!)
            
            self.run(after: 6, completion: {
                self.head = data!
                self.dispatchGroup.leave()
            })
                
        }
            
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
            
            cell.schoolLabel.text = school
            
            return cell

        } else if indexPath.row == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondCell else {
                return UITableViewCell()
            }
            
            cell.addressLabel.text = address
            
            return cell

        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdCell else {
                return UITableViewCell()
            }
            
            cell.nameLabel.text = head
            
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
