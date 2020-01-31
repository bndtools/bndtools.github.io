---
title: Package Explorer
description: An overview of the Bndtools Explorer
---

The Bndtools Package Explorer is an extension of the [Eclipse Package Explorer][1]. The explorer provides an overview of the projects and their contents. It is extended with a search bar for projects and some extra filters. You an make simple searches or use the [bnd globbing](https://bnd.bndtools.org/chapters/820-instructions.html#glob). That is, you can wildcards (`example*bar`) but also multiple searches in one, for example, `foo|bar` to find multiple projects.

Icons are used extensively to mark the projects in the explorer. They are either used as direct icons for an object (e.g. a bnd.bnd file) or are used to decorate existing icons. For example, if a package is exported or not. The following image shows all icons in their context.
 
 <img src="/images/bndtoolsexplorer.png" alt="Package Explorer" style='width:481px' class="view"/>

Bndtools adds the following icons in the Package Explorer:

|----------------|------------------------------------------------------------------------------------------------|
| ![bnd project file](/images/icons/bnd-project.png) | Contains all the project configuration. The project configuration inherits properties from from `cnf/build.bnd` and any bnd files in `cnf/ext/`|
| ![*.bnd file](/images/icons/bnd-general.png) | A general bnd file. This is either a bnd file in the `cnf` directory to configure the workspace or it can be a sub bundle when in a project. Bndtools contains a special editor for the bnd files. This type of file is generally used in an inheritance hierarchy. |
| ![*.bndrun file](/images/icons/bndrun.png) | Describes a launch configuration. The required bundles can be indicated with _initial requirements_ that the Bndtools resolver can turn into a list of bundles.  An extensive editor is available to edit the launch configuration. A project can contain many bndrun files.|
| ![build.bnd](/images/icons/build-bnd.png) | This is the _master configuration_ file of the workspace. When Bndtools starts, bnd first reads the bnd files in the `cnf/ext/` directory, and then the `cnf/build.bnd` file. Any property or header set in this file is available to any project. There is only one such file in a workspace and it is also used as the _marker_ file for a workspace. |
| ![Bnd Bundle Path](/images/icons/library.png) | `Bnd Bundle Path` – This is an _Eclipse Library container_ for Bndtools. The children of the container are specified in the project's `bnd.bnd` file in the `-buildpath` and `-testpath` instructions. Entries from the `-testpath` are shaded since Eclipse Photon and bnd 4.1.0. The entries are automatically updated when changes are made to the workspace.|
| ![Dependency with attached source](/images/icons/jar-src.png) | A `Bnd Bundle Path` dependency with source code attached. If the icon is darker then it is a test dependency.  |
| ![Dependency](/images/icons/jar.png) | A `Bnd Bundle Path` dependency without source code attached.  If the icon is darker then it is a test dependency. |
| ![Dependency](/images/icons/jar-test.png) | A `Bnd Bundle Path` dependency without source code attached that is only used for test code. |
| ![Component class](/images/icons/java-component.png) | A class that is a DS component. The general icon for a component is an eco friendly  green LED. |
| ![Component package](/images/icons/package-component.png) | A package that contains DS components |
| ![src folder](/images/icons/src-main.png) | The source folder classes that are part of the bundle |
| ![test folder](/images/icons/src-test.png) | The source folder for test code. |
| ![Private package](/images/icons/package-private.png) | A private package in a bundle. This package is included but not exported.|
| ![Exported package](/images/icons/package-exported.png) | An exported package of a bundle. If the package has a version it will also be displayed.|
| ![Excluded package](/images/icons/package-excluded.png) | A package that is **not** included in any bundle. This is rare and not a good practice so it is generally a warning sign.|

If you're looking for other icons, the [Eclipse Help](http://help.eclipse.org/kepler/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Freference%2Fref-icons.htm) shows a further reference of all icons.


[1]: https://help.eclipse.org/photon/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Ftasks%2Ftasks-74.htm