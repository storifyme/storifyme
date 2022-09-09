//
//  WithCodeInitViewController.swift
//  StorifyMe  Samples
//
//  Created by Stefan Djordjevic on 8/24/22.
//

import UIKit
import StorifyMe
class WithCodeInitViewController: UIViewController {
    
    @IBOutlet weak var stackVoew: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Add parent view on view
        
        let widgetIdS = ["6824","6825","6826","6827","6828"]
        for id in widgetIdS
        {
            let storyView = StoryView()
            let settings = StorifyMeSettings(accountId: "mobile-native-test-4200158", accessToken: "cc9052ba-18f2-4906-8e51-be8adb6e89d5", usetWidgetId: id)
            storyView.setSettings(settings: settings)
            storyView.load()
            stackVoew.addArrangedSubview(storyView)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WithCodeInitViewController : StoryEventProtocol
{
    func onAction(type: String, data: [String : Any]?) {
        print("On action \(type), with data \(data)")
    }
    
    func onEvent(type: String, data: [String : Any]?) {
        print("On event \(type), with data \(data)")
    }
    
    func onLoad(stories: [StoryModel]) {
        print("On load call \(stories)")
    }
    
    func onFail(error: Error) {
        print("On Fail call \(error)")
    }
    
    func onStoryOpened(story: StoryModel, index: Int) {
        print(" Open story  \(story)")
    }
    
    func onStoryClose(story: StoryModel) {
        print("On story close \(story)")
    }
    
    
}
