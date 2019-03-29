//
//  ViewController.swift
//  basicApp_BullsEye
//
//  Created by 김동규 on 26/03/2019.
//  Copyright © 2019 kdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func startButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Result", message: "The value of slidebar is", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        present(alert,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

