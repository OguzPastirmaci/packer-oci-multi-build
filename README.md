# Building multiple images with Packer

Here's the high level overview of the steps:

1 - Packer starts Oracle Linux 7.8 VMs in Ashburn and Phoenix regions.

2 - Packer installs Docker on the started VMs in Ashburn and Phoenix regions.

3 - Packer creates OCI custom images (Docker installed on Oracle Linux 7.8) in Ashburn and Phoenix regions.

4 - Shell script gets the image OCIDs created in step 3 from Packer output.

5 - Packer uses the images created in step 3 as new base images and starts new VMs in Ashburn and Phoenix.

6 - Packer pulls oraclelinux:7 container to VMs.

7 - Packer creates OCI custom images (Docker installed on Oracle Linux 7.8 and oraclelinux:7 container is pulled) in Ashburn and Phoenix regions.



## Step by step guide
### 1 - Install Packer

https://learn.hashicorp.com/tutorials/packer/getting-started-install

### 2 - Clone repository
```bash
git clone https://github.com/OguzPastirmaci/packer-oci-multi-build.git

cd packer-oci-multi-build
```

### 3 - Open variables.json and change the values
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

### 4 - Run the shell script
```bash
sh build_multiple_images.sh
```

