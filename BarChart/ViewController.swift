//
//  ViewController.swift
//  BarChart
//
//  Created by TOGNI Elie on 07/08/2018.
//  Copyright © 2018 TOGNI Elie. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let values: [CGFloat] = [200, 300, 400, 500, 600, 100, 50, 20, 10, 5, 610, 10, 15, 20, 780, 2000, 2100, 500]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(BarCell.self, forCellWithReuseIdentifier: cellId)
        
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
    }
    
    //Réduire l'espacement entre les graphiques
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return 5 //Affiche 5 cellules
        return values.count
    }
    
    let statusBarHeight: CGFloat = 20
    let navigationBarHeight: CGFloat = 44
    let paddingHeight: CGFloat = 8
    
    func maxHeight() -> CGFloat {
        return  view.frame.height - statusBarHeight - navigationBarHeight - paddingHeight
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BarCell
        
        //Arranger le graphique en fonction du max
        if let max = values.max() {
            let value = values[indexPath.item]
            let ratio = value / max
            
            cell.barHeighConstraint?.constant = maxHeight() * ratio
        }
        
        //cell.backgroundColor = .blue
        //cell.barHeighConstraint?.constant = CGFloat(values[indexPath.item])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: maxHeight())
    }
    
    
    //Permet d'ajouter un espace autour du graph
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
   
    


}

