/*
 * Copyright (c) 2012-2015 Aldebaran Robotics. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the COPYING file.
 */

#ifndef _HELLOJAVA_HELLO_HPP_
#define _HELLOJAVA_HELLO_HPP_

#include <jni.h>

#if defined _WIN32 || defined __CYGWIN__
#  define QI_EXPORT_API __declspec(dllexport)
#elif __GNUC__ >= 4
#  define QI_EXPORT_API __attribute__ ((visibility("default")))
#else
#  define QI_EXPORT_API
#endif

extern "C"
{
  QI_EXPORT_API jstring Java_com_test_App_hello(JNIEnv *env, jobject obj);
} // !extern "C"

#endif // !_HELLOJAVA_HELLO_HPP_
