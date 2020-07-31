//
//  Post+CoreDataClass.swift
//  
//
//  Created by mac on 9/28/19.
//
//

import Foundation
import CoreData
import RxSwift
import Core

@objc(PostEntity)
public class PostEntity: NSManagedObject {

    static var name = String(describing: PostEntity.self)

   /* public class func saveItems(items: [PostResponse]) {
        items.forEach {
            saveItem(item: $0)
        }
    }

    public class func saveItem(item: PostResponse) {
        let obj = NSEntityDescription.insertNewObject(
                forEntityName: name,
                into: managedContext()!
        ) as? PostEntity
        if let obj = obj {
            obj.title = item.title
            obj.body = item.body
            try? managedContext()?.save()
        }
    }

    public class func items(pagingInfo: PagingInfo) -> Single<[PostResponse]> {
        Single<[PostResponse]>.create(subscribe: { single in
            managedContext()?.perform {
                let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
                request.fetchOffset = pagingInfo.start
                request.fetchLimit = pagingInfo.limit

                var items: [PostEntity] = []
                do {
                    items = try managedContext()?.fetch(request) ?? []
                } catch let error {
                    print(error.localizedDescription)
                    single(.error(error))
                }
                let data = items.map {
                    PostResponse(
                            id: Int(truncatingIfNeeded: $0.id),
                            title: $0.title!,
                            body: $0.body!
                    )
                }
                single(.success(data))
            }

            return Disposables.create()
        })
    }*/

    public class func managedContext() -> NSManagedObjectContext? {
        (UIApplication.shared.delegate as? CoreAppDelegate)?.persistentContainer.viewContext
    }
}
