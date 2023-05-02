
include("${CMAKE_CURRENT_LIST_DIR}/QtWebAppConfigVersion.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/QtWebAppTargets.cmake")

if (NOT QtWebApp_FIND_COMPONENTS)
	set(QtWebApp_NOT_FOUND_MESSAGE "The QtWebApp package requires at least one component")
	set(QtWebApp_FOUND False)
	return()
endif()

set(_req)
if (QtWebApp_FIND_REQUIRED)
	set(_req REQUIRED)
endif()

# TODO: Qt Network is not required for all modules
find_package(Qt@QT_VERSION_MAJOR@ ${_req} COMPONENTS Core Network)
if (NOT ${Qt@QT_VERSION_MAJOR@_FOUND})
	set(QtWebApp_NOT_FOUND_MESSAGE "Unable to find Qt@QT_VERSION_MAJOR@")
	set(QtWebApp_FOUND False)
	return()
endif()
if (@QT_VERSION_MAJOR@ EQUAL 6)
	find_package(Qt6 COMPONENTS Core5Compat REQUIRED)
endif()
set(QtWebApp_LIBRARIES Qt@QT_VERSION_MAJOR@::Core Qt@QT_VERSION_MAJOR@::Network)

set(_comps Global ${QtWebApp_FIND_COMPONENTS})

foreach(module ${_comps})
	set(QtWebApp_LIBRARIES ${QtWebApp_LIBRARIES} QtWebApp${module})
endforeach()

mark_as_advanced(QtWebApp_LIBRARIES)
