# test-deploy

[![Build Status](https://travis-ci.org/jputrino/test-deploy.svg?branch=master)](https://travis-ci.org/jputrino/test-deploy)

The dummy-docs project is used to test documentation tools for projects using the [f5-sphinx-theme](https://github.com/f5devcentral/f5-sphinx-theme). It also uses the same scripts and tooling as the doc sets published on clouddocs.f5.com.

The Setup
=========

Install the necessary software:

pip install -r requirements.txt


Choose one of the following methods for viewing the web site:

Local web directory
-------------------

1. Change into a web directory:

   cd /var/www

2. Clone this repository:

   git clone https://github.com/kkinch/dummy-docs.git

3. Change to the dummy-docs directory:

   cd /var/www/dummy-docs

4. Generate the html:

   make html

5. The CSS files are in:

   /var/www/dummy-docs/docs/html/_static/css

Using GitPages
--------------

1. Clone this repository:

   git clone https://github.com/kkinch/dummy-docs.git

2. Set your github as remote repository:

   git remote set-url origin git@github.com:<username>/<repo>.git
   git remote set-url origin https://github.com/<username>/repo>.git

2. Push to your github.

   git push

3. Log in to your repository.

4. Select settings

4. Scroll to GitHub Pages.

5. Select:

   master branch /docs folder:

6. Theme isn't necessary (empty .nojekyll file).

7. The page should be viewable at:

   https://<username>.github.io/dummy-docs/

Directory structure overview
----------------------------

Raw files are essentially loaded into the custom_sphinx_theme directories. When make run is executed, sphinx generates content and places the files in the html directories.

File and directory structure
tree -at /var/www/customsphinx

```
docs
├── conf.py
├── index.rst
├── index_reference_file.rst
├── _build
│       ├── doctree
│       └── html
│               ├── index.html
│               └── _static
│                       ├── css
│                       │      └── my_custom.css
│                       ├── js
│                       │      └── my_custom.js
│                       └── fonts
│                               └── custom_font
│
└── custom_sphinx_theme
        ├── theme.conf
        ├── layout.html
        ├── layout_include_file.html
        └── static
                ├── css
                │      └── my_custom.css
                ├── js
                │      └── my_custom.js
                └── fonts
                        └── custom_font



</pre>
```
