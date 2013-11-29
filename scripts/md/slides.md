title: about:me
id: who

<p>Hayato Ito</p>
<p>Software Engineer, <img src="images/logos/google_logo.png" style="height: 30px;margin: 0;vertical-align:-8px;"> <img src="images/logos/chrome_logo.png" style="height:27px;margin:0;vertical-align:-3px;"></p>

<p class="topmargin"></p>

<i class="icon icon-inbox"></i>
<a rel="author" href="mailto:hayato@google.com">hayato@google.com</a>

<i class="icon icon-google-plus"></i>
<a rel="author" href="http://google.com/+HayatoIto">google.com/+HayatoIto</a>

<i class="icon icon-github"></i>
<a rel="author" href="http://github.com/hayatoito">github.com/hayatoito</a>

<i class="icon icon-twitter"></i>
<a rel="author" href="http://twitter.com/shadow_hayato">@shadow_hayato</a>  (as a Shadow DOM spec editor)

---

class: large
content_class: flexbox vcenter centered

<h2>Web Components?</h2>

---

title: select component

<select style="zoom: 2; border-width: 0.5px">
  <option>Small</option>
  <option>Medium</option>
  <option>Large</option>
</select>

<pre class="prettyprint" data-lang="html">
  &lt;select&gt;
    &lt;option&gt;Small&lt;/option&gt;
    &lt;option&gt;Medium&lt;/option&gt;
    &lt;option&gt;Large&lt;/option&gt;
  &lt;/select>
</pre>

---

title: tab component

<img src="images/trees/tabs.png" />

---

id: tab-examples
title: Building a tab component

<div class="build flexbox vcenter centered">
<img src="images/screenshots/tabs/jquery.png">
<img src="images/screenshots/tabs/yui.png">
<img src="images/screenshots/tabs/angular.png">
<img src="images/screenshots/tabs/kendo.png">
<img src="images/screenshots/tabs/sencha.png">
<img src=""> <!-- intentional. holder to see all images together -->
</div>

---

title: div, div, div...
class: nobackdrop
content_class: flexbox vcenter centered
body_class: elements-bg

<img src="images/screenshots/gmail.png" height="500px"/>

---

title: tab component

<img src="images/trees/tabs.png" />

<pre class="prettyprint" data-lang="HTML">
  &lt;my-tabs&gt;
    &lt;my-tab selected&gt;...&lt;/my-tab&gt;
    &lt;my-tab&gt;...&lt;/my-tab&gt;
    &lt;my-tab&gt;...&lt;/my-tab>
  &lt;/my-tabs>
</pre>

---

title: tab component

<img src="images/trees/tabs.png" />

<pre class="prettyprint" data-lang="JavaScript">
  var tabs = document.createElement('my-tabs');
  var tab1 = document.createElement('my-tab');
  var tab2 = document.createElement('my-tab');
  var tab3 = document.createElement('my-tab');
  tabs.appendChild(tab1);
  tabs.appendChild(tab2);
  tabs.appendChild(tab3);
  tab1.setAttribute('selected', true);
</pre>

---

class: large
content_class: flexbox vcenter centered

<h2>Web Components</h2>

---

title: Building blocks of Web Components
build_lists: true

