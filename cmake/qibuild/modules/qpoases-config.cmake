## Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
## Use of this source code is governed by a BSD-style license that can be
## found in the COPYING file.

clean(QPOASES)
fpath(QPOASES QProblem.hpp PATH_SUFFIXES qpoases)
flib(QPOASES qpOASES)
export_lib(QPOASES)
