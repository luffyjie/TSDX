//
//  StackViewController.swift
//  TSDX
//
//  Created by ios on 2019/10/20.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import SnapKit
import Atributika

class StackViewController: BasicViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    var phoneNumber:String = "" {
        willSet {
            delete.isHidden = newValue.isEmpty
        }
    }
    
    lazy var container: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 667)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "skypay_logo")
        return imageView
    }()
    
    lazy var countryCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Country code"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        label.textColor = UIColor("#999999")
        return label
    }()
    
    lazy var countryCodeField: UITextField = {
        let field = UITextField()
        field.isEnabled = false
        field.text = "+63"
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        field.textColor = .black
        return field
    }()
    
    lazy var phoneNumberField: UITextField = {
        let field = UITextField()
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        field.textColor = .black
        field.keyboardType = .numberPad
        field.returnKeyType = .done
        field.attributedPlaceholder = NSAttributedString(string: "Mobile number", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor("##D9D9D9")])
        return field
    }()
    
    lazy var lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login_lock")
        return imageView
    }()
    
    lazy var safeTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Your data will be protected and will not be shared."
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = UIColor("#999999")
        label.textAlignment = .left
        return label
    }()
    
    lazy var nextButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setBackgroundImage(UIImage(named: "done_button"), for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 23
        button.layer.shadowOpacity = 0.8
        button.layer.shadowColor = UIColor("#3391FF").cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        return button
    }()
    
    lazy var google:UIButton = {
        let button = UIButton()
        button.setTitle("Google", for: .normal)
        button.setTitleColor(UIColor("#9CA6BB"), for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -13, bottom: 0, right: 0)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(googleAction), for: .touchUpInside)
        button.layer.cornerRadius = 23
        button.layer.shadowOpacity = 0.8
        button.layer.shadowColor = UIColor("#E9EAEF").cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 0.5
        button.layer.borderColor =  UIColor("#E9EAEF").cgColor
        return button
    }()
    
    lazy var facebook:UIButton = {
        let button = UIButton()
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor("#9CA6BB"), for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(facebookAction), for: .touchUpInside)
        button.layer.cornerRadius = 23
        button.layer.shadowOpacity = 0.8
        button.layer.shadowColor = UIColor("#E9EAEF").cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.borderWidth = 0.5
        button.layer.borderColor =  UIColor("#E9EAEF").cgColor
        return button
    }()
    
    lazy var orImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login_or")
        return imageView
    }()
    
    lazy var policyLabel: AttributedLabel = {
        let label = AttributedLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let all = Style.font(.systemFont(ofSize: 9)).foregroundColor(UIColor("#AFB2BC"))
        let link = Style("a")
            .foregroundColor(UIColor("#00A0E9"), .normal)
            .foregroundColor(.red, .highlighted)
        label.attributedText = "By registering,I agree to Traveloka’s <a href=\"https://baiduc.om\">Tems & Conditions</a> and <a href=\"https://github.com/psharanda/Atributika\">Privacy Policy</a>".style(tags: link)
            .styleHashtags(link)
            .styleMentions(link)
            .styleLinks(link)
            .styleAll(all)
        label.onClick = { label, detection in
            switch detection.type {
            case .tag(let tag):
                if tag.name == "a", let href = tag.attributes["href"], let url = URL(string: href) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            default:
                break
            }
        }
        return label
    }()
    
    lazy var delete:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "login_delete"), for: .normal)
        button.addTarget(self, action: #selector(deleteInputText), for: .touchUpInside)
        button.isHidden = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hiddenNavBack()
        setupView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupView() {
        view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.bottom.equalToSuperview()
            }
        }
        container.addSubview(logo)
        logo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(110)
            make.centerX.equalToSuperview()
            make.width.equalTo(256)
            make.height.equalTo(65)
        }
        container.addSubview(countryCodeLabel)
        countryCodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom).offset(107)
            make.left.equalToSuperview().offset(35)
        }
        container.addSubview(countryCodeField)
        countryCodeField.snp.makeConstraints { (make) in
            make.top.equalTo(countryCodeLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(35)
            make.height.equalTo(30)
            make.width.equalTo(65)
        }
        container.addSubview(phoneNumberField)
        phoneNumberField.snp.makeConstraints { (make) in
            make.left.equalTo(countryCodeField.snp.right).offset(10)
            make.centerY.equalTo(countryCodeField)
            make.height.equalTo(30)
            make.width.equalTo(UIScreen.main.bounds.size.width - 144)
        }
        container.addSubview(delete)
        delete.snp.makeConstraints { (make) in
            make.right.equalTo(phoneNumberField)
            make.centerY.equalTo(phoneNumberField)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        container.addSubview(lockImageView)
        lockImageView.snp.makeConstraints { (make) in
            make.top.equalTo(countryCodeField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(35)
        }
        container.addSubview(safeTipLabel)
        safeTipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(lockImageView.snp.right).offset(6)
            make.centerY.equalTo(lockImageView)
        }
        container.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(lockImageView.snp.bottom).offset(40)
            make.height.equalTo(45)
            make.width.equalTo(UIScreen.main.bounds.width - 35 - 34)
            make.centerX.equalToSuperview()
        }
        container.addSubview(orImageView)
        orImageView.snp.makeConstraints { (make) in
            make.top.equalTo(nextButton.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
        }
        container.addSubview(google)
        google.snp.makeConstraints { (make) in
            make.top.equalTo(orImageView.snp.bottom).offset(17)
            make.height.equalTo(45)
            make.width.equalTo(UIScreen.main.bounds.width - 35 - 34)
            make.centerX.equalToSuperview()
        }
        container.addSubview(facebook)
        facebook.snp.makeConstraints { (make) in
            make.top.equalTo(google.snp.bottom).offset(12)
            make.height.equalTo(45)
            make.width.equalTo(UIScreen.main.bounds.width - 35 - 34)
            make.centerX.equalToSuperview()
        }
        if UIScreen.main.bounds.size.height > 667 {
            view.addSubview(policyLabel)
            policyLabel.snp.makeConstraints { (make) in
                if #available(iOS 11.0, *) {
                    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-11)
                } else {
                    make.bottom.equalToSuperview().offset(-11)
                }
                make.centerX.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.width - 122)
            }
        } else {
            container.addSubview(policyLabel)
            policyLabel.snp.makeConstraints { (make) in
                make.top.equalTo(facebook.snp.bottom).offset(50)
                make.centerX.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.width - 122)
            }
        }
    }
    
    @objc func nextButtonAction() {

    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
    }
    
    @objc func googleAction() {
        
    }
    
    @objc func facebookAction() {
        
    }
    
    @objc func deleteInputText() {
        phoneNumber = ""
        phoneNumberField.text = ""
    }
}
