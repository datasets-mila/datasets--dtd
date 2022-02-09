Describable Textures Dataset (DTD)

Related publication
M.Cimpoi, S. Maji, I. Kokkinos, S. Mohamed, A. Vedaldi
"Describing Textures in the Wild"
Computer Vision and Pattern Recognition, 2014

http://www.robots.ox.ac.uk/~vgg/publications/2014/Cimpoi14/
http://www.robots.ox.ac.uk/~vedaldi/pub.html#y2014

-------- Annotations, ground truth, splits ----------------
The dataset consists of 5640 images, split into 47 classes (also referred to 
as key attributes). The images that have the same key attribute are grouped 
in a folder named after the category.

The dataset follows the following folder structure:

dtd
|-- images
|   |-- banded
|   |-- blotchy
|   |-- braided
|   |-- bubbly
|   |-- bumpy
|   ...........
|   |-- wrinkled
|   `-- zigzagged
|-- imdb
|   `-- imdb.mat
|-- labels
|   |-- labels_joint_anno.txt
|   |-- test1.txt
|   |-- test2.txt
    ..............
|   |-- test10.txt
|   |-- train1.txt
|   |-- train2.txt
|   ...............
|   |-- train10.txt
|   |-- val1.txt
|   |-- val2.txt
|   .............
|   `--	val10.txt

For example, under images/banded, there are all the images which have banded
as their key attribute. The key attributes are used for evaluating
classification accuracy (see below).

imdb/imdb.mat -- contains a structure with the following fields:
- images
   -- id 1x5640 double, (not currently used) 
   -- name 1x5640 cell of strings, containing image names
      (relative to images directory. e.g. banded/banded_0001.jpg
   -- set 1 x 5640 double, (1 -- train, 2 -- val, 3 -- test);
   -- class (1 - 47, key attribute);
- meta
   -- classes: 1 x 47 cell, containing the 47 class names;
   e.g.  imdb.meta.classes{imdb.images.class(ii)} gives the name of the
   key attribute of image ii;

-------- Annotations, ground truth, splits ----------------

The key attribute (used in accuracy evaluation) for each image is obtained
from the folder in which the image belongs, and can also be identified from
the filename -- <categ_name>/<categ_name>_XXXX.jpg.

In the folder labels (or when downloading separately), there are text files
containing the  lists of files used for train, validation and test,
respectively (train1.txt ... train10.txt, val1.txt ... val10.txt,
test1.txt ... test10.txt). These define the 10 splits we used for reporting
the results in our paper (averaged mACC and mAP over the 10 splits).

For the joint attributes (an image can be assigned to at least one category),
the ground truth is stored under labels/labels_joint_anno.txt, which consists
in one line for each image, starting with image name, relative to images 
folder followed by the attributes that describe the given image. These
attributes always include the key attribute for each image.

-------- DeCAF features ---------------------------------------
Precomputed DeCAF features are provided for DTD. These are stored as a matrix
where each row represents the feature vector (4096-D) for an image. The images
are assumed to be in alphabetical order.
