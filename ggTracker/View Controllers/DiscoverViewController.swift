//
//  ViewController.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 10/15/22.
//

import UIKit
import IGDB_SWIFT_API
import AlamofireImage

class DiscoverViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
    

    //MARK: - Global Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    //instance variable
    var gameObjects = [Game]()
    
    //global variable
    var apiCaller = IGDB_APICaller()
    
    var numOfGames = 20
    
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task.init {
            do {
                //load the games in the array
                gameObjects = try await apiCaller.getTopGames(numOfGames)
                
                // Specifies the number of views in our cell
                collectionView.dataSource = self
                collectionView.delegate = self
                
                //for adding space/formatting between cells
                let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
                //layout.minimumLineSpacing = 2
                //layout.minimumInteritemSpacing = 2
                let width = view.frame.size.width //changes depending on what phone the user is using
                layout.itemSize = CGSize(width: 90, height: 120)
                
                
                //TODO: Get data.
                self.collectionView.reloadData()
            }
            catch {
                print("\(error)")
            }
        }
    }

    
    //MARK: - Cells Count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       //load the first 50 top games from the API
        //FIXME: Might change this to topgames.count.
        //we already know that return 5 works
        return numOfGames
    }


    //MARK: - Cell Creation
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameGollectionViewCell", for: indexPath) as! gameGollectionViewCell
        
        //make cell have rounded corners
        cell.layer.cornerRadius = 8
        
        //get the indivdual game
        let gameInCell = gameObjects[indexPath.row]
        
        Task.init {
            do {
                //get the cover for the individual game
                let cover = try await apiCaller.GetCover(gameInCell.id)
                print("\(cover)")
                //set the image view using alamo fire image
                let protoUrl = "https:"
                let coverPath = cover.url
                let comUrl = URL(string: protoUrl + coverPath)
                cell.gameImageView.layer.cornerRadius = 8
                cell.gameImageView.af.setImage(withURL: comUrl!)
            }
            catch {
                print("\(error)")
            }
        }
        
        return cell
    }
        
    //MARK: - On Setting Button
//    @IBAction func onSettingButton(_ sender: Any) {
//        //TODO: Make this send the user to the about screen.
//        self.performSegue(withIdentifier: "settingsSegue", sender: nil)
//        print("Settings button has been tapped")
//    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("Loading up the Discover Details Screen.")
        
        //find the selected game
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let game = gameObjects[indexPath.row]
        //Pass selected game to details screen
        let detailsViewControl = segue.destination as! DetailsViewController
        detailsViewControl.setGame(game)
        //deselect the row
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
