---
title: org.osgi.service.coordinator
layout: prev-next-collection
version: 1.0
summary: A coordinator for thread based requests with the possibility to get a callback at the end of a request. 
---

![Coordinator Collaboration Diagram](/img/services/org.osgi.service.coordinator.overview.png)

The OSGi programming model is based on the collaboration of standard and custom components. In such a model there is no central authority that has global knowledge of the complete application. Though this lack of authority can significantly increase reusability (and robustness) there are times when the activities of the collaborating bundles must be coordinated. For example, a service that is repeatedly called in a task could optimize performance by caching intermediate results until it knew the task was actually ended.

To know when a task involving multiple collaborators has ended is the primary purpose of the Coordinator service specification. The Coordinator service provides a rendezvous for a _requestor_ to create a _Coordination_ that is then associated with the current thread. When the request finished, the Coordination is _terminated_. Through the Coordinator service anybody being called on the thread can find the _current Coordination_, similar to how transactions are governed.

## Example Use Case

For example let's assume a service is called that sets some information for the current user. Since the API is designed to take element by element, it is generally called a number of times in a web request. Going to the database for each request can be expensive. The service can therefore delay the processing until all requests have been received. 
To implement this, the service checks if there is a current _Coordination_ associated with the thread, and if so, it waits for the _Coordination_ to complete before processing the data. This allows the service to batch the updates and perform them more efficiently, improving the overall performance of the application.

The Coordinator service provides a way for collaborating OSGi bundles to coordinate their activities and manage the lifecycle of a larger task or operation. By associating a _Coordination_ with the current thread, any service or component involved in the task can access information about the overall state and progress of the operation. This allows for optimizations like caching intermediate results or batching updates, as shown in the example.

## Example Code for Using the OSGi Coordinator Service

Here's an example of how you can use the OSGi Coordinator service in your code:

```java
import org.osgi.service.coordinator.Coordination;
import org.osgi.service.coordinator.Coordinator;
import org.osgi.service.coordinator.Participant;

public class UserInfoService {
    private Coordinator coordinator;

    public void setUserInfo(String userId, String info) {
        // Check if there is a current Coordination
        Coordination coordination = coordinator.peek();
        if (coordination != null) {
            // Wait for the Coordination to complete
            coordination.join();
        }

        // Process the user info update
        updateUserInfo(userId, info);
    }

    private void updateUserInfo(String userId, String info) {
        // Logic to update the user information
        System.out.println("Updating user " + userId + " with info: " + info);
    }

    public void activate() {
        // Get the Coordinator service
        coordinator = getCoordinatorService();

        // Register a Participant to be notified when the Coordination completes
        coordinator.begin("UserInfoUpdate", new Participant() {
            @Override
            public void ended(Coordination coordination) {
                // Perform any cleanup or post-processing here
                System.out.println("UserInfoUpdate Coordination ended");
            }

            @Override
            public void failed(Coordination coordination) {
                // Handle any errors or failures here
                System.out.println("UserInfoUpdate Coordination failed");
            }
        });
    }

    private Coordinator getCoordinatorService() {
        // Obtain the Coordinator service from the OSGi service registry
        // (implementation details omitted for brevity)
    }
}
```

In this example, the `UserInfoService` uses the Coordinator service to coordinate the updates to user information. When the `setUserInfo` method is called, the service first checks if there is a current Coordination associated with the thread. If so, it waits for the Coordination to complete before processing the data.

The `activate` method of the service obtains the Coordinator service and begins a new Coordination named "UserInfoUpdate". It also registers a `Participant` that will be notified when the Coordination ends or fails.

By using the Coordinator service, the `UserInfoService` can batch the user info updates and perform them more efficiently, improving the overall performance of the application. The Participant also allows the service to perform any necessary cleanup or post-processing when the Coordination completes.

This is just a simple example, but the Coordinator service can be used in more complex scenarios where multiple OSGi bundles need to coordinate their activities and manage the lifecycle of a larger task or operation.


The key points are:

### Coordination of Collaborating Bundles
- OSGi model has no central authority, so coordination is needed
- Coordinator service provides a rendezvous point for managing task lifecycle

### Accessing the Current Coordination
- _Coordination_ is associated with the current thread
- Any service can access the current _Coordination_ to participate in the task

### Optimizing Performance
- Services can delay processing until all requests are received
- Allows batching updates or caching intermediate results
- Improves overall performance of the application


## Links

- <https://docs.osgi.org/specification/osgi.cmpn/8.0.0/service.coordinator.html>