---
---


# Install Bndtools 4.0.0

You can install Bndtools via the [Marketplace] or directly install from the [Update Site]

## Enhancements

* Bndtools now requires Java 8 as the base Java runtime.
* Added `bndtools.pde` plugin and feature for plugin development using Bndtools.
* Fixed more file locking issues on Windows.  See [#1682](https://github.com/bndtools/bndtools/issues/1682#issuecomment-332876452) for known issues with other Eclipse plugins locking files on Windows.
* Builder will update Bnd class path container when bnd file changes.

For Bnd 4.0.0 changes, see [https://github.com/bndtools/bnd/wiki/Changes-in-4.0.0](https://github.com/bndtools/bnd/wiki/Changes-in-4.0.0).

## Known Issues

* Removed support for bnd Component annotations. For OSGi enRoute users this can create an error on the `Service-Component` header in the `cnf/ext/enroute.bnd` file. Just remove this header. (This will be better handled in 4.1.0)
* Removed `aQute.bnd.deployer.repository.FixedIndexedRepo`. This can be replaced with `aQute.bnd.repository.osgi.OSGiRepository`.  (This will be better handled in 4.1.0)

## Marketplace

The recommended way to install Bndtools via the [Eclipse Marketplace](https://marketplace.eclipse.org/content/bndtools).

<a href="http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=1220" class="drag" title="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client"><img typeof="foaf:Image" class="img-responsive" src="https://marketplace.eclipse.org/sites/all/themes/solstice/public/images/marketplace/btn-install.png" alt="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client" /></a>


## Update Site

* From the Help menu select `Install New Software...` 
* When the dialog opens, click the `Add...` button near the top-right.
* In the Name field enter `Bndtools`. In the Location field enter one of the the following URLs
  * The latest stable release –  [https://dl.bintray.com/bndtools/bndtools/latest/](https://dl.bintray.com/bndtools/bndtools/latest/)
  * The development snapshot – [https://bndtools.ci.cloudbees.com/job/bndtools.master/lastSuccessfulBuild/artifact/build/generated/p2/](https://bndtools.ci.cloudbees.com/job/bndtools.master/lastSuccessfulBuild/artifact/build/generated/p2/)
  * Other releases – See the Build history of [https://bndtools.ci.cloudbees.com/job/bndtools.master/](https://bndtools.ci.cloudbees.com/job/bndtools.master/)
* Press `Next` and then `Finish`, acknowledging the licenses

![Install from Update Site](https://media.giphy.com/media/3Fd626YjfdFpPnLmug/giphy.gif)

