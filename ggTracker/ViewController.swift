//
//  ViewController.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 10/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //we will return the games image from the API object
        return games.count
    }
    
    
    //creating our cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameGollectionViewCell", for: indexPath) as! gameGollectionViewCell
        //Games is something in the API
        cell.setup(with: games[indexPath.row])
        return cell
    let apiCaller = IGDB_APICaller()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCaller.getTopGames()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
   // }
//}
