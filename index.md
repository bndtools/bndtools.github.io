---
---

<div class="hero panel radius">
    <h1><img src="images/swirl-128.png" alt="Logo" class="logo"> Bndtools</h1>
    <p>The easy, powerful, and productive way to develop with OSGi. Based on <a href="https://bnd.bndtools.org">bnd</a> and <a href="www.eclipse.org">Eclipse</a>.</p>
    <p><a class="button small" href="installation.html">Install now &raquo;</a></p>
</div>

<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Import Analysis</h2>
        <p>Unlike tools that require package dependency information to be maintained manually, Bndtools uses bytecode analysis to accurately calculate the dependencies of your OSGi bundles.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/images/about01.png"/>
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
        <h2>OSGi Annotations Support</h2>
        <p>Bndtools has extensive support for the OSGi Declarative Services, Manifest, and Metatype annotations. Not only does it automatically build the required XML, it also provides excellent feedback when used in the wrong way. </p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/ds.png" align="right"/>
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
        <p>Bndtools uses the OSGi Resolver standard to resolve runtime depedencies, allowing us to concentrate on just the "top-level" bundles that comprise our application.</p>
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
        <p>Bndtools incorporates an integrated test runner for OSGi that launches an OSGi framework containing a selection of bundles, executes the test cases declared in those bundles, and shuts down OSGi. The whole process takes mere milliseconds and results are reported in the standard Eclipse JUnit view.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/ci.png" align="right"/>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Baselining</h2>
        <p>Bndtools has a unique feature, not found in any other IDE, that it compares your API code _continuously with a previous release according to semantic version rules. The moment you make a change that would not be compatible with the package version, you get an error on both the version and the violating code. For example, if you add a method to an interface, that is in an API package, you immediately see this method marked red.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/baselining-add-interface.png" align="right"/>
    </div>
</div>

<hr/>
<div class="row">
    <div class="large-7 medium-6 small-6 columns">
        <h2>Continuous Integration</h2>
        <p>Every Bndtools workspace automatically includes a Gradle based <em>continuous integration</em> (CI) build. Since the gradle build uses the bnd information, there is no need to learn gradle. The CI build will create identical artifacts at, for example,  Github Actions. The CI can release to Maven repositories and create p2 repositories.</p>
    </div>
    <div class="large-5 medium-6 small-6 columns">
        <img src="/assets/img/ci.png" align="right"/>
    </div>
</div>
<hr/>

<div class="row panel">
    <div class="large-12 medium-12 small-12 columns">
        <h3>Licence</h3>
        <p>Bndtools is Open Source Software, distributed under the terms of the <a class="external" href="http://www.eclipse.org/legal/epl-v10.html">Eclipse Public Licence</a>.</p>
    </div>
</div>
