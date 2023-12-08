#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/src/moveit/moveit_core"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/install/lib/python3/dist-packages:/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/build/moveit_core/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/build/moveit_core" \
    "/usr/bin/python3" \
    "/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/src/moveit/moveit_core/setup.py" \
    egg_info --egg-base /media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/build/moveit_core \
    build --build-base "/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/build/moveit_core" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/install" --install-scripts="/media/alex/AlexPortableSSD/School/4th-year/CS422/Assignment4/ws_moveit/install/bin"
