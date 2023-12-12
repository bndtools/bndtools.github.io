---
title: Resolution View
description: Provides insight into the requirements and capabilities of the selected bundle
---

<img src="/images/resolution-view.png" style="width:750px" class="view">

The Resolution View is a powerful tool to analyse the requirements and capabilities of bundles and their dependencies. This shows the **requirements and capabilities** side by side of one or multiple selected resources such as JAR file(s), a `bnd.bnd` file or entries in the Repository Browser (bundles in a repository or repositories).

Especially when it comes to resolution issues (e.g. required package cannot be satisfied by another bundle) this is the tool to **make resolution issues visible**.

## Example

By selecting a bundle **A** and a repository **R** in the [Repository View](/manual/repositories-view.html), it allows you to see the aggregated **Requirements and Capabilities** of both. In other words it shows you:

* all **requirements** (most commonly packages) the bundle **A** and all bundles in the repository **R** require
* and all **capabilities** the bundle **A** and all bundles in the repository **R** provide

If there is a _requirement_ for which _no other_ bundle provides a _capability_, then the Resolve would fail - and you can **make it visible** in the resolution view.

This makes it a valueable tool used after a failed resolution (see the *Resolve* button in the [.bnd / .bndrun editor](/manual/bndeditor.html#run)) and its (sometimes cryptic) error message.


## Features

* Search filter for Requirements and Capabilities allowing wildcards and multiple search terms
* Filter toggle to hide optional requirements
* Filter toggle to detect (problematic) capabilities which are exported by multiple bundles but with different package content (split package problem)
* Copy to clipboard via `Ctrl / Cmd + C` for Requirements and Capabilities which copies their tooltip contents. This helps during debugging and communicating with others about it.
* Double Clicking on an entry of the ResolutionsView (Requirements and Capabilities) opens the _Advanced Search_ of _Repository Browser_ in the "Other" tab and prefills the fields for namespace and filter
* Drag&Drop of selected Requirements in other panels e.g. to drag&drop selected entries to the _Customize imports_ panel of the .bnd-editor

## More information

Background information can also be found in the manual at [Resolving Dependencies](https://bnd.bndtools.org/chapters/250-resolving.html).
