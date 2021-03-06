******************
Django Vagrant Box
******************

.. image:: https://img.shields.io/badge/atlas-transcode%2Fdjango-brightgreen.svg
    :target: https://atlas.hashicorp.com/transcode/boxes/django
    :alt: Vagrant box transcode/django

.. image:: https://pyup.io/repos/github/transcode-de/django-vagrant-box/shield.svg
    :target: https://pyup.io/repos/github/transcode-de/django-vagrant-box/
    :alt: Updates

A `Vagrant <https://www.vagrantup.com/>`_ box for
`VirtualBox <https://www.virtualbox.org/>`_ to develop
`Django <https://www.djangoproject.com/>`_ projects.

Base box is a `Boxcutter Ubuntu box <https://github.com/boxcutter/ubuntu>`_
running `Ubuntu Server <https://www.ubuntu.com/server>`_ 16.04 LTS.

Features
========

This Vagrant box comes with pre-installed packages that are useful for
everyday Django development.

Programming Languages
---------------------

.. class:: compact

    - `Python <https://www.python.org/>`_ 3.5.2, 3.6.0 and 2.7.12
    - `pyenv <https://github.com/pyenv/pyenv>`_ 1.0.8
    - `Node.js <https://nodejs.org/en/>`_ 6.10.x (LTS version)
    - `nvm <https://github.com/creationix/nvm>`_ 0.33.1

Package Managers
----------------

.. class:: compact

    - `npm <https://www.npmjs.com/>`_ 3.10.x
    - `pip <https://pip.pypa.io/>`_ 8.1.1
    - `yarn <https://yarnpkg.com/>`_ 0.21.3

Databases
---------

.. class:: compact

    - `PostgreSQL <http://www.postgresql.org/>`_ 9.5 and libpq-dev 9.5.6
    - `SQLite <https://www.sqlite.org/>`_ 3.11.0

Development Tools
-----------------

.. class:: compact

    - `ack <http://beyondgrep.com/>`_ 2.14
    - `cloc <https://github.com/AlDanial/cloc>`_ 1.60
    - `curl <http://curl.haxx.se/>`_ 7.47.0
    - `gettext <https://www.gnu.org/software/gettext/>`_ 0.19.7
    - `Git <https://git-scm.com/>`_ 2.7.4
    - `git-flow (AVH Edition) <https://github.com/petervanderdoes/gitflow-avh>`_ 1.9.1
    - `bash-git-prompt <https://github.com/magicmonty/bash-git-prompt>`_ 2.6.1
    - `Graphviz <http://www.graphviz.org/>`_ 2.38.0
    - `httpie <https://httpie.org/>`_ 0.9.2
    - `iftop <http://www.ex-parrot.com/~pdw/iftop/>`_ 1.0pre4
    - `jq <https://github.com/stedolan/jq>`_ 1.5
    - `pgAdmin4 <https://www.pgadmin.org/>`_ 1.2
    - `ranger <http://ranger.nongnu.org/>`_ 1.9.0b4

        - `atool <http://www.nongnu.org/atool/>`_ 0.39.0
        - `caca-utils <http://caca.zoy.org/wiki/libcaca>`_ 0.99.beta19
        - `highlight <http://www.andre-simon.de/doku/highlight/en/highlight.php>`_ 3.18
        - `mediainfo <https://mediaarea.net/en/MediaInfo>`_ 0.7.82
        - `poppler-utils <https://poppler.freedesktop.org/>`_ 0.41.0
        - `w3m <http://w3m.sourceforge.net/>`_ 0.5.3

    - `Screen <https://www.gnu.org/software/screen/>`_ 4.3.1
    - `The Silver Searcher <https://github.com/ggreer/the_silver_searcher>`_ 0.31.0
    - `thefuck <https://github.com/nvbn/thefuck>`_ 3.14
    - `tig <http://jonas.nitro.dk/tig/>`_ 2.0.2
    - `tree <http://mama.indstate.edu/users/ice/tree/>`_ 1.7.0

