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
    
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        Task.init {
            do {
                //load the games in the array
                gameObjects = try await apiCaller.getTopGames(numOfGames: 5)
                
                // Specifies the number of views in our cell
                collectionView.dataSource = self
                collectionView.delegate = self
                
                //for adding space between cells
                let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
                layout.minimumLineSpacing = 4
                layout.minimumInteritemSpacing = 4
                
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
        return 5
    }


    //MARK: - Cell Creation
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameGollectionViewCell", for: indexPath) as! gameGollectionViewCell
        
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
                let comUrl = URL(string: protoUrl + (coverPath ?? "error"))
                cell.gameImageView.af.setImage(withURL: comUrl!)
            }
            catch {
                print("\(error)")
            }
        }

        
        //FIXME: Kyle coded this; we need to see what we can use it for. This references a function in the CollectionView cell file.
        //Games is something in the API
        //cell.setup(with: Game[indexPath.row])
        
        //let posterURL = //FIXME: Get the game poster.
        //cell.gameImageView.af.setImage(withURL: posterURL)
        
        return cell
    }


    //MARK: - Layout Function
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
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
//        
//        //Find the selected game.
//        let cell = sender as! UICollectionViewCell //the sender is the cell we clicked
//        let indexPath = collectionView.indexPath(for: cell)!
//        let game = games[indexPath.row] //now we have found the selected cell //FIXME: games might not be an array. Fix this accordingly.
//        
//        //Pass the selected game to the Game Details View Controller.
//        let gameDetailsViewController = segue.destination as! GameDetailsViewController //FIXME: Change this to the name of Kirk's file.
//        
//        //This unhighlights the cell after you view its details and return to this view.
//        collectionView.deselectRow(at: indexPath, animated: true)
        
    }
}
