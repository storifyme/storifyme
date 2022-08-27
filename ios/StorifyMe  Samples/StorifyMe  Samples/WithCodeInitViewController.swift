//
//  WithCodeInitViewController.swift
//  StorifyMe  Samples
//
//  Created by Stefan Djordjevic on 8/24/22.
//

import UIKit
import StorifyMe
class WithCodeInitViewController: UIViewController {
    
    var storyView : StoriesCollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Add parent view on view
        let parentView = UIView()
        parentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(parentView)
        
        parentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        parentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        parentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        parentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let settings = StorifyMeSettings(accountId: "storify", accessToken: "a92e4e01-b5f5-4a80-bada-916af596e1ab", usetWidgetId: "6452")
        storyView = InitializeStoryView.createStoryView(parentView:parentView, settings: settings)
        
        //add custom widget configuration and
        var newConf = WidgetConfig()
        newConf.setQueryParameter(name: "param1", value: "holiday")
        newConf.setQueryParameter(name: "param2", value: "vacation")
        newConf.setSegments(tags: ["my-stories","men","blog"])
        
        storyView?.setWidgetConfig(config: newConf)
        
        storyView?.load()
        //add delegates (optional)
        storyView?.eventDelegate = self
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
