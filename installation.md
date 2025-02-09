---
title: Installation & Getting Started with Bndtools 7.1.0
---

There are now three ways to Install Bndtools 7.1.0+

## New: Install Via Pre-Configured Setups
There are now setups that will install and configure all of Eclipse, other components used by Bndtools (e.g. git, other Eclipse plugins), and Bndtools 7.1.0 itself.  The setups *do not* require having a previously installed version of Eclipse, and so can be helpful for new users to get a working Bndtools environment quickly and easily.

Bndtools 7.1.0 setups [found here](https://bndtools.org/bndtools.p2.repo/)

## Eclipse Marketplace Install

Note that Eclipse and the Marketplace Client Plugin for Eclipse must be installed prior to using this installation method

See the [Eclipse Marketplace](https://marketplace.eclipse.org/content/bndtools) page

<a href="https://marketplace.eclipse.org/marketplace-client-intro?mpc_install=1220" class="drag" title="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client">
<img style="width:80px;" typeof="foaf:Image" class="img-responsive" src="https://marketplace.eclipse.org/modules/custom/eclipsefdn/eclipsefdn_marketplace/images/btn-install.svg" alt="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client" />
</a>

## Update Site Install

Note that Eclipse must be previously installed prior to using this installation method

* From the Help menu select `Install New Software...` 
* When the dialog opens, click the `Add...` button near the top-right.
* In the Name field enter `Bndtools`. In the Location field enter one of the the following P2 Repository URLs

| Type                       |URL                                                    |alt. URL|
|----------------------------|-------------------------------------------------------|--|
| Latest stable release      | `https://bndtools.org/bndtools.p2.repo/7.1.0/`       | via [jfrog](https://bndtools.jfrog.io/bndtools/update-latest)  |
| Latest release candidate   | `https://bndtools.jfrog.io/bndtools/update-rc`          ||
| Latest build snapshot      | `https://bndtools.jfrog.io/bndtools/update-snapshot`    ||

* Press `Next` and then `Finish`, acknowledging the licenses

## Getting Started Materials

To get started with Bnd/Bndtools we recommend:
- the [Concepts](concepts.html) behind bndtools
- our [Video Tour](/workspace.html)
- our [Tutorial](tutorial.html) building a sample application
- and our [Project Templates](/manual/templates.html)

## Developers and Contributors: To contribute to Bndtools development 

- Setup source code into your existing Eclipse installation. See our [Bndtools Developer Guide](/development.html)

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Ry6XNGm7C-k" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

To get then started with the [bndtools Workspace model](workspace.html), you can follow some videos that can get you started.

All contributions (e.g. testing, bug reporting and fixing, documentation, examples, tutorials) welcome! 

## Release Notes

For more complete information on the changes in the Bndtools release, see <https://github.com/bndtools/bnd/wiki#release-notes>.

## Known Issues

* Bndtools is built to run on Eclipse 2022-09 or later. So Bndtools 7.1.0 may not run on older versions of Eclipse.

* This release is based on Java 17. This tends to be not noticed for development but there are a number of runtime bundles in the distribution that now also have become Java 17 code. This could generate the error during a bndrun launch or with bnd/OSGi testing when the Execution Environment is set to < 17. The easy fix is to set this to 17. If this is impossible, the previous launchers than run on 1.8 can then be used (if they are available in the repositories). Add
```
-runpath \
    biz.aQute.launcher;version="[6.4.0,7)", \
    biz.aQute.tester.junit-platform;version="[6.4.0,7)"
```

