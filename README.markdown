sprockets-compressor - Minified Sprockets output
=================================================

This is a Ruby on Rails plugin, which passes Sprockets output through YUI Javascript compressor.



Installation
============

As a Rails Plugin
-----------------

Use this to install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/logandk/sprockets-compressor.git


As a Rails Plugin (using git submodules)
----------------------------------------

Use this if you prefer the idea of being able to easily switch between using edge or a tagged version:

	$ git submodule add git://github.com/logandk/sprockets-compressor.git vendor/plugins/sprockets-compressor



Usage
=====

Besides installation, you don't have to do anything to use this plugin. It simply overrides the `save_to` method of the `Sprockets::Concatenation` class, to pass the output through *YUI Compressor*.

	secretary = Sprockets::Secretary.new({ ... })
	secretary.concatenation.save_to("file.js")

In the above example, `file.js` would be a compressed javascript file.

**Note:** Compression is only enabled when your rails app is in `production` mode.



Credits
=======
[YUI Compressor](http://developer.yahoo.com/yui/compressor/) is developed by Yahoo. [Sprockets](http://github.com/sstephenson/sprockets/tree/master) is developed by Sam Stephenson.

Copyright (c) 2009 Logan Raarup, released under the MIT license
