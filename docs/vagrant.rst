=======
Vagrant
=======

We use `Vagrant <https://vagrantup.com>`_ for testing and local development of our planet setup.

Dependencies
------------
- `Vagrant <https://vagrantup.com>`_
- `vagrant-cachier <https://github.com/fgrehm/vagrant-cachier>`_

Please make sure that you have this add-on installed !

Setup
-----

If you initialize vagrant it will provision a shell script which installs all needed packages.

Network
-------

Port 80 of the vagrant box is forwarded to port 8080 of your host


Booting
-------

Navigate into the ``vagrant`` directory of planet.plone.org and *start* vagrant.

.. code-block:: bash

	$ cd vagrant
	$ vagrant up

Directory mount
----------------

In the ``vagrant`` directory you can see a directory called planet.plone.org, this directory is mounted into the vagrant box to ``/srv/venus/planet.plone.org``.

With this setup, you are able to use your standard development tools on your local machine to work on files running in your vagrant box.

Planet
------

As with the old setup we use `Planet Venus <http://intertwingly.net/code/venus/>`_.

Since the version of venus which comes via the ubuntu repo is too old and giving errors, we use the latest stable version from a git checkout.

Venus is located under:``/srv/venus/source`` on the host.

You can find planet.plone.org in ``/srv/venus/planet.plone.org``.

For activation of the planet:


.. code-block:: bash

    $ make planet

or login via ssh and do it *from hand*:

.. code-block:: bash

    $ vagrant ssh
    $ cd /srv/venus
    $ python source/planet.py planet.plone.org/planet.ini --verbose



Browse
------

Open your browser and point it to: ``localhost:8080``



