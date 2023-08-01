//
//  ViewController.swift
//  EnumTableViewExample
//
//  Created by 염성필 on 2023/08/01.
//

import UIKit


enum ListEnum: Int, CaseIterable {
    case first, second, third, foutth
    
    var mainCategories: String {
        
        switch self {
        case .first:
            return Todo.Category.first.sectionTitle
        case .second:
            return Todo.Category.second.sectionTitle
        case .third:
            return Todo.Category.third.sectionTitle
        case .foutth:
            return Todo.Category.fourth.sectionTitle
        }
    }
    
    var rowString: Todo {
        switch self {
        case .first:
            return TodoList.ListEnumElement.first.listElement
        case .second:
            return TodoList.ListEnumElement.second.listElement
        case .third:
            return TodoList.ListEnumElement.third.listElement
        case .foutth:
            return TodoList.ListEnumElement.fourth.listElement
        }
    }

}

class EnumTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ListEnum.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListEnum.allCases[section].rowString.text.count
        
        // 안되는 문제...indexPath.row이게 항상 0...3까지 돌려지니까 out of index 발생함... ⭐️ numberOfSections 여기가 문제였음
        // cell.textLabel?.text = lists[indexPath.section][indexPath.row]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tavleViewCell")!
        
        // Enum으로 만들경우 분기처리를 통한 numberOfInSection을 해줘야함
        cell.textLabel?.text = ListEnum.allCases[indexPath.section].rowString.text[indexPath.row]

        cell.textLabel?.textColor = ListEnum.allCases[indexPath.section].rowString.textColor
        
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ListEnum.allCases[section].mainCategories
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSection = ListEnum.allCases[indexPath.section].mainCategories
        
        let selectedRow = ListEnum.allCases[indexPath.section].rowString.text[indexPath.row]
        
        let selectedRowColor = ListEnum.allCases[indexPath.section].rowString.textColor
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.category = selectedSection
        vc.mainTitle = selectedRow
        vc.mainColor = selectedRowColor
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

