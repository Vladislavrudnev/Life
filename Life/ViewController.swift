///Users/vladislavrudnev/Desktop/Life/Life/SquareCollectionViewCell.swift
//  ViewController.swift
//  Life
//
//  Created by владислав Руднев on 24.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: [Cell]  = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }

    let pixelSize = 15
    var boardWidth: Int {
        return Int(floor(collectionView.frame.size.width/CGFloat(pixelSize)))
    }
    var boardHeight: Int {
        return Int(floor(collectionView.frame.size.height/CGFloat(pixelSize)))
    }

    var game: Game!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game = Game(width: boardWidth, height: boardHeight)
        game.addStateObserver { [weak self] state in
            self?.display(state)
        }
    }
    
    func display(_ state: GameState) {
        self.dataSource = state.cells
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    

    

    @IBAction func StartLife(_ sender: UIButton) {
        game.reset()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SquareCollectionViewCell.self)", for: indexPath) as! SquareCollectionViewCell
        cell.configureWithState(dataSource[indexPath.item].isAlive)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pixelSize, height: pixelSize)
    }

}

 //   @IBAction func StopLife(_ sender: UIButton) {
        
        
  //  }
    
  //  @IBAction func RondomLife(_ sender: UIButton) {
//    }


