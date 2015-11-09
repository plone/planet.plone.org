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

Planet
------

As with the old setup we use `Planet Venus <http://intertwingly.net/code/venus/>`_.

Since the version of venus which comes via the ubuntu repo is too old and giving errors, we use the latest stable version from a git checkout.

Venus is located under:``/srv/venus/source`` on the host.

For activation of the planet:

.. code-block:: bash

    $ vagrant ssh
    $ cd /srv/venus
    $ python source/planet.py planet.plone.org/planet.ini --verbose

.. todo::

    Let the setup script do that


Browse
------

Open your browser and point it to: ``localhost:8080``



