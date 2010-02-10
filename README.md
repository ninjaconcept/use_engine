UseEngine
=========

The UseEngine plugin explicitly loads the engines models or controllers. This provides the ability to overwrite or extend the engines code with code of the parent application.
Mix in engine defined classes in your (parent) app classes for overwriting with custom behaviour. 
This plugin fixes the lack of the code mixing feature the rails engines plugin had but was not implemented in the rails core. 

See [http://rails-engines.org/news/2009/02/02/engines-in-rails-2-3/](http://rails-engines.org/news/2009/02/02/engines-in-rails-2-3/) for more information.


Usage
=====

Install as a plugin:
--------------------

    script/plugin install git://github.com/ninjaconcept/use_engine.git


Examples
--------

    class FrontendUser < User
      use_engine :nc_backend_basics
    end

    class FrontendUser < User
      use_engine :nc_backend_basics, :version => '0.4.0', :path => 'models'
    end


Options:
--------

    :version - load a specific version, not the latest (default)
    :path - add load path for your engine


Compatibility
=============

This is an initial release that was only tested on Rails 2.3.5!


To Do
=====

- change engine load paths to search in vendor/gems then in vendor/plugins and finally in the system's gems
- add some unit tests


Feedback
========

Feel free to fork and improve! Feedback is welcome at any time!
 

Contributors
============

*  [Marco Sehrer](http://github.com/pixelvitamina) (Author)
*  [Stefan Botzenhart](http://github.com/basiszwo)


Copyright &copy; 2010 [ninjaconcept](http://www.ninjaconcept.com/), released under the MIT license
