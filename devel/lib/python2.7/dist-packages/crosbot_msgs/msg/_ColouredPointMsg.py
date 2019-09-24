# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from crosbot_msgs/ColouredPointMsg.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import crosbot_msgs.msg

class ColouredPointMsg(genpy.Message):
  _md5sum = "d75f9aa7b2fc4712f55c6e6703f1c090"
  _type = "crosbot_msgs/ColouredPointMsg"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """geometry_msgs/Point p
ColourMsg c
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: crosbot_msgs/ColourMsg
uint8 r
uint8 g
uint8 b
uint8 a"""
  __slots__ = ['p','c']
  _slot_types = ['geometry_msgs/Point','crosbot_msgs/ColourMsg']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       p,c

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ColouredPointMsg, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.p is None:
        self.p = geometry_msgs.msg.Point()
      if self.c is None:
        self.c = crosbot_msgs.msg.ColourMsg()
    else:
      self.p = geometry_msgs.msg.Point()
      self.c = crosbot_msgs.msg.ColourMsg()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3d4B().pack(_x.p.x, _x.p.y, _x.p.z, _x.c.r, _x.c.g, _x.c.b, _x.c.a))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.p is None:
        self.p = geometry_msgs.msg.Point()
      if self.c is None:
        self.c = crosbot_msgs.msg.ColourMsg()
      end = 0
      _x = self
      start = end
      end += 28
      (_x.p.x, _x.p.y, _x.p.z, _x.c.r, _x.c.g, _x.c.b, _x.c.a,) = _get_struct_3d4B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3d4B().pack(_x.p.x, _x.p.y, _x.p.z, _x.c.r, _x.c.g, _x.c.b, _x.c.a))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.p is None:
        self.p = geometry_msgs.msg.Point()
      if self.c is None:
        self.c = crosbot_msgs.msg.ColourMsg()
      end = 0
      _x = self
      start = end
      end += 28
      (_x.p.x, _x.p.y, _x.p.z, _x.c.r, _x.c.g, _x.c.b, _x.c.a,) = _get_struct_3d4B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d4B = None
def _get_struct_3d4B():
    global _struct_3d4B
    if _struct_3d4B is None:
        _struct_3d4B = struct.Struct("<3d4B")
    return _struct_3d4B
