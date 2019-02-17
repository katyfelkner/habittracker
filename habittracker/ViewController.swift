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
    
    @IBAction func moodValue(_ sender: UISegmentedControl) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            addMoodNum(mood: sender.selectedSegmentIndex + 1)
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
        
//        mood.addTarget(self, action: #selector(self.moodValue(_:)), for: .valueChanged)
    }
    
    // do we even need this method?
    func newDay() -> NSManagedObject? {
        // should be called whenever tracking for a new day is initiated
        // returns object for that day
        // this object is then passed to other methods to add data to the day


        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return nil
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            today = fetched[0]
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)

        }
        
        // 3
        today.setValue(NSDate(), forKeyPath: "date")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return today
    }
    
    // add a numerical mood entry to an existing day
    func addMoodNum(mood: Int) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX

 
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(mood, forKeyPath: "moodNum")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a comma separated string of qualitative mood data for a certain day
    func addMoodString (moodStr: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(moodStr, forKeyPath: "moodStrs")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // add amount of water consumed (in ounces)
    func addWater (today: NSManagedObject, water: Int) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(water, forKeyPath: "water")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addSocialize(social: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(social, forKeyPath: "socialize")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a double - how many hours did user sleep
    // caller is responsible for calculating this or asking user to supply it
    func addSleepTime (hours: Double) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(hours, forKeyPath: "Double")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addShower (shower: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(shower, forKeyPath: "shower")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addReading(reading: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(reading, forKeyPath: "reading")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addMeds(taken: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(taken, forKeyPath: "meds")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addMakeBed(made: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(made, forKeyPath: "makeBed")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addFruitVeg (eaten: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(eaten, forKeyPath: "fruitVeg")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addExercise(exercise: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(exercise, forKeyPath: "exercise")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addCaffeine(caff: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(caff, forKeyPath: "caffeine")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    // add a boolean - did user socialize?
    func addAlcohol(alcohol: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as! AppDelegate? else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
        fetch.predicate = NSPredicate(format: "date == %@", dateFormatter.string(from: Date()))
        
        var today: NSManagedObject
        do {
            let fetched = try managedContext.fetch(fetch) as! [NSManagedObject]
            if (fetched.count == 0) {
                print("found an entry for today")
                today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
            }
            else {
                print("creating an entry for today")
                today = fetched[0]
            }
            
        }
        catch {
            // an entry for today doesnt exist, so we need to create one
            today = NSEntityDescription.insertNewObject(forEntityName: "Day", into: managedContext)
        }
        
        // 3
        today.setValue(alcohol, forKeyPath: "alcohol")
        
        // 4
        do {
            try managedContext.save()
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

