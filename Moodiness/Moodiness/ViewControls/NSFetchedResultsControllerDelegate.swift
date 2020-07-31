////
////  NSFetchedResultsControllerDelegate.swift
////  Moodiness
////
////  Created by Jerry Ren on 7/24/20.
////  Copyright © 2020 Jerry Ren. All rights reserved.
////
//
//import CoreData
//import UIKit
//
//extension ViewController: NSFetchedResultsControllerDelegate {
//    
//    // 详情见 CoreDataDataCore.proj
//    
//    // MARK: - These two commented out functions seemed to have caused the crash when I attempted to delete a row - but why?
//    
////    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
////        primaryTable.endUpdates()
////    }
////
////    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
////        primaryTable.beginUpdates()
////    }
////
//    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//         
//        print("NSFRC type is \(type.rawValue)")
//        
//        switch type {
//            
//        case .update:
//            if let indexPath = newIndexPath, let cello = primaryTable.cellForRow(at: indexPath) {
//                configuringCell(cello, at: indexPath)
//            }
//            break;
//            
//        case .delete:
//            if let indexPath = newIndexPath {
//                primaryTable.deleteRows(at: [indexPath], with: .fade)
//            }
//            break;
//            
//        case .move:
//            if let indexPath = indexPath {
//                primaryTable.deleteRows(at: [indexPath], with: .fade)
//            }
//            if let newIndexPath = newIndexPath {
//                primaryTable.insertRows(at: [newIndexPath], with: .fade)
//            }
//            break;
//            
//        case .insert:
//            if let indexPath = newIndexPath {
//                primaryTable.insertRows(at: [indexPath], with: .fade)
//            }
//            break; // what are all of these breaks for tho
//
//        }
//                
//    }
//}
//
