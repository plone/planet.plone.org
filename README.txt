To add your feed
================

To add you feed:
Please clone this repository and open an pull request. Merged changes will be deployed on the server automatically.




 ♀ Planet Venus for Plone
==========================

This is the buildout for `Planet Venus`_ (an RSS aggregator) for Plone_, the
content management system.  This buildout provides the configuration for
Planet Venus, normally served at http://planet.plone.org/.


THESE INSRUCTIONS ARE PARTIALLY OUTDATED, FOLLOW ADMIN MANUAL:

https://github.com/plone/ploneorg.admin


Quickly Add a Feed
==================

You've already got planet.plone.org up and running?  Great, add a feed to
"feeds.cfg", then run:

1. sudo bin/buildout
2. sudo chown -R apache parts var
3. sudo -u apache /bin/sh bin/update.sh (or just wait 10 minutes)

Don't have planet.plone.org up and running yet?  Read below.


Quick Start
===========

To deploy planet.plone.org:

1. cd /var/www
2. sudo svn checkout https://svn.plone.org/svn/plone/plone.org/planet/trunk planet.plone.org
3. cd planet.plone.org
4. sudo python bootstrap.py -d
5. sudo bin/buildout
6. sudo chown -R apache parts var
7. install -o root -g root -m 644 /var/www/planet.plone.org/var/crontab /etc/cron.d/planet
8. sudo /etc/init.d/apache2 restart

Didn't work?  Read below.


Detailed Deployment
===================

This section gives detailed deployment information that's sure to get
planet.plone.org up and running.


Requirements
------------

Planet Venus and this configuration of it requires Python >= 2.4 but < 3.
I've tested it on Python 2.6 (on Mac OS X) and Python 2.7 (on Gentoo 1.12.14).

*Note*: If you're on Mac OS X, make sure you use a Python with the ``bsddb``
module enabled.  The system Python does *not* support ``bsddb``.

It also requires libxml2/libxslt be present on the system in the usual
locations.  Naturally, it requires an active internet connection in order to
download eggs during configuration and to download feeds during operation.

Finally, it assumes that Apache HTTPD is already set up to use an include
directive to bring on the Planet Venus HTTPD configuration.  On the OSUOSL_
provided host deus2.osuosl.org, that file is pre-configured in
/etc/apache2/vhosts.d/planet.plone.org.conf with the following content::

    <VirtualHost *:80>
        ServerName  planet.plone.org
        ServerAlias planet2.plone.org

        DocumentRoot    /var/www/planet.plone.org/htdocs

        Include /var/www/planet.plone.org/conf/*

        CustomLog "|/usr/sbin/cronolog /var/log/apache2/planet.plone.org/transfer/%Y%m%d.log" combined
        ErrorLog "|/usr/sbin/cronolog /var/log/apache2/planet.plone.org/error/%Y%m%d.log"
    </VirtualHost>

*Note*: The DocumentRoot above is not used.


Deployment
----------

The Planet Venus configuration for Plone is generated using Buildout_.  After
bootstrapping, the Buildout generates the various configuration files,
configures a custom Python interpreter, and creates a wrapper script.  Outside
of Buildout, you need to just set permissions and install a file.

The details steps are as follows:

1.  Check out the Planet Venus configuration from Subversion into the /var/www
    directory as "planet.plone.org"::

        sudo svn checkout https://svn.plone.org/svn/plone/plone.org/planet/trunk /var/www/planet.plone.org

2.  Make that directory the current working directory of your shell::

        cd /var/www/planet.plone.org

3.  Bootstrap the Buildout using Python (the ``-d`` option tells Buildout to
    prefer Distribute_ over Setuptools_)::

        sudo /usr/bin/python2.7 bootstrap.py -d

4.  Buildout::

        sudo bin/buildout

5.  Change ownership of the ``parts`` & ``var`` subdirectories to the "apache"
    user (or whatever user is specified in the ``venus-user`` property in the
    ``[buildout]`` section of the "buildout.cfg" file)::

        sudo chown -R apache parts var

6.  Install the generated crontab file into "/etc/cron.d" so that the Planet
    Venus feeds are updated every 10 minutes::

        install -o root -g root -m 644 /var/www/planet.plone.org/var/crontab /etc/cron.d/planet

    (Don't be tempted to use a symbolic link to the generated file.  Cron will
    complain.)

7.  Restart (or reload) Apache 2 so that it will pick up the directives in the
    generated HTTPD configuration::
    
        sudo /etc/init.d/apache2 restart

    You can ignore the error about the nonexistent DocumentRoot configured by
    OSUOSL.  The generated configuration resets the DocumentRoot to the
    correct location.

That's it!  After about 10 minutes, the initial set of feeds should be
available at http://planet.plone.org/.


Updating the Feeds
------------------

All feeds are cataloged in the file "feeds.cfg" in the base directory of the
Buildout.  To add, update, or remove a feed, edit that file.  You can then use
Subversion to update the operational copy (``svn update``), and then re-run
the buildout to generate the updated configuration.

To do so, just repeat step 4 from above.

After about 10 minutes, the feeds will be updated.  You can force an early
update by running::

    sudo -u apache /bin/sh /var/www/planet.plone.org/bin/update.sh

But if you're in that much of a hurry, you may want to re-examine your
priorities.  Take some time for yourself, perhaps get some exercise, or relax
with a nice book.


Questions, Comments, Concerns
=============================

For any issues regarding Planet Venus for Plone and the
http://planet.plone.org/ service, please contact the Plone AI Team at
admins@plone.org.


.. References:
.. _Buildout: http://www.buildout.org/
.. _Distribute: http://packages.python.org/distribute/
.. _OSUOSL: http://osuosl.org/
.. _Plone: http://plone.org/
.. _Setuptools: http://peak.telecommunity.com/DevCenter/setuptools
.. _`Planet Venus`: http://intertwingly.net/code/venus/

.. Author:
    Sean Kelly
    kelly@seankelly.biz
    Plone AI Team
