# test-deploy

[![Build Status](https://travis-ci.org/jputrino/test-deploy.svg?branch=master)](https://travis-ci.org/jputrino/test-deploy)

This project can be used to test documentation tools for projects using sphinx. 
It's set up with the [f5-sphinx-theme](https://github.com/f5devcentral/f5-sphinx-theme) and uses the same scripts and tooling as the doc sets published on clouddocs.f5.com.

apt install python-sphinx


pip install -U sphinx
pip install f5-sphinx-theme
pip install recommonmark 
pip install cloud-sptheme
pip install sphinxjp.themes.sphinxjp
pip install sphinxjp.themes.basicstrap

cd /var/www

https://github.com/kkinch/dummy-docs.git

cd /var/www/dummy-docs

make html

CSS files are at:

   /var/www/dummy-docs/docs/html/_static/css


Push to your github
Go to repository
Select settings
Scroll to GitHub Pages
Select master branch /docs folder
No using a Jekyll theme (empty .nojekyll file)
Should be viewable at:

   https://<username>.github.io/dummy-docs/

http://10.145.104.168/




