---
title: org.osgi.service.event
layout: prev-next-collection
version: 1.0
summary: A simple publish and subscribe mechanism for generic events 
---

![Event Admin Collaboration Diagram](/img/services/org.osgi.service.event.overview.png)

# When to Use?

The archetypical use case for Event Admin is the case where you have useful information but you're not sure who might be interested. That is, you feel like talking and don't care if someone is actually listening. For example, a web based user interface shows the internal state of a wiring circuit. Though the user interface obviously knows about the circuit component, a good design goes out of its way to keep the circuit component unaware of the user interface. One approach is to create circuit specific listeners. However, these listeners tend to follow an almost identical pattern between different components, causing ugly looking boiler plate code.

The Event Admin service captures this commonality.

# Examples 

## Example Handler

The following code shows a component that handles an event on the topic: `some/topic`. 

```java
import org.osgi.service.event.Event;
import org.osgi.service.event.EventHandler;
import org.osgi.service.event.EventConstants;

@Component( property= EventConstants.EVENT_TOPIC + "=some/topic")
public class SomeListenerImpl implements EventHandler {

	@Override
	public void handleEvent(Event event) {
		System.out.println("Got event " + event);
	}
}
```

## Example Generator

The following code shows a component that sends an event every second using the [scheduler][scheduler]. 

```java
@Component(property=CronJob.CRON+"=* * * * * ?")
public class EventSource {

	EventAdmin	eventAdmin;
	
	public void run(Object object) {
		Event event = new Event( "osgi/enroute/examples/ping", new HashMap<String,Object>() );
		eventAdmin.postEvent(event);
	}
	
	@Reference
	void setEventAdmin( EventAdmin eventAdmin) {
		this.eventAdmin = eventAdmin;
	}
}
```




Nearly all the bundles in an OSGi framework must deal with events, either as an event publisher or as an event handler. So far, the preferred mechanism to disperse those events have been the service interface mechanism.

Dispatching events for a design related to _X_, usually involves a service of type _XListener_. However, this model does not scale well for fine grained events that must be dispatched to many different handlers. Additionally, the dynamic nature of the OSGi environment introduces several complexities because both event _publishers_ and event _handlers_ can appear and disappear at any time.

## Summary

The Event Admin service provides an inter-bundle communication mechanism. It is based on a event publish and subscribe model, popular in many message based systems.
This specification defines the details for the participants in this event model.

## Links

- <https://docs.osgi.org/specification/osgi.cmpn/8.0.0/service.event.html>


[scheduler]: /services/osgi.enroute.scheduler.api.html
