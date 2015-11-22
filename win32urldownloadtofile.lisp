;Common Lisp win32
;downloads an image from the web as 'file.png' using win32

(ql:quickload :cffi)
(cffi:load-foreign-library "urlmon.dll")

;define the function
(cffi:defcfun ("URLDownloadToFileA" url-dl-to-file) :long
	( pCaller		:pointer )
	( szURL			:pointer )
	( szFilename	:pointer )
	( dwReserved	:long )
	( lpfnCB		:pointer )
)

;create foreign strings
(setq url (cffi:foreign-string-alloc "http://common-lisp.net/static/imgs/lisplogo.png"))
(setq filename (cffi:foreign-string-alloc "file.png"))

;call the function
(url-dl-to-file (cffi:null-pointer) url filename 0 (cffi:null-pointer))

;free strings
(cffi:foreign-string-free url)
(cffi:foreign-string-free filename)
