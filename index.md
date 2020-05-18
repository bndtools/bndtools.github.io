---
---

<div class="hero panel radius">
    <h1><img src="images/swirl-128.png" alt="Logo" class="logo"> Bndtools</h1>
    <p>The easy, powerful, and productive way to develop with OSGi. Based on <a href="https://bnd.bndtools.org">bnd</a> and <a href="www.eclipse.org">Eclipse</a>.</p>
    <p><a class="button small" href="installation.html">Install now &raquo;</a></p>
</div>

<div class="row">
    <div class="large-12 medium-12 small-12 columns">
    <h2>News</h2>
    <ul>
    {% for page in site.posts limit:4 %}
        <li><a class="item" onclick="location.href='{{page.url}}'">{{page.title}}</a> – {{page.description}}</li>
    {% endfor %}
    </ul>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
    <h1>Features</h1>
    </div>
</div>
<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Instant Builder</h2>
        <p>Eclipse automatically compiles your Java source code whenever you save &mdash; this is &ldquo;The Eclipse Way&rdquo;. Bndtools goes one step further and automatically assembles your bundles whenever the inputs to it are changed. As a result, your bundles are always up to date with the latest code, and ready to run!</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about04.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Automatic Manifest</h2>
        <p>Unlike PDE that require package dependency information to be maintained manually, Bndtools uses bytecode analysis to accurately calculate the dependencies of your OSGi bundles, automatically handling (semantic) versions. Additionally, many OSGi aspects are verified on the fly. With Bndtools, the manifest just works.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about01.png"/>
    </div>
</div>

<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>OSGi Annotations Support</h2>
        <p>Bndtools has extensive support for the OSGi Declarative Services, Manifest, and Metatype annotations. Not only does it automatically build the required XML, it also provides excellent <em>direct</em> feedback when the annotations are used in the wrong way.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/ds.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Viewers &amp; Editors</h2>
        <p>Bndtools adds a number of additional decorators and visualizers to Eclipse that are optimized for OSGi. For example, a package shows if it is included and if it is exported. A class is marked if it is an OSGi Component. A special JAR editor provides detailed information into bundles and normal JARS, both graphically and textual. A bnd editor provides graphic &amp; source access to the bnd files. The GUI access to start with, the text editor when your build grows. As they always do. A resolution viewer shows for any selected bundle what its capabilities &amp; requirements are. And more important, which class is the referrer.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/resolution.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Macros Everywhere</h2>
        <p>Unlike PDE, bnd stores all build information <em>declaratively</em>, in easy to read plain Java property files called <em>bnd</em> files. These property files are put in an inheritance chain so that there is always one place to define shared information, preventing redundancy. A very powerful macro processor can combine and filter properties so that bug inciting redundancy is further reduced. Hundreds of built-in functions provide very detailed access to the bnd build model, the output JARs, the repositories, environment variables, and can even call system commands.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/macros.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Repositories</h2>
        <p>Bndtools features a pluggable repository model for bundles, that may be referenced at build-time and also used to satisfy runtime dependencies. Repository plug-ins exist for OSGi, P2,  and Maven/Nexus.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about02.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Requirement Resolving</h2>
        <p>Bndtools uses the OSGi Resolver  to create runtime <em>assemblies</em>, allowing us to concentrate on just the "top-level" bundles that comprise our application. The remaining bundles are resolved from the repositories automatically. No more wasting time trying the right combination by trying.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about03.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Dynamic Debugging</h2>
        <p>The instant builder will keep all artifacts build at all times. When you launch an application from Bndtools, it will extend this dynamism to the launched runtime. Any bundle that changes in Eclipse, will be updated in the runtime dynamically. This gives Bndtools a very light weight feeling while still providing all the software engineering from Java.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/debug.png" align="right"/>
    </div>
</div>

<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Integrated Testing</h2>
        <p>Besides standard JUnit, Bndtools incorporates an integrated test runner for OSGi that launches an OSGi framework containing an automatic assembly of bundles, executes the test cases declared in those bundles, and shuts down OSGi. The whole process takes mere milliseconds and results are reported in the standard Eclipse JUnit view.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about06.png" align="right"/>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Releasing</h2>
        <p>Bndtools, by being based on bnd, can release the workspace in a number of ways: </p>
        <ul>
        <li>Upload to Maven/Artifactory repositories, both snapshots & released version</li>
        <li>Generate  <em>executable</em> JARs that contain all dependencies</li>
        <li>Generate a set of bundles containing all dependencies</li>
        <li>Create a P2 repository, we are eating our own dog food!</li>
        </ul>
        <p>Releases can happen manually from the IDE or better, they can be automated in the CI build.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about05.png" align="right"/>
    </div>
</div>

<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Baselining</h2>
        <p>Bndtools has a unique feature, not found in any other IDE, that it compares your API code <em>continuously</em> with a previous release according to semantic version rules. The moment you make a change that would not be compatible with the package version, you get an error on both the version and the violating code. For example, if you add a method to an interface, that is in an API package, you immediately see this method marked red.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/baselining-add-interface.png" align="right"/>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Continuous Integration</h2>
        <p>Every Bndtools workspace automatically includes a Gradle based <em>continuous integration</em> (CI) build. Since the gradle build uses the bnd information, there is no need to learn gradle. The CI build will create identical artifacts at, for example,  Github Actions. The CI can release to Maven repositories, create p2 repositories, or anything else you need. </p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/ci.png" align="right"/>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>LARGE WORKSPACES</h2>
        <p>Bndtools uses the bnd workspace concept. Although Bndtools fanatically tries to follow the Eclipse paradigm, always built all artifacts, it wen out of its way to make this fast enough to supports hundreds of projects in a workspace, some companies even have up to a thousand projects in a workspace.  To help navigating these workspace, the Bndtools explorer provide a very lightway to quickly filter the projects by name or status. Having all projects for a product a single workspace does wonders for productivity and product quality, experience shows. </p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/bndtools-explorer2.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Built on Eclipse</h2>
        <p>Bndtools is a <em>plugin/bundle</em> for Eclipse. This means we inherit all the wonderful tooling from Eclipse. Bndtools goes out of its way to integrate deeply, supporting many extension points. <a href="https://www.jetbrains.com/idea/">Intellij</a> is supported with the <a href="https://plugins.jetbrains.com/plugin/1816-osgi">OSMORC plugin</a>, maintained by IDEA.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/eclipse_builton.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row panel">
    <div class="large-12 medium-12 small-12 columns">
        <h3>Licence</h3>
        <p>Bndtools is Open Source Software, distributed under the terms of the <a class="external" href="http://www.eclipse.org/legal/epl-v10.html">Eclipse Public Licence</a>.</p>
    </div>
</div>
