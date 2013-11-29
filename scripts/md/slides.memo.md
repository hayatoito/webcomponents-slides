title: Creating Web Components

<pre class="prettyprint" data-lang="html">
&lt;template id="template"&gt;
  &lt;style&gt;input { color: orange; }&lt;/style&gt;
  &lt;input type="text"&gt;
&lt;/template&gt;

&lt;script&gt;
var proto = Object.create(HTMLElement.prototype, {
  createdCallback: {
    value: function() {
      var t = document.querySelector('#template');
      this.createShadowRoot().appendChild(t.content.cloneNode(true));
    }
  }
});

var MyInput = document.register('my-input', {prototype: proto});
&lt;/script&gt;

</pre>

---
