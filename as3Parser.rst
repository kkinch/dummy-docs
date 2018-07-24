====================
Class: ``as3Parser``
====================


.. contents:: Local Navigation
   :local:

Children
========

.. toctree::
   :maxdepth: 1
   
   
Description
===========

this constructor gives you an as3Parser you can
use to process an ADC declaration.

Public methods (all return Promise) are:

     loadSchema() = load an AS3 schema
     digest() = assimilate an AS3 declaration

Public (read-only) properties are:

     'parsed' = most-recently-parsed declaration,
                     valid only after digest() of course

     'schema' = schema used to parse 'parsed'


.. _as3Parser.pathetic:


Function: ``pathetic``
======================

given decl-path 'path' from pointer 'src' in object
'origin' in declaration 'root', check path syntax
(supplier may have erred) and fix up path to an
absolute relative JSON pointer ;-).  Upon success
return object path points-to (ignoring trailing #),
else throw error.  If 'patch', put fixed-up path
(if any) into 'dest[dest_ppty]'. If 'fetch' !== "",
copy value which fixed-up path points-to (resolving
any of our usual polymorphism) into 'val[val_ppty]'
(or "(restricted)" if value or ancestor has
!allowReuse set).  Word in 'fetch' says whether to
copy as "string", decoded from "base64", or whole
"object" (JSON-able parts only).  By handling fetch
here we save caller the trouble of walking down the
path from root again, since we (will) already have
a handle to desired sub-object

.. js:function:: pathetic(path, src, origin, root, patch, dest, dest_ppty, fetch, val, val_ppty)

    
    :param string path: path to be fixed-up
    :param string src: JSON pointer to property from which path came
    :param object origin: object from which path came
    :param object root: root (declaration) object of which origin is descendant
    :param boolean patch: if true, put fixed-up path into dest[dest_ppty]
    :param object dest: object which may be patched
    :param string dest_ppty: property of dest which may be patched
    :param string fetch: if non-empty, copy what path points-to to val[val_ppty]
    :param object val: object to which data may be copied
    :param string val_ppty: property of val which may receive copy
    :return object: given decl-path 'path' from pointer 'src' in object
    'origin' in declaration 'root', check path syntax
    (supplier may have erred) and fix up path to an
    absolute relative JSON pointer ;-).  Upon success
    return object path points-to (ignoring trailing #),
    else throw error.  If 'patch', put fixed-up path
    (if any) into 'dest[dest_ppty]'. If 'fetch' !== "",
    copy value which fixed-up path points-to (resolving
    any of our usual polymorphism) into 'val[val_ppty]'
    (or "(restricted)" if value or ancestor has
    !allowReuse set).  Word in 'fetch' says whether to
    copy as "string", decoded from "base64", or whole
    "object" (JSON-able parts only).  By handling fetch
    here we save caller the trouble of walking down the
    path from root again, since we (will) already have
    a handle to desired sub-object
    
.. _as3Parser.getValue:


Function: ``getValue``
======================

given object 'obj', property name 'ppty', and
default value 'dfl', return value of obj[ppty]
if any, else dfl.  Missing dfl is empty string

.. js:function:: getValue(obj, ppty[, dfl])

    
    :param object obj: intended source of value
    :param string ppty: name of obj's property containing value
    :param object dfl: value to return if obj[ppty] is undefined
    
.. _as3Parser.backquoteExpand:


Function: ``backquoteExpand``
=============================

given string 'str' from source-pointer 'src' in
declaration 'root', expand backquote-escapes and
place result in 'dest[dest_ppty]'.  Return true
on success, else throw error

.. js:function:: backquoteExpand(str, src, origin, root, dest, dest_ppty)

    
    :param string str: string to expanded per backquote-escapes
    :param string src: pointer to property from which str came
    :param object origin: object from which str came
    :param object root: root (declaration) object of which origin is descendant
    :param object dest: object in which result will be placed
    :param string dest_ppty: property of dest where result will go
    :return boolean: given string 'str' from source-pointer 'src' in
    declaration 'root', expand backquote-escapes and
    place result in 'dest[dest_ppty]'.  Return true
    on success, else throw error
    
.. _as3Parser.fetchValue:


Function: ``fetchValue``
========================

given 'tgt' taken from pointer 'src' in object
'origin' in declaration 'root', if tgt is an
object like F5string, return a promise to fetch
some data from the indicated source and stick
it into dest[dest_ppty] (which may well replace
the original tgt).  This is async because it
may try to fetch an external url.

Note:  usually F5string property "base64" is
just a string armored to avoid the hassle of
JSON-escaping it.  When there actually is
binary inside a base64 (pkcs#12, I'm looking
at you!) we have to keep it in base64 armor

.. js:function:: fetchValue(tgt, src, origin, root, dest, dest_ppty)

    
    :param object tgt: object containing a reference to some data
    :param string src: pointer to tgt object
    :param object origin: object in which tgt was found
    :param object root: root (declaration) object of which origin is descendant
    :param object dest: object in which referenced-data will be placed
    :param string dest_ppty: property of dest where data will go
    :return Promise: - resolves to 'true'
    
.. _as3Parser.prepareParserAjv:


Function: ``prepareParserAjv``
==============================

return a handle to an instance of ajv to
which our custom formats and keywords have
been added.

We utilize the excellent 'ajv' tool from

     http://epoberezkin.github.io/ajv/

to validate AS3 declarations against our AS3
JSON Schema and to drive a bunch of features
controlled by custom schema keywords

.. js:function:: prepareParserAjv()

    
    :return object: return a handle to an instance of ajv to
    which our custom formats and keywords have
    been added.
    
    We utilize the excellent 'ajv' tool from
    
         http://epoberezkin.github.io/ajv/
    
    to validate AS3 declarations against our AS3
    JSON Schema and to drive a bunch of features
    controlled by custom schema keywords
    
.. _as3Parser.as3Digest:


Function: ``as3Digest``
=======================

Return a promise to digest a declaration using
validator() (that is, validating declaration
and processing custom keywords, which may have
substantial side effects like fetching lots of
data from url's in decl).
Resolves to ID of expanded declaration, but has
a HUGE side-effect of modifying declaration!

.. js:function:: as3Digest(declaration)

    
    :param object declaration: AS3 declaration to digest, WILL BE MODIFIED!
    :return Promise: - resolves to "id" of declaration (declaration is MODIFIED)
    
.. _as3Parser.loadSchema:


Function: ``loadSchema``
========================

return a promise to compile a schema for use by
digest().  If supplied, argument 'source' is an
AS3 schema (as an object) or else a filename or URL
(file:/http(s):) from which to load an AS3 schema,
if undefined or "" we load the default AS3 schema

.. js:function:: loadSchema(source[, saveCache])

    
    :param object|string source: if not empty overrides default schema
    :param string saveCache: refresh ajv-async-code cache file?
    :return Promise: - resolves to schema's "$id" value
    
.. _as3Parser.digest:


Function: ``digest``
====================

given a declaration, return a promise to digest
it according to the current schema (chosen with
loadSchema()).  Has the HUGE SIDE-EFFECT of
modifying declaration!

An as3Parser needs to know how to contact the
target BIG-IP so it can validate BIG-IP config
component references and obtain SecureVault
cryptograms for customer secrets.  The required
info should be in parameter 'controls'.

.. js:function:: digest(controls, declaration)

    
    :param object controls: target device contact info plus options
    :param object declaration: raw declaration to cook (WILL BE MODIFIED)
    :return Promise: - resolves to declaration label+id (declaration is MODIFIED)
    

.. _as3Parser.buildtime:

Member: ``buildtime``: 

.. _as3Parser.parsed:

Member: ``parsed``: 

.. _as3Parser.schema:

Member: ``schema``: 

.. _as3Parser.that:

Member: ``that``: 

.. _as3Parser.controls:

Member: ``controls``: 

.. _as3Parser.defaultSchemaSource:

Member: ``defaultSchemaSource``: 

.. _as3Parser.Ajv:

Member: ``Ajv``: 

.. _as3Parser.validator:

Member: ``validator``: 

.. _as3Parser.babyAjv:

Member: ``babyAjv``: 

.. _as3Parser.codeCacheFile:

Member: ``codeCacheFile``: 

.. _as3Parser.codeCache:

Member: ``codeCache``: 

.. _as3Parser.tales:

Member: ``tales``: 

.. _as3Parser.IPrex:

Member: ``IPrex``: 




