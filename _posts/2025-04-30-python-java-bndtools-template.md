---
layout: prev-next-collection
title: New Project Template for Python.Java Remote Services
description: Allows interaction between python and Java/OSGi.
comments: true
author: Scott Lewis
---

There is a new project template an simple 'hello' example using the [ECF Python.Java Distribution Provider](https://github.com/ECF/Py4j-RemoteServicesProvider) for 
microservice<->microservice interaction between a Java/OSGi process, and a Python process.

OSGi Remote Service Admin enables a standard way (via [RSA](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.remoteserviceadmin.html)) to discover and use OSGi Remote Services
between the OSGi service registry and [iPOPO](https://ipopo.readthedocs.io/en/3.1.0/), an OSGi-like service registry, component 
model, and dynamic injection framework for Python 3.9+.  See also [here](https://ipopo.readthedocs.io/en/3.1.0/tutorials/index.html) for iPOPO tutorials for the 
Python side-RSA impl,
providing other kinds of service/endpoint discovery (e.g. etcd3) and distribution providers currently available, along with a full API for adding 
custom discovery and/or distribution providers in Python, that can use proprietary and/or open communications protocols.

Below is a short description of how to access and use the project template example from within the ECF Bndtools Workspace Template.

With Bndtoools 7.1+, create a new Eclipse workspace and choose New->Bnd OSGi Workspace. 

1. Create a new Bndtools Workspace using the [ECF Bndtools Workspace Template](https://github.com/ECF/bndtools.workspace)

![bndtoolsnewwkspace](https://github.com/user-attachments/assets/95ec5792-6bc2-4c88-990d-4e8d3350627e)

2. Create a new Bnd OSGi project

![bndtoolsnewproject](https://github.com/user-attachments/assets/fa2641e6-a074-4796-b761-f79999b9ba06)

3. Open the projectName.hellopython.javahost.bndrun file in the project directory
   
![bndtoolsbndrun](https://github.com/user-attachments/assets/9bf8a380-9ee7-4e48-ac49-1627cf3ace75)

4. Choose 'Resolve' and then 'Update'

5. Select Debug OSGi to start the example application (Java)

![bndtoolsdebug](https://github.com/user-attachments/assets/9fa2536f-9748-4f5f-94bc-b78374f436a8)

Running Python Example Program 

1. Install [iPOPO v 3.1.0](https://ipopo.readthedocs.io) in your Python (3.9 or greater) local environment

2. In a command shell or IDE, navigate to the project directory and run the run_python_example.py script


```
python run_python_example.py
```
The examples will output progress to their respective consoles as the remote services are made exported,
discovered, and imported by the java process or the python process.  

![bndtoolspython](https://github.com/user-attachments/assets/d5bbd4e4-d57c-412a-a198-fe16ed76a95d)

Most of the code that produces output is available inside the example project. For java: src/main/java/.../hello/*.java 
and for the python code: python-src/samples/rsa
