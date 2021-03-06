(defmodule pflux
  (export all))

;;; Infrastructure functions.
(defun call-backend (func)
  (call (lfe-utils:atom-cat 'pflux- (pflux-config:get-db-backend))
        func))

(defun call-backend (func args)
  (eval `(call ',(lfe-utils:atom-cat 'pflux- (pflux-config:get-db-backend))
               ,func
               ,@args)))

;;; Data calls.
(defun store-server (name ip group network)
  (call-backend `'store-server (list name ip group network)))

(defun get-servers ()
  (call-backend 'get-servers))

(defun get-ips ()
  (call-backend 'get-ips))

(defun store-pings ()
  (call-backend 'store-pings))

(defun drop-servers ()
  (call-backend 'drop-servers))
