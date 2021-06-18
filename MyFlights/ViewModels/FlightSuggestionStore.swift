//
//  FlightSuggestionStorage.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import Foundation
import Combine
import CoreData

class FlightSuggestionStore: NSObject, ObservableObject {
    
    var flightSuggestions = CurrentValueSubject<[FlightSuggestion], Never>([])
    private var flightSuggestionFetchController: NSFetchedResultsController<FlightSuggestion>?
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        
        self.context = context
        
        super.init()
        
        let request = NSFetchRequest<FlightSuggestion>(entityName: "FlightSuggestion")
        request.sortDescriptors = generateSortDescriptors()
        request.predicate = generateDatePredicate()
        
        flightSuggestionFetchController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        flightSuggestionFetchController?.delegate = self
        
        do{
            
            try flightSuggestionFetchController?.performFetch()
            flightSuggestions.value = flightSuggestionFetchController?.fetchedObjects ?? []
            
        } catch {
            
            flightSuggestions.value = []
            
        }
        
    }
    
    private func generateSortDescriptors() -> [NSSortDescriptor]?{
        return [NSSortDescriptor(key: "countryNameTo", ascending: true)]
    }
    
    private func generateDatePredicate() -> NSPredicate?{
        
        //fetch today's suggestions
        
        let dateFrom = DateHelper.shared.startOfToday
        
        guard let dateTo = DateHelper.shared.endOfToday else { return nil }
        
        let fromPredicate = NSPredicate(format: "suggestDate >= %@", dateFrom as NSDate)
        let toPredicate = NSPredicate(format: "suggestDate < %@", dateTo as NSDate)
        
        let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
        
        return datePredicate
    }
    
    func add(_ flights: [Flight]){
        
        let limit = 5
        var recentlySaved = 0
        
        iteratingFlights: for flight in flights{
            
            while recentlySaved != limit {
                
                let new = FlightSuggestion(context: context)
                new.id = flight.id
                new.price = Int16(truncatingIfNeeded: flight.conversion?.EUR ?? 0)
                new.suggestDate = Date()
                new.flyTo = flight.flyTo
                new.fly_duration = flight.fly_duration
                new.countryCodeTo = flight.countryTo?.code
                new.countryNameTo = flight.countryTo?.name
                new.cityTo = flight.cityTo
                new.cityCodeTo = flight.cityCodeTo
                new.cityFrom = flight.cityFrom
                new.countryNameFrom = flight.countryFrom?.name
                new.cityCodeFrom = flight.cityCodeFrom
                new.countryCodeFrom = flight.countryFrom?.code
                new.aTimeUTC = Int16(truncatingIfNeeded: flight.aTimeUTC ?? 0)
                new.dTimeUTC = Int16(truncatingIfNeeded: flight.dTimeUTC ?? 0)
                new.mapIdto = flight.route?.compactMap{ $0.mapIdto }.first(where: { !$0.isEmpty })
                new.deepLink = flight.deep_link
                
                do{
                    
                    try context.save()
                    recentlySaved += 1
                    
                }catch{
                    
                }
                
                continue iteratingFlights
                
            }
            
        }
        
    }
    
}

extension FlightSuggestionStore: NSFetchedResultsControllerDelegate{
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        guard let suggestions = controller.fetchedObjects as? [FlightSuggestion] else { return }
        flightSuggestions.value = suggestions
        
    }
    
}
