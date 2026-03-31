cwlVersion: v1.2
class: Workflow
label: sardem-sarsen
id: sardem-sarsen1
doc: |
  This application is designed to process Synthetic Aperture Radar (SAR) data
  from Sentinel-1 GRD products using a DEM obtained from Copernicus.
inputs:
  bbox:
    doc: Bounding box as 'LEFT BOTTOM RIGHT TOP'
    label: bounding box
    type: string
  stac_catalog_folder:
    doc: STAC catalog folder
    label: catalog folder
    type: Directory

outputs:
  out:
    type: Directory
    outputSource: process/outputs_result

steps:
  process:
    in:
      bbox: bbox
      stac_catalog_folder: stac_catalog_folder
    out: [outputs_result]
    # The tool is now embedded here as a dictionary
    run:
      class: CommandLineTool
      id: embedded-main
      requirements:
        DockerRequirement:
          dockerPull: ghcr.io/maap-project/sardem-sarsen:mlucas_nasa-ogc
        NetworkAccess:
          networkAccess: true
        ResourceRequirement:
          ramMin: 5
          coresMin: 1
          outdirMax: 20
      baseCommand: /app/sardem-sarsen/sardem-sarsen.sh
      inputs:
        bbox:
          type: string
          inputBinding:
            position: 1
            prefix: --bbox
          default: -118.06817 34.22169 -118.05801 34.22822
        stac_catalog_folder:
          type: Directory
          inputBinding:
            position: 2
            prefix: --stac_catalog_folder
      outputs:
        outputs_result:
          outputBinding:
            glob: ./output*
          type: Directory

# Metadata remains at the bottom
s:author:
  - class: s:Person
    s:name: arthurduf
s:version: 'embedded'
$namespaces:
  s: https://schema.org/