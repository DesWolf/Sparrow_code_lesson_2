//
//  ViewController.swift
//  SecondLesson
//
//  Created by Максим Окунеев on 05.07.2023.
//


//  Добавить на экран 3 кнопки с разным текстом. По нажатию на третью кнопку показывать модальный контроллер.
//
//- Кнопки должны быть адаптивные, под разный текст - разная ширина. Отступ внутри кнопки от контента 10pt по вертикали и 14pt по горизонтали.
//- По нажатию анимировано уменьшать кнопку. Когда отпускаешь - кнопка возвращается к оригинальному размеру. Анимация должна быть прерываемая, например, кнопка возвращается к своему размеру, а в процессе анимации снова нажать на кнопку - анимация пойдет из текущего размера, без скачков.
//- Справа от текста поставить иконку. Использовать системный imageView в классе кнопки, создавать свою imageView нельзя. Расстояние между текстом и иконкой 8pt.
//- Когда показывается модальный контроллер, кнопки должны закрашиваться серым. Нельзя привязываться к методам жизненного цикла контроллера.


import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    lazy var firstButton: LessonButton = {
        let button  = LessonButton(type: .custom)
        
        button.setTitle("First Button", for: .normal)
        
        return button
    }()
    
    lazy var secondButton: LessonButton = {
        let button  = LessonButton(type: .custom)
        
        button.setTitle("Second Mdium Button", for: .normal)
        
        return button
    }()
    
    lazy var thirdButton: LessonButton = {
        let button  = LessonButton(type: .custom)
        
        button.setTitle("Third Button", for: .normal)
        button.addTarget(self, action: #selector(showBottomView), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        self.view.addSubview(firstButton)
        self.view.addSubview(secondButton)
        self.view.addSubview(thirdButton)
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func showBottomView() {
        self.present(SecondViewController(), animated: true)
    }
}

