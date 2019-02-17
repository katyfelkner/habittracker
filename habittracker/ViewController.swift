//
//  ViewController.swift
//  habittracker
//
//  Created by Katy Felkner on 2/16/19.
//  Copyright © 2019 Katy Felkner. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    
    
    // array of all the days
    // for now we are loading them all into memory but this may become too big
    var days: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: put in a title
    
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Day")
        
        //3
        do {
            days = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func newDay() -> NSManagedObject {
        // should be called whenever tracking for a new day is initiated
        // returns object for that day
        // this object is then passed to other methods to add data to the day
        //guard let appDelegate =
            //UIApplication.shared.delegate as! AppDelegate
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Day",
                                       in: managedContext)!
        
        let today = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        
        // 3
        today.setValue(NSDate(), forKeyPath: "date")
        
        // 4
        do {
            try managedContext.save()
            days.append(today)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return today
    }
    
    // add a numerical mood entry to an existing day
    func addMoodNum(today: NSManagedObject, mood: int_fast16_t) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        today.setValue(mood, forKeyPath: "moodNum")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a comma separated string of qualitative mood data for a certain day
    func addMoodString                                                                                                   (today: NSManagedObject, moodStr: String) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        today.setValue(moodStr, forKeyPath: "moodStrs")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add amount of water consumed (in ounces)
    func addWater                                                                                                   (today: NSManagedObject, water: int_fast16_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        today.setValue(water, forKeyPath: "water")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add wake up time in as a Date object
    func addWakeTime                                                                                                  (today: NSManagedObject, wakeTime: Date) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(NSDate(timeInterval:TimeInterval(0), since: wakeTime), forKeyPath: "wakeUpTime")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add bed time as a Date object
    func addBedTime                                                                                                  (today: NSManagedObject, bedTime: Date) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(NSDate(timeInterval:TimeInterval(0), since: bedTime), forKeyPath: "bedtime")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addSocialize                                                                                                  (today: NSManagedObject, social: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(social, forKeyPath: "socialize")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a double - how many hours did user sleep
    // caller is responsible for calculating this or asking user to supply it
    func addSleepTime                                                                                                (today: NSManagedObject, hours: double_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(hours, forKeyPath: "sleep")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addShower                                                                                                  (today: NSManagedObject, shower: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(shower, forKeyPath: "shower")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addReading                                                                                                  (today: NSManagedObject, reading: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(reading, forKeyPath: "reading")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addMeds                                                                                                (today: NSManagedObject, taken: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(taken, forKeyPath: "meds")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addMakeBed                                                                                                  (today: NSManagedObject, made: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(made, forKeyPath: "makeBed")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addFruitVeg                                                                                                 (today: NSManagedObject, eaten: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(eaten, forKeyPath: "fruitVeg")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addExercise                                                                                                 (today: NSManagedObject, exercise: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(exercise, forKeyPath: "exercise")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addCaffeine                                                                                                  (today: NSManagedObject, caff: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(caff, forKeyPath: "caffeine")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addAlcohol                                                                                                (today: NSManagedObject, alcohol: boolean_t) {
        
        // TODO: need a better way to manage all this
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 3
        today.setValue(alcohol, forKeyPath: "alcohol")
        
        do {
            try managedContext.save()
            //days.append(today)
            // TODO: should we deal with an array in local memory here?
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    

    
    
    // all these functions control the back end of the app - updating CoreData table
}

