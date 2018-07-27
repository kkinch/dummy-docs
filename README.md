# test-deploy

[![Build Status](https://travis-ci.org/jputrino/test-deploy.svg?branch=master)](https://travis-ci.org/jputrino/test-deploy)

The dummy-docs project is used to test documentation tools for projects using the [f5-sphinx-theme](https://github.com/f5devcentral/f5-sphinx-theme). It also uses the same scripts and tooling as the doc sets published on clouddocs.f5.com.

Here's how I've set this up for testing:

Install the necessary software:

pip install -r requirements.txt


Choose one of the following methods for viewing the web site:

Local web directory
-------------------

1. Change into a web directory:

   cd /var/www

2. Clone this repository:

   https://github.com/kkinch/dummy-docs.git

3. Change to the dummy-docs directory:

   cd /var/www/dummy-docs

4. Generate the html:

   make html

5. The CSS files are in:

   /var/www/dummy-docs/docs/html/_static/css

Using GitPages
--------------

1. Clone this repository:

   https://github.com/kkinch/dummy-docs.git

2. Set your github as remote repository:

   git remote set-url origin git@github.com:<username>/<repo>.git
   git remote set-url origin https://github.com/<username>/repo>.git

2. Push to your github.

   git push

3. Log in to your repository.

4. Select settings

4. Scroll to GitHub Pages.

5. Select master branch /docs folder:

   No using a Jekyll theme (empty .nojekyll file)

6. The page should be viewable at:

   https://<username>.github.io/dummy-docs/




