♀ Planet Venus for Plone — Configuration Templates
==================================================

The files here contain configuration templates that contain values that are
computed at buildout time.  These files drive the operation of `Planet
Venus`_ for Plone_.  In summary:

theme.cfg.in
    Generates BASEDIR/theme/config.ini and tells Planet Venus how to make a
    pretty Plone-style page.  (As a generated file, I'd normally like this
    to end up in parts or var, but Planet Venus demands it in the theme dir.)
venus.cfg.in
    Generates BASEDIR/var/venus.cfg and tells Planet Venus where the theme is,
    what feeds to generate, how to cache them, etc.
httpd.cfg.in
    Generates BASEDIR/conf/httpd.conf, included (via ``conf/*``) from Apache
    HTTPD's configuration.  (As a generated file, I'd normally like this to
    end up in parts or var, but OSUOSL demands ``/…/conf/*``.)


.. References:
.. _Plone: http://plone.org/
.. _`Planet Venus`: http://intertwingly.net/code/venus/

.. Author:
    Sean Kelly
    kelly@seankelly.biz
    Plone AI Team
