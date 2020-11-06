# Building multiple images with Packer




## 1 - Install Packer

https://learn.hashicorp.com/tutorials/packer/getting-started-install

## 2 - Copy this repository locally
```bash
git clone https://github.com/OguzPastirmaci/packer-oci-multi-build.git

cd packer-oci-multi-build
```

## 3 - Open variables.json and change the values
Open `variables.json` with an editor and change the values.

All of these values can also be put in the Packer json files as well but keeping them in a separate variables file makes editing easier.

Packer will create a VM and use it to create an image. The subnet OCID's in `variables.json` should be accessible over SSH where you run Packer (e.g. your laptop).

The `iad_base_ol78_platform_image_ocid` and `phx_base_ol78_platform_image_ocid` are basically the base images you want to use in the first step. The OCIDs in `variables.json` below are the vanilla platform images.

```json
{
    "user_ocid": "",
    "tenancy_ocid": "",
    "fingerprint": "",
    "compartment_ocid": "",
    "key_file": "",
    "iad_subnet_ocid": "",
    "phx_subnet_ocid": "",
    "iad_base_ol78_platform_image_ocid": "ocid1.image.oc1.iad.aaaaaaaapulaxjedwo2y3koeli6zq6evql6rropyxpni3wu44i2rbffgxgza",
    "phx_base_ol78_platform_image_ocid": "ocid1.image.oc1.phx.aaaaaaaauhf5hmgjm5vb7c5kllxgydveooeiyiwxa222k62tcjr4bhucyjha",
    "vm_shape": "VM.Standard2.1",
    "iad_availability_domain": "",
    "phx_availability_domain": ""
}
```
