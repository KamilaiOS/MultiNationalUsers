//
//  ViewController.swift
//  ContentHuggingAndCompressionLab
//
//  Created by Akib Quraishi on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }

    func setupView() {
        
        let nameLabel = makeLabel(withText: "Name")
        let textField = makeTextField(withPlaceholderText: "Enter name here!")
        let imageView = makeImageView(named: "rush")
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(textField)
        
        
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 300).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
       
        
//        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
////        nameLabel.setContentHuggingPriority(.required, for: .horizontal)
////        nameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
//        //nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
//
//        textField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8).isActive = true
//        textField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
//        textField.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor).isActive = true
//        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
//
//        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
//
//        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
        
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeTextField(withPlaceholderText text: String ) -> UITextField {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = text
        textfield.backgroundColor = .gray
        
        return textfield
        
    }
    
    func makeImageView(named: String) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: named)
        image.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        image.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        
        return image
        
    }
    

}

