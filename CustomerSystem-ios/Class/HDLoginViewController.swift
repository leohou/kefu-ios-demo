//
//  HDLoginViewController.swift
//  CustomerSystem-ios
//
//  Created by houli on 2022/8/17.
//  Copyright © 2022 easemob. All rights reserved.
//

import UIKit
import CoreAudioTypes
import HelpDesk
@objcMembers
class HDLoginViewController: UIViewController, UITextFieldDelegate {
    
    let lb = UILabel()
    let tf = UITextField()
    let pwd = UITextField()
    let btn = UIButton(type: .system)
    let logout = UIButton(type: .system)
    let regist = UIButton(type: .system)
    
    let clear = UIButton(type: .system)
    let loginStatus = UIButton(type: .system)
    
    let logoutIM = UIButton(type: .system)
    
    var username : String? = String()
    var pwdWord : String? = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        lb.frame = CGRect(x: 20, y: 0, width: view.frame.width-20, height: 88)
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0;
        lb.text = HDClient.shared().currentUsername
        lb.font = .systemFont(ofSize: 15)
        view.addSubview(lb)
        username = HDClient.shared().currentUsername
        
      
        
        
        tf.frame = CGRect(x: 10, y: 84, width: 400, height: 44)
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 15)
        tf.isSecureTextEntry = false
        tf.textAlignment = .left
        tf.borderStyle = .none
        tf.placeholder = "请输入用户名"
        tf.borderStyle = .line;
        tf.text = username
        view.addSubview(tf)

        pwd.frame = CGRect(x: 10, y: 84 + 44 + 20, width: 400, height: 44)
        pwd.backgroundColor = .white
        pwd.textColor = .black
        pwd.font = .systemFont(ofSize: 15)
        pwd.isSecureTextEntry = false
        pwd.textAlignment = .left
        pwd.borderStyle = .line
        pwd.placeholder = "请输入密码"
        view.addSubview(pwd)
        
     
        btn.frame = CGRect(x: view.center.x/1.2, y: tf.frame.origin.y + pwd.frame.origin.y, width: 64, height: 44)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = .systemFont(ofSize: 15)
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(btn)
        
        logout.frame = CGRect(x: view.center.x/1.2, y: btn.frame.origin.y + 64, width: 64, height: 44)
        logout.backgroundColor = .blue
        logout.titleLabel?.font = .systemFont(ofSize: 15)
        logout.setTitle("退出", for: .normal)
        logout.setTitleColor(UIColor.white, for: .normal)
        logout.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        view.addSubview(logout)
        
        clear.frame = CGRect(x: view.center.x/1.2, y: logout.frame.origin.y + 64, width: 64, height: 44)
        clear.backgroundColor = .blue
        clear.titleLabel?.font = .systemFont(ofSize: 15)
        clear.setTitle("清理本地", for: .normal)
        clear.setTitleColor(UIColor.white, for: .normal)
        clear.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
        view.addSubview(clear)
        
        loginStatus.frame = CGRect(x: view.center.x/1.2, y: clear.frame.origin.y + 64, width: 64, height: 44)
        loginStatus.backgroundColor = .blue
        loginStatus.titleLabel?.font = .systemFont(ofSize: 15)
        loginStatus.setTitle("获取登录状态", for: .normal)
        loginStatus.setTitleColor(UIColor.white, for: .normal)
        loginStatus.addTarget(self, action: #selector(loginStatusAction), for: .touchUpInside)
        view.addSubview(loginStatus)
        
        logoutIM.frame = CGRect(x: view.center.x/1.2, y: loginStatus.frame.origin.y + 64, width: 64, height: 44)
        logoutIM.backgroundColor = .blue
        logoutIM.titleLabel?.font = .systemFont(ofSize: 15)
        logoutIM.setTitle("im推出", for: .normal)
        logoutIM.setTitleColor(UIColor.white, for: .normal)
        logoutIM.addTarget(self, action: #selector(logoutIMAction), for: .touchUpInside)
        view.addSubview(logoutIM)
        
        
        
        let tt = "当前登录的用户名："
        let tt1 = self.tf.text
        var str = ""
        str = tt + tt1!//字符串拼接
        
        self.lb.text = str;
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true);
    }
    
    func login(){
        HDClient.shared().login(withUsername: tf.text, password: pwd.text) { aError in
            if(aError == nil){
                
                NSLog("登录成功")
                let tt = "当前登录的用户名：\n"
                let tt1 = self.tf.text
                var str = ""
                str = tt + tt1!//字符串拼接
                
                self.lb.text = str;
                
            }else{
                
                NSLog("登录失败")
                self.lb.text = aError?.errorDescription;
            }
        }
    }
    func logoutAction(){
        
        
        HDClient.shared().logout(true)  { aError in
            if(aError == nil){
               
        
                NSLog("退出成功")
                let tt1 = "退出成功 上一次 登录的用户为：\n"
                
                self.lb.text = tt1 + self.tf.text!;
                
            }else{
                NSLog("退出失败")
                self.lb.text = aError?.errorDescription;
            }
        }
    }
    func clearAction(){
        
        HDClient.shared().releaseResource();
        
//        NSLog("======%d", HDClient.shared().getIsLoggedInBefore());
        
    }
    
    func loginStatusAction(){
        
        
        HDClient.shared().getIsLoggedIn { aError in
            NSLog("获取了");
            
        }
        
//        NSLog("======%d", HDClient.shared().getIsLoggedInBefore());
        
        
    }
    func logoutIMAction(){
        
        
        EMClient.shared().logout(false);
        
//        NSLog("======%d", HDClient.shared().getIsLoggedInBefore());
        
        
    }
    
    
}