Editors
-------

.. class:: compact

    - `nano <http://www.nano-editor.org/>`_ 2.5.3
    - `Vim <http://www.vim.org/>`_ 7.4.1689

Deployment
----------

.. class:: compact

    - `heroku CLI <https://devcenter.heroku.com/articles/heroku-cli>`_ 5.6.29

Other
-----

.. class:: compact

    - An empty "django" virtual Python environment, automatically activated after login
    - A ``recreate`` command to recreate the current virtual Python environment (useful to uninstall all Python packages)
    - `Glances <https://nicolargo.github.io/glances/>`_ 2.7.1, to monitor the box itself
    - `wkhtmltopdf <http://wkhtmltopdf.org/>`_ 0.12.2.4 with xvfb 1.18.4
    - `lxml <https://github.com/lxml/lxml>`_ dependencies

        - libxslt1-dev 1.1.28

    - `pillow <https://python-pillow.github.io/>`_ dependencies

        - libtiff5-dev 4.0.6
        - libjpeg-dev 8c
        - zlib1g-dev 1.2.8
        - libfreetype6-dev 2.6.1
        - liblcms2-dev 2.6
        - libwebp-dev 0.4.4

Configuration
=============

- During the first login you will be asked for your full name and email address to be used for your Git commits
- Git has already been configured with ``push.default = simple``
- A PostgreSQL database named "django" has already been created for you
- User and password for the PostgreSQL database are both ``django`` (user is superuser)
- PostgreSQL database name and user are also available as environment variables ``DB_NAME`` and ``DB_USER``
- APT is configured to use German Ubuntu mirror servers
- An environment variable ``ENV=vagrant`` has been set, to be used in scripts etc.
- Port 8000 on the guest will be forwarded to the same port on the host (used for the Django development web server)
- Port 5050 on the guest will be forwarded to the same port on the host (used for pgAdmin4, needs to be started manually)
- Port 61208 on the guest will be forwarded to the same port on the host (used for the Glances web server, runs in the background as a service)
- Auto correction for port forwarding is enabled, so port numbers can be different - use the ``vagrant port`` command to display them
- Timezone is set to Europe/Berlin

Installation
============

Download `Vagrant 1.9.x <https://www.vagrantup.com/downloads.html>`_ and
`VirtualBox 5.1.x <https://www.virtualbox.org/>`_ for your operating system and
architecture, then install both.

Usage
=====

Creating a new Vagrant box
--------------------------

To create and boot a new Vagrant box run:

::

    $ vagrant init --minimal transcode/django
    $ vagrant up

Now connect to the new box:

::

    $ vagrant ssh

That's it! Now change your working directory to ``/vagrant`` and start working
on your Django project!

Updating an existing Vagrant box
--------------------------------

To check for updates for your existing transcode/django Vagrant box run:

::

    $ vagrant box outdated

This command will show you if a new version of the box is available. (An update
check is also performed every time you run ``vagrant up``.)

If a new version is available, update the box:

::

    $ vagrant destroy --force
    $ vagrant box update

.. warning::

    This will destroy all data in the Vagrant box! Only the files in
    ``/vagrant`` will be kept.

After a successful upgrade clean up the old Vagrant boxes:

::

    $ vagrant box prune

Then boot and connect to the new Vagrant box:

::

    $ vagrant up
    $ vagrant ssh


Building and uploading a Vagrant box
====================================

This repository contains a ``Makefile`` with tasks to build, package and upload
the Vagrant box to Amazon S3.

To build and upload a Vagrant box run:

::

    $ git clone https://github.com/transcode-de/django-vagrant-box
    $ make all

Code of Conduct
===============

Everyone interacting in the django-vagrant-box project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
`PyPA Code of Conduct <https://www.pypa.io/en/latest/code-of-conduct/>`_.

License
=======

Distributed under the BSD 3-Clause license.

Copyright (c) 2016-2017, Markus Zapke-Gründemann
