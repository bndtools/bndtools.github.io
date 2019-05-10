---
---


# Install Bndtools 4.2.0

You can install Bndtools via the [Marketplace](#marketplace) or directly install from the [Update Site](#update-site)

## Enhancements

* On Eclipse Photon or later, Bndtools 4.2 will now configure classpath container items from the `-testpath`
as **Visible only for test sources** and **Without test code**, which is now supported by Eclipse Photon, 
when at least one source folder in the project is marked as **Contains test sources**. 
See <http://www.eclipse.org/photon/noteworthy/index.php#java-views-and-dialogs>.

For Bnd 4.2.0 changes, see <https://github.com/bndtools/bnd/wiki/Changes-in-4.2.0>.

## Known Issues

* None at this time.

## Marketplace

The recommended way to install Bndtools via the [Eclipse Marketplace](https://marketplace.eclipse.org/content/bndtools).

<a href="http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=1220" class="drag" title="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client"><img typeof="foaf:Image" class="img-responsive" src="https://marketplace.eclipse.org/sites/all/themes/solstice/public/images/marketplace/btn-install.png" alt="Drag to your running Eclipse* workspace. *Requires Eclipse Marketplace Client" /></a>


## Update Site

* From the Help menu select `Install New Software...` 
* When the dialog opens, click the `Add...` button near the top-right.
* In the Name field enter `Bndtools`. In the Location field enter one of the the following URLs
  * The latest stable release – <https://dl.bintray.com/bndtools/bndtools/latest/>
  * The development snapshot – <https://bndtools.jfrog.io/bndtools/update>
  * Other releases – See the available versions at <https://dl.bintray.com/bndtools/bndtools/>
* Press `Next` and then `Finish`, acknowledging the licenses

![Install from Update Site](https://media.giphy.com/media/3Fd626YjfdFpPnLmug/giphy.gif)

