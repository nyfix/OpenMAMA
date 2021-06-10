# find LibEvent
# an event notification library (http://libevent.org/)
#
# Usage:
# LIBEVENT_INCLUDE_DIRS, where to find LibEvent headers
# LIBEVENT_LIBRARIES, LibEvent libraries
# Libevent_FOUND, If false, do not try to use libevent

set(LIBEVENT_ROOT CACHE PATH "Root directory of libevent installation")
set(LibEvent_EXTRA_PREFIXES ${LIBEVENT_ROOT} /usr/local /opt/local "$ENV{HOME}")
foreach(prefix ${LibEvent_EXTRA_PREFIXES})
  if(EXISTS "${prefix}/include")
     list(APPEND LibEvent_INCLUDE_PATHS "${prefix}/include")
  endif()
  if(EXISTS "${prefix}/lib")
    list(APPEND LibEvent_LIBRARIES_PATHS "${prefix}/lib")
  endif()
endforeach()

# Looking for "event.h" will find the Platform SDK include dir on windows
# so we also look for a peer header like evhttp.h to get the right path
find_path(LIBEVENT_INCLUDE_DIRS evhttp.h event.h PATHS ${LibEvent_INCLUDE_PATHS})

# "lib" prefix is needed on Windows in some cases
# newer versions of libevent use three libraries
find_library(LIBEVENT_LIBRARIES NAMES event event_core event_extra libevent PATHS ${LibEvent_LIBRARIES_PATHS})

message(STATUS "LibEvent_LIBRARIES_PATHS=${LibEvent_LIBRARIES_PATHS}")
message(STATUS "LIBEVENT_LIBRARIES=${LIBEVENT_LIBRARIES}")

if (LIBEVENT_LIBRARIES AND LIBEVENT_INCLUDE_DIRS)
  set(Libevent_FOUND TRUE)
  set(LIBEVENT_LIBRARIES ${LIBEVENT_LIBRARIES})
else ()
  set(Libevent_FOUND FALSE)
endif ()

if (Libevent_FOUND)
  if (NOT Libevent_FIND_QUIETLY)
    message(STATUS "Found libevent: ${LIBEVENT_LIBRARIES}")
  endif ()
else ()
  if (LibEvent_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find libevent.")
  endif ()
  message(STATUS "libevent NOT found.")
endif ()

mark_as_advanced(
    LIBEVENT_LIBRARIES
    LIBEVENT_INCLUDE_DIRS
  )