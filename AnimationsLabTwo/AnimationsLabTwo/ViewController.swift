//
//  ViewController.swift
//  AnimationsLabTwo
//
//  Created by Anthony Gonzalez on 10/14/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var linearBall: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeInBall: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeOutBall: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var easeInEaseOutBall: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "poop")
        return view
    }()
    
    lazy var linearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Linear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tag = 0
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeInButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseIn", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tag = 1
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easeOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("EaseOut", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tag = 2
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    lazy var easeInEaseOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("easeInEaseOut", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = 3
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(hideButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView(arrangedSubviews: [linearButton, easeInButton, easeOutButton, easeInEaseOutButton])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        return buttonStack
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(resetButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(animateButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func hideButtonPressed(sender: UIButton){
        switch sender.tag {
        case 0:
            if linearBall.isHidden == true {
                linearBall.isHidden = false
            } else {
                linearBall.isHidden = true
            }
        case 1:
            if easeInBall.isHidden == true {
                easeInBall.isHidden = false
            } else {
                easeInBall.isHidden = true
            }
            
        case 2:
            if easeOutBall.isHidden == true {
                easeOutBall.isHidden = false
            } else {
                easeOutBall.isHidden = true
            }
            
        case 3:
            if easeInEaseOutBall.isHidden == true {
                easeInEaseOutBall.isHidden = false
            } else {
                easeInEaseOutBall.isHidden = true
            }
        default: ()
        }
    }
    
    @objc func animateButtonPressed(sender: UIButton) {
        animateLinearBall()
        animateEaseInBall()
        animateEaseOutBall()
        animateEaseInEaseOutBall()
    }
    
    @objc func resetButtonPressed(sender: UIButton) {
        linearBall.transform = CGAffineTransform.identity
        easeInBall.transform = CGAffineTransform.identity
        easeOutBall.transform = CGAffineTransform.identity
        easeInEaseOutBall.transform = CGAffineTransform.identity
    
        
//        easeInEaseOutBall.center = CGPoint(x: easeInEaseOutBall.center.x, y: easeInEaseOutBall.center.y - 600)
        //CGAffineTransform doesn't change the actual center? Somehow, when the ball moves, it prints out the same center as when it started. Yet, reverting the change made via subtraction seems to work.
    }
    
    
    private func animateLinearBall(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveLinear, animations: {
            self.linearBall.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    
    private func animateEaseInBall(){
        print(easeInBall.center)
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseIn, animations: {
            self.easeInBall.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: {(action) in
                print(self.easeInBall.center)
        })
        
    }
    
    private func animateEaseOutBall(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseOut, animations: {
            self.easeOutBall.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    private func animateEaseInEaseOutBall(){
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseInOut, animations: {
            self.easeInEaseOutBall.transform = CGAffineTransform(translationX: 0, y: 600) } , completion: nil)}
    
    private func setConstraints(){
        setConstraintsForButtonStack()
        setConstraintsForLinearBall()
        setConstraintsForEaseInBall()
        setConstraintsForEaseOutBall()
        setConstraintsForEaseInEaseOutBall()
        setConstraintsForResetButton()
        setConstraintsForAnimateButton()
    }
    
    private func setConstraintsForLinearBall(){
        NSLayoutConstraint.activate([
            linearBall.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            linearBall.centerXAnchor.constraint(equalTo: linearButton.centerXAnchor),
            linearBall.widthAnchor.constraint(equalToConstant: 70),
            linearBall.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func setConstraintsForEaseInBall(){
        NSLayoutConstraint.activate([
            easeInBall.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeInBall.centerXAnchor.constraint(equalTo: easeInButton.centerXAnchor),
            easeInBall.widthAnchor.constraint(equalToConstant: 70),
            easeInBall.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
    }
    
    private func setConstraintsForEaseOutBall(){
        NSLayoutConstraint.activate([
            easeOutBall.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeOutBall.centerXAnchor.constraint(equalTo: easeOutButton.centerXAnchor),
            easeOutBall.widthAnchor.constraint(equalToConstant: 70),
            easeOutBall.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setConstraintsForEaseInEaseOutBall(){
        NSLayoutConstraint.activate([
            easeInEaseOutBall.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            easeInEaseOutBall.centerXAnchor.constraint(equalTo: easeInEaseOutButton.centerXAnchor),
            easeInEaseOutBall.widthAnchor.constraint(equalToConstant: 70),
            easeInEaseOutBall.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    private func setConstraintsForButtonStack(){
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setConstraintsForResetButton(){
        NSLayoutConstraint.activate([
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    
    private func setConstraintsForAnimateButton(){
        NSLayoutConstraint.activate([
            animateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func addSubviews(){
        [linearBall, easeInBall, easeOutBall, easeInEaseOutBall, buttonStackView, resetButton, animateButton].forEach{$0.translatesAutoresizingMaskIntoConstraints = false }
        
        let UIElements = [linearBall, easeInBall, easeOutBall, easeInEaseOutBall,buttonStackView, resetButton, animateButton]
        for UIElement in UIElements {
            self.view.addSubview(UIElement)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        view.backgroundColor = #colorLiteral(red: 0.9778421521, green: 1, blue: 0.8806159496, alpha: 1)
    }
}

