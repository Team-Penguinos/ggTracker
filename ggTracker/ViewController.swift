//
//  ViewController.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 10/15/22.
//

import UIKit

class ViewController: UIViewController {
    let apiCaller = IGDB_APICaller()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCaller.getTopGames()
        // Do any additional setup after loading the view.
    }
}

