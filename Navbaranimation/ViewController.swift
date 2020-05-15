//
//  ViewController.swift
//  Navbaranimation
//
//  Created by user169339 on 5/15/20.
//  Copyright © 2020 user169339. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var navigationBarConstraintHeight: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var stackView: UIStackView!
    
    private var isActive: Bool = false;
    var snacks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarConstraintHeight.constant = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return snacks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = String(snacks[indexPath.row])
        return cell
    }

    
    @IBAction func onClickImageButton(_ sender: UIButton) {
        switch sender.tag {
            case 1:
               snacks.append("Oreo")
            case 2:
                snacks.append("Pizza Pockets")
            case 3:
                snacks.append("Pop Tarts")
            case 4:
                snacks.append("Pop Sicle")
            case 5:
                snacks.append("Ramen")
            default:
                break
        }

        tableView.reloadData()
    }
    
    @IBAction func onClickPlusButton(_ sender: UIButton) {
        if isActive {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.navigationBarConstraintHeight.constant = 80
                self.plusButton.transform = .identity
                self.stackView.isHidden = true
                self.view.layoutIfNeeded()
            })
            isActive = false
            
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.navigationBarConstraintHeight.constant = 230
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)/4)
                self.stackView.isHidden = false
                self.view.layoutIfNeeded()
            })
            isActive = true;
        }
    }

}

