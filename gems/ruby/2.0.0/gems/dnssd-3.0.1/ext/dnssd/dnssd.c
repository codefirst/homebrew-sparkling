#include "dnssd.h"

void Init_DNSSD_Errors(void);
void Init_DNSSD_Flags(void);
void Init_DNSSD_Record(void);
void Init_DNSSD_Service(void);

/*
 * call-seq:
 *   DNSSD.interface_name(interface_index) # => interface_name
 *
 * Returns the interface name for interface +interface_index+.
 *
 *   DNSSD.interface_name 1 # => 'lo0'
 */

static VALUE
dnssd_if_nametoindex(VALUE self, VALUE name) {
  return UINT2NUM(if_nametoindex(StringValueCStr(name)));
}

/*
 * call-seq:
 *   DNSSD.interface_index(interface_name) # => interface_index
 *
 * Returns the interface index for interface +interface_name+.
 *
 *   DNSSD.interface_index 'lo0' # => 1
 */

static VALUE
dnssd_if_indextoname(VALUE self, VALUE index) {
  char buffer[IF_NAMESIZE];

  if (if_indextoname(NUM2UINT(index), buffer))
    return rb_str_new2(buffer);

  rb_raise(rb_eArgError, "invalid interface %d", NUM2UINT(index));

  return Qnil;
}

void
Init_dnssd(void) {
  VALUE mDNSSD = rb_define_module("DNSSD");

  /* All interfaces */
  rb_define_const(mDNSSD, "InterfaceAny",
      ULONG2NUM(kDNSServiceInterfaceIndexAny));

  /* Local interfaces, for services running only on the same machine */
  rb_define_const(mDNSSD, "InterfaceLocalOnly",
      ULONG2NUM(kDNSServiceInterfaceIndexLocalOnly));

#ifdef kDNSServiceInterfaceIndexUnicast
  /* Unicast interfaces */
  rb_define_const(mDNSSD, "InterfaceUnicast",
      ULONG2NUM(kDNSServiceInterfaceIndexUnicast));
#endif

  rb_define_singleton_method(mDNSSD, "interface_index", dnssd_if_nametoindex, 1);
  rb_define_singleton_method(mDNSSD, "interface_name", dnssd_if_indextoname, 1);

  Init_DNSSD_Errors();
  Init_DNSSD_Flags();
  Init_DNSSD_Record();
  Init_DNSSD_Service();
}

