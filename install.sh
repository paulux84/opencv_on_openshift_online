#!/bin/bash

# use the tmp dir
cd $OPENSHIFT_TMP_DIR

# get opencv pkg
wget http://pkgs.fedoraproject.org/repo/pkgs/opencv/OpenCV-2.4.3.tar.bz2/c0a5af4ff9d0d540684c0bf00ef35dbe/OpenCV-2.4.3.tar.bz2
tar xvf OpenCV-2.4.3.tar.bz2
rm OpenCV-2.4.3.tar.bz2
cd OpenCV-2.4.3/
rm -r 3rdparty android doc data ios samples apps
rm README
# comment lines from 448 to 472
sed -i '448,472 s/^/#/' CMakeLists.txt
# turn off regression and performance tests
sed -i '155,156 s/ ON/ OFF/' CMakeLists.txt
mkdir release
cd release
cmake ../OpenCV-2.4.3 -D BUILD_NEW_PYTHON_SUPPORT=ON -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$OPENSHIFT_DATA_DIR -D PYTHON_LIBRARY=$LD_LIBRARY_PATH/libpython2.7.so -D CMAKE_INCLUDE_PATH=$OPENSHIFT_HOMEDIR/python/virtenv/include/python2.7 -D PYTHON_INCLUDE_DIR=$OPENSHIFT_HOMEDIR/python/virtenv/include/python2.7 -D PYTHON_PACKAGES_PATH=$OPENSHIFT_HOMEDIR/python/virtenv/lib/python2.7/site-packages -D PYTHON_EXECUTABLE=$OPENSHIFT_HOMEDIR/python/virtenv/bin/python -D WITH_OPENEXR=OFF -D BUILD_DOCS=OFF -DBUILD_SHARED_LIBS=ON ..
make
make install
