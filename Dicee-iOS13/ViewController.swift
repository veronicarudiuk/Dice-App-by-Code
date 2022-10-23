//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import SwiftUI
//import UIKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let logoImage = UIImageView()
    let diceOneImage = UIImageView()
    let anotherDiceOneImage = UIImageView()
    //    let rollButton = UIButton(frame: CGRect(x: 130, y: 700, width: 150, height: 80))
    let rollButton = UIButton()
    var imageArray = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(diceOneImage)
        view.addSubview(anotherDiceOneImage)
        view.addSubview(rollButton)
        setupBackgroundImage()
        setuplogoImage()
        setupDiceOneImage()
        setupAnotherDiceOneImage()
        setupRollButton()
    }
    
    func setupBackgroundImage() {
        backgroundImage.image = UIImage(named: "GreenBackground")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    func setuplogoImage() {
        logoImage.image = UIImage(named: "DiceeLogo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 150).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
    }
    
    func setupDiceOneImage() {
        diceOneImage.image = UIImage(named: "DiceOne")
        diceOneImage.translatesAutoresizingMaskIntoConstraints = false
        diceOneImage.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 50).isActive = true
        diceOneImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
        diceOneImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        diceOneImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupAnotherDiceOneImage() {
        anotherDiceOneImage.image = UIImage(named: "DiceOne")
        anotherDiceOneImage.translatesAutoresizingMaskIntoConstraints = false
        anotherDiceOneImage.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: -50).isActive = true
        anotherDiceOneImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
        anotherDiceOneImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        anotherDiceOneImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupRollButton(){
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rollButton.setTitle("Roll", for: .normal)
        rollButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 40)
        rollButton.backgroundColor = UIColor(named: "DiceColor")
        rollButton.layer.cornerRadius = 20
        rollButton.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    @objc func onClick() {
        diceOneImage.image = imageArray.randomElement() as? UIImage
        anotherDiceOneImage.image = imageArray.randomElement() as? UIImage
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            onClick()
        }
    }
}








//добавляем возможность просматривать превью страницы при помощи swiftUI
/* https:apptractor.ru/info/articles/ispolzuem-swiftui-previewprovider-dlya-predstavleniy-uikit.html */
struct SwiftUIController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct SwiftUIController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIController().edgesIgnoringSafeArea(.all)
    }
}
