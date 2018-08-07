//
//  BarCell.swift
//  BarChart
//
//  Created by TOGNI Elie on 07/08/2018.
//  Copyright © 2018 TOGNI Elie. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var barHeighConstraint: NSLayoutConstraint?
    
    override var isHighlighted: Bool{
        didSet {
            barView.backgroundColor = isHighlighted ? .black : .red
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .yellow
        
        addSubview(barView)
        
       // barView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        barHeighConstraint = barView.heightAnchor.constraint(equalToConstant: 300)
            barHeighConstraint?.isActive = true
        barHeighConstraint?.constant = 100
        
        
        //barView.heightAnchor.constraint(equalToConstant:200).isActive=true
        
         barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
         barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
         barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
