---
title: org.osgi.service.http
layout: prev-next-collection
version: 1.2.1
summary:  An HTTP server framework
---

![Http Service Collaboration Diagram](/img/services/org.osgi.service.http.overview.png)

An OSGi framework normally provides users with access to services on the Internet and other networks. This access allows users to remotely retrieve information from, and send control to, services in an OSGi framework using a standard web browser.
Bundle developers typically need to develop communication and user interface solutions for standard technologies such as HTTP, HTML, XML, and servlets.

The Http Service supports two standard techniques for this purpose:

* Registering servlets – A servlet is a Java object which implements the Java Servlet API. Registering a servlet in the Framework gives it control over some part of the Http Service URI namespace.
* Registering resources – Registering a resource allows HTML files, image files, and other static resources to be made visible in the Http Service URI name-space by the requesting bundle.
Implementations of the Http Service can be based on:
  * [HTTP 1.0 Specification RFC-1945][1] 
  * [HTTP 1.1 Specification RFC-2616][2] 

Alternatively, implementations of this service can support other protocols if these protocols can conform to the semantics of the javax.servlet API. This additional support is necessary because the Http Service is closely related to [3] Java Servlet Technology. Http Service implementations must support at least version 2.1 of the Java Servlet API.


## Examples

Note: Also see the next page about the [OSGi HTTP Whiteboard Pattern](/services/org.osgi.service.http.whiteboard.html) showing simpler approach than the example code below (less boiler plate code).


### Registering Servlets

A servlet is a Java object that implements the Java Servlet API. Registering a servlet in the OSGi framework gives it control over some part of the Http Service URI namespace. This allows the servlet to handle HTTP requests and generate dynamic content in response.

Here's an example of how to register a servlet in OSGi:

```java
import org.osgi.service.http.HttpService;
import org.osgi.service.http.NamespaceException;
import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyServlet implements Servlet {
    private HttpService httpService;

    public void activate(HttpService httpService) {
        this.httpService = httpService;
        try {
            httpService.registerServlet("/myservlet", this, null, null);
        } catch (NamespaceException e) {
            // Handle exception
        }
    }

    public void deactivate() {
        httpService.unregisterServlet(this);
    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().write("Hello from MyServlet!");
    }
}
```

### Registering Resources

Registering a resource allows HTML files, image files, and other static resources to be made visible in the Http Service URI namespace by the requesting bundle. This is useful for serving static content, such as web pages, images, and other assets.

Here's an example of how to register a resource in OSGi:

```java
import org.osgi.service.http.HttpService;
import org.osgi.service.http.NamespaceException;

public class MyResourceProvider {
    private HttpService httpService;

    public void activate(HttpService httpService) {
        this.httpService = httpService;
        try {
            httpService.registerResources("/resources", "/web", null);
        } catch (NamespaceException e) {
            // Handle exception
        }
    }

    public void deactivate() {
        httpService.unregisterResources("/resources", "/web");
    }
}
```

In this example, the `/resources` URI path is mapped to the `/web` directory in the bundle's resources. This allows the Http Service to serve static files, such as HTML, CSS, and images, from the bundle's web directory.

## Summary

The OSGi Http Service provides a standard way for bundle developers to expose HTTP-based services and resources in an OSGi framework. By registering servlets and resources, developers can create dynamic and static web content that can be accessed by users through a standard web browser. This integration with the Java Servlet API allows for a familiar and powerful way to build web-based applications on top of the OSGi platform.


## Links

- <https://docs.osgi.org/specification/osgi.cmpn/8.0.0/service.http.html>

[1]: HTTP 1.0 Specification RFC-1945, http://www.ietf.org/rfc/rfc1945.txt, May 1996
[2]: HTTP 1.1 Specification RFC-2616, http://www.ietf.org/rfc/rfc2616.txt, June 1999
