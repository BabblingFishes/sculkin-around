This is a file outlining how `storage` is structured.

```
{
  portals:[                       # array of portal locations
    {
      origin:[<x>,<y>,<z>],       # xyz position of this portal
      dim_id:<dimension_id>,      # dimension of this portal (cross reference with nearest marker tagged sculking.dim_id_ref)
      portal_id:<portal_id>       # ID number of this portal (may be unique or paired)
    },
    ...
  ]
}
```
