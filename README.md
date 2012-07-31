WebGL Extensioneer
==================

The purpose of this library is to make it easier to work with WebGL extensions. It has two features:

* Get extensions without having to specify a vendor prefix
* Optionally specify an extension requirement 

Usage
-----

Include the library in your page.

```html
<script src="webgl-extensioneer.js"></script>
```

Use extensions as before


```javascript
    var fptex = gl.getExtension('OES_texture_float'); //will be present
    var anisotropic = gl.getExtension('EXT_texture_filter_anisotropic'); //will likely be null
```

Also get draft extensions

```javascript
    var anisotropic = gl.getExtension('EXT_texture_filter_anisotropic', {draft:true});
```

API
---

* getExtension(name, [specification])
* specification: object

Specification defaults to

* draft: false
* approved: true
* ref: 'browser' or 'spec', defaults to 'browser', if you set it to 'spec' you will need to regularly update your copy of the library.

The test performed is to only return extensions if they match the specification (i.e. setting approved to false will not return approved extensions)

License
-------

Copyright (c) 2012, Florian Boesch <pyalot@gmail.com> http://codeflow.org/

WebGL Extensioneer is licensed under any of the following licenses at your choosing:

MIT: see mit-license
GPL: see gpl-license
BSD: see bsd-license
