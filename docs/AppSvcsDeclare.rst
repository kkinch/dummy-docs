=========================
Class: ``AppSvcsDeclare``
=========================


.. contents:: Local Navigation
   :local:

Children
========

.. toctree::
   :maxdepth: 1
   
   
Description
===========

None


.. _AppSvcsDeclare.wrapperAjv:


Function: ``wrapperAjv``
========================

prepare an instance of ajv to validate request
payloads.  Upon success leaves ajv instance in
this.requestValidator.  Throws on error.
this.requestValidator is synchronous; the
request schema ignores declaration contents
(which we run through as3parser later)

.. js:function:: wrapperAjv()

    
   :return undefined: - throws on error
    
.. _AppSvcsDeclare.declarationIndex:


Function: ``declarationIndex``
==============================

list all locally-saved declarations (if any)
(relies on caller to set 'this')

.. js:function:: declarationIndex()

    
   :return array: - possibly empty
    
.. _AppSvcsDeclare.savedDeclaration:


Function: ``savedDeclaration``
==============================

return a Promise to obtain the saved declaration
(if any) for target + age.  If age is zero and
no local copy is available and target seems
reachable, try to get stored declaration from
target device.

.. js:function:: savedDeclaration(controls, target[, age])

    
   :param object controls: info needed to access BIG-IP
   :param string target: (please normalize loopback-IP to "localhost")
   :param number age: zero is most recent
   :return Promise: - resolves to declaration or undefined
    
.. _AppSvcsDeclare.tenantFilter:


Function: ``tenantFilter``
==========================

exclude non-selected Tenants from a declaration.
SIDE EFFECT: modifies decl

.. js:function:: tenantFilter(decl, tenants, restOperation)


   :param object decl: exclude non-selected Tenants from a declaration.
      SIDE EFFECT: modifies decl
   :param array tenants: empty is okay
   :param object restOperation: exclude non-selected Tenants from a declaration.
      SIDE EFFECT: modifies decl
   :return boolean: - true upon success
    
.. _AppSvcsDeclare.doTheNeedful:


Function: ``doTheNeedful``
==========================

given a request object, return a promise to do
the needful and respond to the caller.  The
various HTTP methods (GET/POST/PATCH/DELETE)
just map whatever they get from caller and/or
framework to a request object and send it here

.. js:function:: doTheNeedful(request, restOperation)


   :param object request: given a request object, return a promise to do
      the needful and respond to the caller.  The
      various HTTP methods (GET/POST/PATCH/DELETE)
      just map whatever they get from caller and/or
      framework to a request object and send it here
   :param object restOperation: given a request object, return a promise to do
      the needful and respond to the caller.  The
      various HTTP methods (GET/POST/PATCH/DELETE)
      just map whatever they get from caller and/or
      framework to a request object and send it here
   :return Promise: given a request object, return a promise to do
      the needful and respond to the caller.  The
      various HTTP methods (GET/POST/PATCH/DELETE)
      just map whatever they get from caller and/or
      framework to a request object and send it here

.. _AppSvcsDeclare.onStart:


Function: ``onStart``
=====================

Prepare to handle AS3 requests (i.e., load AS3 schemas).
This runs asynchronously and the LX framework invokes
onStartCompleted() afterward.

The iControl LX framework calls this method when
instantiating the AS3 plugin.  We indicate success or
failure by invoking one of the callback functions
supplied as arguments.  (If we indicate failure then
the framework will disable AS3.)

.. js:function:: onStart(success, failure)


   :param function success: callback to indicate successful startup
   :param function failure: callback to indicate startup failure
   :return undefined: Prepare to handle AS3 requests (i.e., load AS3 schemas).
      This runs asynchronously and the LX framework invokes
      onStartCompleted() afterward.

      The iControl LX framework calls this method when
      instantiating the AS3 plugin.  We indicate success or
      failure by invoking one of the callback functions
      supplied as arguments.  (If we indicate failure then
      the framework will disable AS3.)
    
.. _AppSvcsDeclare.onStartCompleted:


Function: ``onStartCompleted``
==============================

