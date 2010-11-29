##
## Author(s):
##  - Cedric GESTES <gestes@aldebaran-robotics.com>
##
## Copyright (C) 2008, 2010 Aldebaran Robotics

#get the root folder of this sdk
get_filename_component(_ROOT_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
include("${_ROOT_DIR}/boostutils.cmake")

set(_libname "date_time")
set(_suffix "DATE_TIME")

clean(BOOST_${_suffix})
fpath(BOOST_${_suffix} boost)

boost_flib(${_suffix} ${_libname})
boost_flib(${_suffix} "system")

export_lib(BOOST_${_suffix})
