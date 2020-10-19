---
layout: post
title: Github Packages as Maven Repo
description: Github provides a feature called packages that support the maven repository model. This text shows you how to release to this package.
comments: true
author: Peter Kriens
---

![packages](/assets/img/packages-cutoff.jpg)

I recently had to setup a maven like repository for a client. Of course there are the standard 
hosted solutions with JFrog and Sonatype. These solutions work very well and both companies are
very profession. However, managing the credentials is always tricky when you have different 
hosting domains. Since we were already using Github it is always simpler and more secure if you can use one
security domain.

It turns out that Github provides a concept called _packages_. Packages provide storage space for 
dependencies. One of the type of packages that are supported is maven. I tried it out and it
seems to work very well with bndtools.

## Repository Setup

The Githun Maven package URL has the following structure:

  https://maven.pkg.github.com/<userid|organization>/<repository>

Let's define a macro in `cnf/build.bnd` to not get caught in spelling errors:

  releaserepo = https://maven.pkg.github.com/Bndtools/bnd

You need to create a repository. This is a Maven Bnd Repository. I recently added a 'Insert Plugin'
menu entry in Bndtools when you're in a bnd file. You can use this to insert a Maven Bnd Repository
in the `cnf/build.bnd` file.

    -plugin: \
        ... existing plugins
        aQute.bnd.repository.maven.provider.MavenBndRepository;\
            snapshotUrl         ='${releaserepo}';\
            releaseUrl          ='${releaserepo}';\
            noupdateOnRelease   =true;\
            name                =Github   

We need to provide bnd with the userid and password. Since we want to prepare this build for
a CI build, we use environment variables to parameterize them. Again in the `build.bnd`:

    pwd = ${env;REPOSITORY_PASSWORD;}
    usr = ${env;REPOSITORY_USERNAME;}

We then need to setup the credentials for the communication:

  -connection-settings: \
      ${if;${pwd};server;-dummy};id='${releaserepo}';username=${usr};password=${pwd}, \
      -bnd

The last thing remaining in the `cnf/build.bnd` file is to tell bnd what the release repo is:

  -releaserepo: Github

## Releasing

To authenticate you need to create a Github token. You can create such a token at the 
[Personal access tokens][1] page. 
You need to create a personal token that can `write packages`. This personal token is the password, 
the user id is your Github user id. The token is only shown to you once. (On the Mac, you can store
them as a Note in your Keychain.) Before you run the Gradle build, you can set the credentials:

  $ export REPOSITORY_USERNAME=<github username>
  $ export REPOSITORY_PASSWORD=<github access token to write packages>

You can now test the releasing from command line:

  $ ./gradlew release

Some remaining notes:

* You can also [place the credentials][3] in `.m2/settings.xml` or `.bnd/settings.xml` but a release should
  always be done from the CI server to make sure it does not depend on the local system. This makes the 
  environment variables more useful. 
* On Github Actions you can [define secrets][2] and then in the workflow assign them to environment variables.
* Instead of definining everything in the `cnf/build.bnd` file you can also define it in a new file
  in the `cnf/ext` directory. If you do this, make sure to put a suffix on the `-plugin` to make it
  unique, otherwise it likely gets overwritten in another file that defines plugins. For example,
  name it `-plugin.github`. All files in the `cnf/ext` directory are parsed included before the
  `cnf/build.bnd` file.



[1]: https://github.com/settings/tokens/new
[2]: https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets
[3]: https://bnd.bndtools.org/instructions/connection-settings.html