Recognize readiness to handle AS3 requests.
The iControl LX framework calls this method when
onStart() work is complete.

.. js:function:: onStartCompleted(success, failure[, state][, errMsg])


   :param function success: callback to indicate successful startup
   :param function failure: callback to indicate startup failure
   :param object state: previously-persisted state
   :param string errMsg: framework's error message if onStart() failed
   :return undefined: Recognize readiness to handle AS3 requests.
      The iControl LX framework calls this method when
      onStart() work is complete.
    
.. _AppSvcsDeclare.onGet:


Function: ``onGet``
===================

Return a copy of some declaration to the client.
Caller appends [/target[/tenant[/expand[/age]]]]
to WORKER_URI_PATH to indicate which declaration
he wants to see.  If target is "index" we return
a list of targets for which we have declarations
and how many for each.

(It's okay for target to be IPv6, colons and all,
see https://url.spec.whatwg.org/ )

.. js:function:: onGet(restOperation)

    
   :param object restOperation: Return a copy of some declaration to the client.
      Caller appends [/target[/tenant[/expand[/age]]]]
      to WORKER_URI_PATH to indicate which declaration
      he wants to see.  If target is "index" we return
      a list of targets for which we have declarations
      and how many for each.

      (It's okay for target to be IPv6, colons and all,
      see https://url.spec.whatwg.org/ )
   :return undefined: Return a copy of some declaration to the client.
      Caller appends [/target[/tenant[/expand[/age]]]]
      to WORKER_URI_PATH to indicate which declaration
      he wants to see.  If target is "index" we return
      a list of targets for which we have declarations
      and how many for each.

      (It's okay for target to be IPv6, colons and all,
      see https://url.spec.whatwg.org/ )
    
.. _AppSvcsDeclare.onPost:


Function: ``onPost``
====================

Accept and parse a declaration then configure the
target BIG-IP.

The iControl LX framework calls this method when
a POST request comes in.  All information about the
request is in argument restOperation, including the
functions we call to indicate results.

.. js:function:: onPost(restOperation)

    
   :param object restOperation: Accept and parse a declaration then configure the
      target BIG-IP.

      The iControl LX framework calls this method when
      a POST request comes in.  All information about the
      request is in argument restOperation, including the
      functions we call to indicate results.
   :return undefined: Accept and parse a declaration then configure the
      target BIG-IP.

      The iControl LX framework calls this method when
      a POST request comes in.  All information about the
      request is in argument restOperation, including the
      functions we call to indicate results.
    
.. _AppSvcsDeclare.onDelete:


Function: ``onDelete``
======================

Attempt to remove one or more AS3 tenants from
BIG-IP when caller uses DELETE method.

Caller's authorization is not checked here but
rather in doTheNeedful().

.. js:function:: onDelete(restOperation)

    
    :param object restOperation: Attempt to remove one or more AS3 tenants from
       BIG-IP when caller uses DELETE method.

       Caller's authorization is not checked here but
       rather in doTheNeedful().
    :return undefined: Attempt to remove one or more AS3 tenants from
       BIG-IP when caller uses DELETE method.

       Caller's authorization is not checked here but
       rather in doTheNeedful().
    

.. _AppSvcsDeclare.WORKER_URI_PATH:

Member: ``WORKER_URI_PATH``: 

.. _AppSvcsDeclare.isPublic:

Member: ``isPublic``: 

.. _AppSvcsDeclare.isPassThrough:

Member: ``isPassThrough``: 

.. _AppSvcsDeclare.isPersisted:

Member: ``isPersisted``: 

.. _AppSvcsDeclare.isStateRequiredOnStart:

Member: ``isStateRequiredOnStart``: 

.. _AppSvcsDeclare.requestValidator:

Member: ``requestValidator``: 

.. _AppSvcsDeclare.myParser:

Member: ``myParser``: 

.. _AppSvcsDeclare.localBigip:

Member: ``localBigip``: 

.. _AppSvcsDeclare.controls:

Member: ``controls``: 

.. _AppSvcsDeclare.state:

Member: ``state``: 

.. _AppSvcsDeclare.canSaveState:

Member: ``canSaveState``: 