- [Shadow DOM](http://w3c.github.io/webcomponents/spec/shadow/)
    - DOM &amp; style <span class="bold">encapsulation</span>
- [Custom Elements](http://w3c.github.io/webcomponents/spec/custom/)
    - Create <span class="bold">new</span> HTML elements, <span class="bold">extend</span> existing DOM objects
- [HTML Imports](http://w3c.github.io/webcomponents/spec/imports/)
    -  <span class="bold">Package</span> and <span class="bold">Share</span> HTML/CSS/JS.

---

title: Mixing Components

<pre class="prettyprint" data-lang="HTML">
&lt;html&gt;
  ...
  &lt;body&gt;
    &lt;my-component&gt;
      &lt;style&gt; div { color: <span class="platform">blue</span>; }&lt;/style&gt;
      ...
    &lt;/my-component>
     ...
    &lt;your-component&gt;
      &lt;style&gt; div { color: <span class="platform">red</span> !important; }&lt;/style&gt;
      ...
    &lt;/your-component>
  &lt;/body&gt;
&lt;/html>
</pre>

---

title: DOM - Everything is Flat

<span class="pull-right"><img src="images/trees/dom.svg" style="height:500px"></span>

- `#id`, `.class`
- getElementById()
- getElementsByClassName()
- CSS Style

---

title: JavaScript - a Function as a Scope

<pre class="prettyprint" data-lang="JavaScript">
  var foo = 'hello';

  function world() {
    var foo= 'world';
    console.log(foo);
  }

  world(); // (1)
  console.log(foo);   // (2)
</pre>

---

class: large
content_class: flexbox vcenter centered

<h2>Encapsulate DOM</h2>

---

title: Shadow DOM re-defines Elements
content_class: quote

<blockquote style="margin-top: 100px">
  Any element can have an associated ordered list of zero or more node trees.
</blockquote>

<p style="padding-top: 30px; zoom: 0.8">
  From Shadow DOM Specification - <a href="http://w3c.github.io/webcomponents/spec/shadow/#concepts">http://w3c.github.io/webcomponents/spec/shadow/#concepts</a>
</p>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/tree-of-trees-1.svg" height="550px">

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/tree-of-trees-2.svg" height="550px">

---

class: large nobackground yum
content_class: flexbox vcenter centered

<h2>Shadow Trees</h2>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/tree-of-trees-3.svg" height="550px">

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/tree-of-trees-4.svg" height="550px">

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<h2 style="font-size:100px">Tree of Trees</h2>

---

title: Tree of Trees
content_class: flexbox vcenter centered

<img src="images/trees/tree-of-trees-4.svg" height="420px" style="padding-left: 20px; padding-top: 40px">

---

title: Composed Tree
content_class: flexbox vcenter centered

<img src="images/trees/composed-tree.svg" height="550px">

---

title: &lt;video&gt;


<pre class="prettyprint" data-lang="HTML">
  &lt;video controls&gt;
     &lt;source src=".../Chrome_ImF.mp4" /&gt;
  &lt;/video>
</pre>

<video controls>
   <source src="./images/trees/Chrome_ImF.mp4" />
</video>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/video-1.svg">

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<img src="images/trees/video-2.svg">


---

id: shadow-dom-creating
title: Creating Shadow DOM

<pre class="prettyprint" data-lang="DOM Tree">
&lt;div id="host">
  &lt;h1>My Title&lt;/h1>
&lt;/div>
</pre>

<pre class="prettyprint" data-lang="JavaScript" style="clear:both">
var host = document.querySelector('#host');
<b>var shadow = host.<a data-tooltip-property="createShadowRoot" data-tooltip-support='["webkit"]' data-tooltip-js>createShadowRoot</a>();</b>
<b>shadow.innerHTML = '&lt;h1>You got replaced!&lt;/h1>';</b>
</pre>

<pre class="prettyprint" data-lang="Composed tree">
&lt;div id="host">
    &lt;h1>You got replaced!&lt;/h1>
&lt;/div>
</pre>

---

title: Shadow DOM: Insertion points

<pre class="prettyprint" data-lang="DOM Tree (Light)">
&lt;div id="host"&gt;
  &lt;h1 class="title"&gt;My Title&lt;/h1&gt;
  &lt;div&gt;...amazing description...&lt;/div&gt;
&lt;/div&gt;
</pre>

<pre class="prettyprint" data-lang="Shadow Tree">
<b>&lt;content select=".title">&lt;/content&gt;</b>
&lt;div&gt;You got enhanced&lt;/div&gt;
<b>&lt;content select="div">&lt;/content&gt;</b>
</pre>

<pre class="prettyprint" data-lang="Composed Tree" style="-webkit-column-break-before: always;">
&lt;h1 class="title"&gt;My Title&lt;/h1&gt;
&lt;div&gt;You got enhanced&lt;/div&gt;
&lt;div&gt;...amazing description...&lt;/div&gt;
</b>
</pre>
</div>

---
id: shadow-dom-visualizer
title: Shadow DOM Visualizer
#content_class: flexbox vcenter centered

<iframe data-src="http://html5-demos.appspot.com/static/shadowdom-visualizer/index.html#body" style="border:none;height:450px;background: rgba(0, 0, 0, 0);"></iframe>

<p class="centered">
<a href="http://html5-demos.appspot.com/shadowdom-visualizer">html5-demos.com/shadowdom-visualizer</a>
</p>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<h2>Custom Elements</h2>


---
title: Creating Custom Elements

<pre class="prettyprint" data-lang="JavaScript">
var XFooProto = <b>Object.create(HTMLElement.prototype)</b>;

// Setup optional lifecycle callbacks: ready, inserted, removed.
XFooProto.readyCallback = function() {
  this.textContent = "I'm an x-foo!";
};

// Define its JS API.
XFooProto.foo = function() { alert('foo() called'); };

<b>var XFoo = document.<a data-tooltip-property="register" data-tooltip-support='["webkit"]' data-tooltip-js>register</a>('x-foo', {prototype: XFooProto});</b>
//var xFoo = new XFoo();
//var xFoo = document.createElement('x-foo');
</pre>

---

title: Using a Custom Element

<div class="build">
<div>
  <p>By declaring it</p>
<pre class="prettyprint" data-lang="HTML">
&lt;x-foo>&lt;/x-foo>
</pre>
</div>
<div>
  <p>By creating DOM in JavaScript</p>
<pre class="prettyprint" data-lang="JavaScript">
var elem = document.createElement('x-foo');
elem.addEventListener('click', function(e) {
  <b>e.target.foo();</b> // alert 'foo() called'.
});
</pre>
</div>
<div>
<p>By using <code>new</code></p>
<pre class="prettyprint" data-lang="JavaScript">
var elem = <b>new XFoo()</b>;
document.body.appendChild(elem);
</pre>
</div>

</div>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<h2>HTML Imports</h2>

---

title: HTML Imports

<pre class="prettyprint" data-lang="HTML">
&lt;html&gt;
  &lt;head&gt;
    <b>&lt;link rel=&quot;import&quot; href=&quot;x-foo.html&quot;&gt;</b>
  &lt;/head&gt;
  &lt;body&gt;
    <b>&lt;x-foo&gt;&lt;/x-foo&gt;</b> &lt;!-- Element definition is in x-foo.html --&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

---

title: Reusing other components

<pre class="prettyprint" data-lang="awesome-menu.html">
<b>&lt;link rel="import" href="x-toolbar.html">
&lt;link rel="import" href="menu-item.html"></b>
// Define <b>awesome-menu</b> using x-toolbar and menu-item.
  ...
  &lt;template>
    <b>&lt;x-toolbar responsive="true">
      &lt;menu-item src="images/do.png" selected>Do&lt;/menu-item>
      &lt;menu-item src="images/re.png">Re&lt;/menu-item>
      &lt;menu-item src="images/mi.png">Mi&lt;/menu-item>
    &lt;x-toolbar></b>
  &lt;/template>
  ...
</pre>

<pre class="prettyprint" data-lang="app.html">
&lt;link rel="import" href="awesome-menu.html">
&lt;awesome-menu>&lt;/awesome-menu>
</pre>

---

class: nobackdrop nobackground yum
content_class: flexbox vcenter centered

<h2><img src="images/polymer/polymer-p.png" style="height:90px;box-shadow:none;margin-right:10px;">Polymer</h2><br>
<h3><a href="http://polymer-project.org">polymer-project.org</a></h3>

---

title: Polymer
build_lists: true

<span class="pull-right"><img src="images/polymer/architecture-diagram.png" style="height:550px"></span>

- <span class="elements">Elements</span>

- <span class="core">Core</span>

- <span class="platform">Polyfill</span>

---

class: large nobackground yum
content_class: flexbox vcenter centered

<h2>Everything is an element</h2>

---

id: polymer-flex-demo
title: Everything is an element
subtitle: flexbox layout...using DOM
body_class: elements-bg

<pre class="prettyprint" data-lang="HTML">
&lt;polymer-flex-layout <b data-action="vertical">vertical</b> <b>iscontainer</b>>
  &lt;div>Header&lt;/div>
  &lt;div <b data-action="flex">flex</b>>Body&lt;/div>
  &lt;div>Footer&lt;/div>
&lt;/polymer-flex-layout>
</pre>


<div class="component-demo" style="height:100%">
  <polymer-flex-layout>
    <div class="flex-demo">Header</div>
    <div class="flex-demo"style="height:100px">Body</div>
    <div class="flex-demo">Footer</div>
  </polymer-flex-layout>
</div>

---
title: Polymer elements
subtitle: non-visual utility elements
body_class: elements-bg
content_class: columns-2

<span class="bold blue">Layout</span>

`<polymer-layout>`

`<polymer-flex-layout>`

`<polymer-grid-layout>`

<span class="bold blue">View</span>

`<polymer-media-query>`

`<polymer-page>`

<span class="bold blue">Services / libs</span>

`<polymer-shared-lib>`

<span class="bold blue">Data</span>

`<polymer-localstorage>`

`<polymer-xhr>`

`<polymer-jsonp>`

`<polymer-file>`

`<polymer-meta>`

<span class="bold blue">Behavior / interaction</span>

`<polymer-signals>`

`<polymer-selector>`

---

id: polymer-ui-elements
title: Polymer UI elements
subtitle: visual elements
body_class: elements-bg

<div class="pull-right flexbox vcenter" style="width: 40%;margin-top:-100px;">
  <img src="images/polymer/uielements/polymer-ui-tabs.png" style="width:100%">
  <div class="flexbox vcenter" style="height:auto;">
  <img src="images/polymer/uielements/sidebarmenu.png">
  <img src="images/polymer/uielements/polymer-ui-toggle-button.png" style="margin-left:20px;">
  </div>
  <img src="images/polymer/uielements/toolbar.png" style="width:100%">
</div>

`<polymer-ui-accordion>`

`<polymer-ui-animated-pages>`

`<polymer-ui-overlay>`

`<polymer-ui-card>` [demo](http://www.polymer-project.org/polymer-all/polymer-ui-elements/polymer-ui-card/index.html)

`<polymer-ui-sidebar-menu>` [demo](http://www.polymer-project.org/polymer-all/polymer-ui-elements/polymer-ui-sidebar-menu/index.html)

`<polymer-ui-tabs>` [demo](http://www.polymer-project.org/polymer-all/polymer-ui-elements/polymer-ui-tabs/index.html)

`<polymer-ui-toggle-button>` [demo](http://www.polymer-project.org/polymer-all/polymer-ui-elements/polymer-ui-toggle-button/index.html)

`<polymer-ui-theme-aware>`

...

---

title: Create Web Components with Polymer.
body_class: core-bg

1. Create

    <pre class="prettyprint" data-lang="HTML">
    &lt;polymer-element <b>name="my-input"</b> <b>constructor="MyInput"</b> <b data-tooltip="Simple elements that don't call Polymer()">noscript</b>>
      &lt;!-- Note: Polymer creates Shadow DOM from the first &lt;template>. -->
      <b>&lt;template>
        &lt;style>input { color: orange; }&lt;/style>
        &lt;input type="text">
      &lt;/template></b>
    &lt;/polymer-element>
    </pre>

- Use

    <pre class="prettyprint" data-lang="HTML">
        &lt;my-input&gt;&lt;/my-input&gt;
    </pre>

    <pre class="prettyprint" data-lang="JavaScript">
        var myInput = document.createElement('my-input');
        // var myInput = new MyInput();
    </pre>

---

title: Real-world examples
class: nobackdrop
content_class: flexbox vcenter centered
body_class: elements-bg

<h2 style="margin-top:-100px;"><a href="http://www.chromestatus.com/features">chromestatus.com/features</a></h2>

---

title: A Collection of Custome Elements
class: nobackdrop
content_class: flexbox vcenter centered
body_class: elements-bg

<h2 style="margin-top:-100px;"><a href="http://customelements.io/">customelements.io</a></h2>

---

title: Polymer Sandbox
class: nobackdrop
content_class: flexbox vcenter centered
body_class: elements-bg

<h2 style="margin-top:-100px;"><a href="http://www.polymer-project.org/tools/sandbox/">www.polymer-project.org/tools/sandbox/</a></h2>

---

title: Web Apps: A Collection of Web Components

<pre class="prettyprint" data-lang="HTML">
&lt;html&gt;
  &lt;head&gt;
     &lt;link rel="import" href="gmail-app.html"&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;google-header&gt;&lt;/google-header&gt;
    &lt;gmail-app&gt;
      &lt;google-hangout&gt;&lt;/google-hangout&gt;
      &lt;google-mail&gt;&lt;/google-mail&gt;
    &lt;/gmail-app&gt;
  &lt;/body&gt;
&lt;/html>
</pre>

---

title: Resources

- Web Components Resources - <a href="http://ebidel.github.io/webcomponents/">ebidel.github.io/webcomponents/</a>

- Shadow DOM - <a href="http://github.io/w3c/webcomponents/specs/shadow/">github.io/w3c/webcomponents/specs/shadow/</a>

- Polymer - <a href="http://www.polymer-project.org">www.polymer-project.org</a>

- Me - Ask <a href="http://twitter.com/shadow_hayato">@shadow_hayato</a>
