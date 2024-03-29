---
title: org.osgi.service.http.whiteboard
layout: prev-next-collection
version: 1.0
summary:  Allows Servlets & Filters to be registered as OSGi services 
---

## OSGi HTTP Whiteboard Pattern

The OSGi HTTP Whiteboard pattern provides a declarative way to register servlets and resources with the Http Service, using annotations instead of programmatic registration.

### Registering Servlets

To register a servlet using the HTTP Whiteboard pattern, you can use the `@javax.servlet.annotation.WebServlet` annotation on your servlet class. This annotation allows you to specify the URL pattern that the servlet should handle.

```java
import org.osgi.service.component.annotations.Component;
import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component(service = Servlet.class, property = {
    "osgi.http.whiteboard.servlet.pattern=/myservlet"
})
public class MyServlet implements Servlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().write("Hello from MyServlet!");
    }
}
```

In this example, the `@Component` annotation declares that the `MyServlet` class is a service of type `Servlet`. The `osgi.http.whiteboard.servlet.pattern` property specifies the URL pattern that the servlet should handle, in this case, `/myservlet`.

### Registering Resources

To register a resource using the HTTP Whiteboard pattern, you can use the `@org.osgi.service.http.whiteboard.HttpWhiteboardConstants.HTTP_WHITEBOARD_RESOURCE_PATTERN` annotation on your resource provider class.

```java
import org.osgi.service.component.annotations.Component;
import org.osgi.service.http.whiteboard.HttpWhiteboardConstants;

@Component(property = {
    HttpWhiteboardConstants.HTTP_WHITEBOARD_RESOURCE_PATTERN + "=/resources/*",
    HttpWhiteboardConstants.HTTP_WHITEBOARD_RESOURCE_PREFIX + "=/web"
})
public class MyResourceProvider {
    // No implementation needed, the annotations are enough
}
```

In this example, the `@Component` annotation declares a resource provider service. The `HttpWhiteboardConstants.HTTP_WHITEBOARD_RESOURCE_PATTERN` property specifies the URL pattern that the resources should be served from, in this case, `/resources/*`. The `HttpWhiteboardConstants.HTTP_WHITEBOARD_RESOURCE_PREFIX` property specifies the directory in the bundle's resources that should be used to serve the static files, in this case, `/web`.

## Summary

The OSGi HTTP Whiteboard pattern provides a declarative way to register servlets and resources with the Http Service, using annotations instead of programmatic registration. This approach simplifies the process of exposing HTTP-based services and resources in an OSGi framework, making it easier for bundle developers to create web-based applications on top of the OSGi platform.

## Links

- <https://docs.osgi.org/specification/osgi.cmpn/8.0.0/service.http.whiteboard.html>