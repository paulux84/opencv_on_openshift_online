# OpenCV on Openshift cartridge

To avoid quota limitations on online openshift cartridge, this script can be used on the DIY template.

- Connect to the dartridge via ssh.
- run:
```bash
wget https://raw.githubusercontent.com/paulux84/opencv_on_openshift_online/master/install.sh && nohup bash install.sh > opencvInstall.log &
```

Test importing opencv:
```python
> python
Python 2.7.11 (default, Mar 31 2016, 20:46:51) 
[GCC 5.3.1 20151207 (Red Hat 5.3.1-2)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2
>>> 
```

Original posts:
- Nikhil Kumar's [blogpost](http://kumarcode.com/How-to-install-OpenCV-on-OpenShift/)
- Stephen Nneji's [blogpost](https://codingexodus.blogspot.de/2013/04/how-to-install-opencv-on-openshift.html)
