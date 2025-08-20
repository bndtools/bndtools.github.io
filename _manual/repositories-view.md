---
title: Repositories View
description: Shows the repositories and their contents
author: Neil Bartlett
---

<img src="/images/repositories-view.png" style="width:461px" class="view">

Bndtools uses *repositories* to supply dependencies to be used at build-time and at runtime. 

A repository is essentially 

- a collection of bundles
- optionally with some kind of index. 

It may be located anywhere: 
- in the workspace
- somewhere else on the local file system
- or on a remote server.

Bndtools uses repositories in the following ways:

* To look up bundles specified on the Build Path by Bundle Symbolic Name (BSN) and version
* To resolve the Run Requirements list (see [Resolving Dependencies](https://bnd.bndtools.org/chapters/250-resolving.html#resolving-in-bndtools))
* To look up bundles specified in the Run Bundles list by BSN and version

Repositories are implemented as [bnd plug-ins](https://bnd.bndtools.org/chapters/870-plugins.html), and can be configured by editing the Plugins sections of the workspace configuration file (*Bndtools* menu » *Open main bnd config*).
Repostories can be [tagged](https://bnd.bndtools.org/chapters/870-plugins.html#tagging-of-repository-plugins) to control how they are used for resolving dependencies.


![](/images/concepts/repositories01.png)

Since repositories are implemented as plug-ins, it is theoretically possible to support almost any kind of repository, by developing a new plug-in type; though of course it is more convenient to use an existing repository plug-in. Bnd and Bndtools support the following repository types out-of-the-box.

The special repo `bnd-cache` (added in 7.2.0) is a [mini cache repo](https://bnd.bndtools.org/chapters/150-build.html#the-cnfcache-directory) that is expanded in the `cnf` directory to cache some intermediate files and holds e.g. [default plugins for the Project Launcher and Project Tester](https://bnd.bndtools.org/chapters/150-build.html#overriding-the-plugins).

## Indexed Repositories

Bndtools supports a collection of repositories based on an _index_ file that reports the content of the repository along with the capabilities and requirements of each resource listed. There are multiple available formats for the index:

* OBR, named after the _OSGi Bundle Repository_ pseudo-standard. This format is obsolete but still used by some parts of the OSGi ecosystem.
* R5, named after OSGi Release 5 which introduced a true specification for OSGi Repositories. The format of this index is described in the OSGi Release 5 Enterprise specification, section 132.5.
* Other arbitrary formats may be supported by the addition of a `IRepositoryContentProvider` plugin.

The advantage of using indexed repositories is that they can be used for automatic Resolution in the bndrun editor. There are two basic types of indexed repositories:

### Maven Central (MavenBndRepository)

This repository is one of "indexed" repositories, therefore `index` property poits to `central.maven` file that contains `GAV coordinates` to libraries located in Maven Central.

Hint: When this file is empty, the attempt to view the contents of the repository using the Repositories View in Bndtools, it will appear to be empty as well. 

`central.maven` file doesn't fill itself automatically. Think of this repository like an empty `<dependencies>` section in maven.
In order to fill it you need to add [GAVs](https://bnd.bndtools.org/plugins/maven.html#coordinates--terminology) (one per line) to it.

Example:
```
# List repository contents using GAV coordinates
org.apache.camel:camel-core:2.23.1
```

There is also posibility use drag&drop on `pom` file. 
In order to do that:
1. Search maven repository https://mvnrepository.com particular jar
2. Select desired version
3. Click `View All` under `Files` section
4. Locate the main pom file and drag&drop it over `Maven Central` repository in `Repositories` view
This action will fill the file for you.

- [See the configuration properties and examples in the bnd manual](https://bnd.bndtools.org/plugins/maven.html)


### OSGiRepositories / Fixed Index Repositories

**Note! The Fixed Index Repository type is Deprecated and currently extends the OSGiRepository without any additional behavior. It will be removed at some point in the future. Please use the OSGiRepository.**

The OSGiRepository can use index files compatible to the [OSGi Repository Service Specification](https://osgi.org/specification/osgi.cmpn/7.0.0/service.repository.html#i3247820), which is located anywhere, so long as the location can be addressed in the form of a URL. For example the index can be located on the local filesystem and addressed via a `file:` URL, or it can be located on a remote HTTP(s) server. The locations of the actual resources -- i.e. JAR files -- is specified by URLs embedded in the index file itself, and so they can also be either local or remote. In the case of remote index and/or resources, a local cache is used to avoid repeated downloads and to enable offline builds.

A OSGiRepository can not be modified from within bnd or Bndtools.

- [See the configuration properties and examples in the bnd manual](https://bnd.bndtools.org/plugins/osgirepo.html)


### Local Indexed Repository

This repository maintains a local filesystem directory of bundles. The repository is editable from with bnd/Bndtools and the index file is regenerated automatically when bundles are deployed into it.

- [See the configuration properties and examples in the bnd manual](https://bnd.bndtools.org/plugins/localindexrepo.html)


### File Repository

This type of repository is based on a very simple file system directory structure. 

- [See the configuration properties and examples in the bnd manual](https://bnd.bndtools.org/plugins/filerepo.html)

<hr />

## Maven Repositories (Old Style)


**NB. The repository types in this section are deprecated. Please use the Aether Repository type instead. The following documentation is retained for reference purposes only.**

### Maven Local

This type of repository is used to access bundles in the Maven local repository, usually found in `$HOME/.m2/repository`. Note that this plug-in accesses the Maven repository directly and does not building with Maven.

| Name    | Description                                  | Required?                                   |  
|---------|----------------------------------------------|---------------------------------------------|
|`name`   |  Name for the repository.                    | No.                                         |
|`root`   |  The location of the Maven repository.       | No. Default: `$HOME/.m2/repository`         |


Note that if you use the [Bundle Plugin for Maven](https://felix.apache.org/documentation/subprojects/apache-felix-maven-bundle-plugin-bnd.html) then you can also use the OBR repository type, since the Bundle Plugin generates an OBR index file whenever `maven install` is executed. For example:

    aQute.bnd.repository.osgi.OSGiRepository;\
            locations='file:${user.home}/.m2/repository/repository.xml';\
            name='Maven Repo'


### Maven Remote

This type of repository can be used to access bundles in a remote Maven repository, including Maven Central or any Nexus repository. **NB:** this repository type is not browseable; if you attempt to view the contents of the repository using the Repositories View in Bndtools, it will appear to be empty. However it will be possible to reference JARs from the repository in your `-buildpath` or `-runbundles` if the group ID and artefact ID is known.

For example to reference a JAR with group ID `org.osgi` and artefact ID `osgi_R4_core`, use the following syntax:

	-buildpath: org.osgi+osgi_R4_core

| Name    | Description                                  | Required?                                   |  
|---------|----------------------------------------------|---------------------------------------------|
|`repositories` | Comma-separated list of Maven repository URLs.  | No. Default: empty | 
|               | **NB:** surround this value with | |
|               | single-quotes if it contains more than one | |
|               |entry. | |


