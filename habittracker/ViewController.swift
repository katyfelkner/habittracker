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

    @IBOutlet weak var mood: UISegmentedControl!
    var today: NSManagedObject?
    
    @IBAction func moodValue(_ sender: UISegmentedControl) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let todaysDay = today {
            addMoodNum(today: todaysDay, mood: sender.selectedSegmentIndex + 1)
        }
    }
   
    
    // array of all the days
    // for now we are loading them all into memory but this may become too big
    var days: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: put in a title
    
        
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        self.today = newDay()
        
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
//        mood.addTarget(self, action: #selector(self.moodValue(_:)), for: .valueChanged)
    }
    
    func newDay() -> NSManagedObject? {
        // should be called whenever tracking for a new day is initiated
        // returns object for that day
        // this object is then passed to other methods to add data to the day
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if NSEntityDescription.entity(forEntityName: "Day", in: managedContext) == nil {
            NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 2
        guard let entity = NSEntityDescription.entity(forEntityName: "Day", in: managedContext) else {
            return nil
        }
        
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
    func addMoodNum(today: NSManagedObject, mood: Int) {
        
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
    func addMoodString (today: NSManagedObject, moodStr: String) {
        
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
    func addWater (today: NSManagedObject, water: Int) {
        
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
    
    // add a boolean - did user socialize?
    func addSocialize(today: NSManagedObject, social: Bool) {
        
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
    func addSleepTime (today: NSManagedObject, hours: Double) {
        
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
    func addShower (today: NSManagedObject, shower: Bool) {
        
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
    func addReading(today: NSManagedObject, reading: Bool) {
        
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
    func addMeds(today: NSManagedObject, taken: Bool) {
        
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
    func addMakeBed(today: NSManagedObject, made: Bool) {
        
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
    func addFruitVeg (today: NSManagedObject, eaten: Bool) {
        
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
    func addExercise(today: NSManagedObject, exercise: Bool) {
        
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
    func addCaffeine(today: NSManagedObject, caff: Bool) {
        
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
    func addAlcohol(today: NSManagedObject, alcohol: Bool) {
        
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
    
    func completeEntry(entity: NSEntityDescription, date: Date, sleepHrs: Double, water: Int, socialize: Bool, shower: Bool, reading: Bool, moodStrs: String, moodNum: Int, meds: Bool, makeBed: Bool, fruitVeg: Bool, exercise: Bool, caffeine: Bool, alcohol: Bool) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let today = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        // populate this object with all the values
        today.setValue(alcohol, forKeyPath: "alcohol")
        today.setValue(caffeine, forKeyPath: "caffeine")
        today.setValue(date, forKeyPath: "date")
        today.setValue(exercise, forKeyPath: "exercise")
        today.setValue(fruitVeg, forKeyPath: "fruitVeg")
        today.setValue(makeBed, forKeyPath: "makeBed")
        today.setValue(meds, forKeyPath: "meds")
        today.setValue(moodNum, forKeyPath: "moodNum")
        today.setValue(moodStrs, forKeyPath: "moodStrs")
        today.setValue(reading, forKeyPath: "reading")
        today.setValue(shower, forKeyPath: "shower")
        today.setValue(sleepHrs, forKeyPath: "sleep")
        today.setValue(socialize, forKeyPath: "socialize")
        today.setValue(water, forKeyPath: "water")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // wipe database and populate it with a set of testing data
    func populateTestData () {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Day", in: managedContext)!
        
        
        // get training data CSV
        do {
            // make a date formatter for convenience
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/DD/YYYY"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            
            let u = URL(fileURLWithPath: "trainingdata.csv")
            
            let s = try String(contentsOf: u)
            // separate into lines
            let lines: [String.SubSequence] = s.split(separator:"\n")
            
            // process each line
            for l in lines {
                // separate on commas
                let cells: [String.SubSequence] = l.split(separator:",")
                
                
               // completeEntry(entity: entity, date: dateFormatter.date(from: String(cells[0])), sleepHrs: Double(cells[3]), water: Int(cells[4]), socialize: Bool(cells[9]), shower: Bool(cells[5]), reading: Bool(cells[12]), moodStrs: String(cells[]), moodNum: Int, meds: Bool, makeBed: Bool, fruitVeg: Bool, exercise: Bool, caffeine: Bool, alcohol: Bool)
                
            }
            
        } catch {
            print("error processing: trainingdata.csv: \(error)")
        }
        
        
        
    }
    
    func processFile(at url: URL)
    {
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    

    
    
    // all these functions control the back end of the app - updating CoreData table
}

