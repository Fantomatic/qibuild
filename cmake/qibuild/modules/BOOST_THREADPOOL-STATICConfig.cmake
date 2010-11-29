##
## Author(s):
##  - Jean-Charles DELAY <jdelay@aldebaran-robotics.com>
##
## Copyright (C) 2008, 2010 Aldebaran Robotics



#get the root folder of this sdk
get_filename_component(_ROOT_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
include("${_ROOT_DIR}/boostutils.cmake")

set(_suffix "THREADPOOL")

clean(BOOST_${_suffix}-STATIC)
fpath(BOOST_${_suffix}-STATIC threadpool.hpp SUBDIRS boost)

boost_flib_static(BOOST_${_suffix}-STATIC thread)
boost_flib_static(BOOST_${_suffix}-STATIC date_time)

export_header (BOOST_${_suffix}-STATIC)
