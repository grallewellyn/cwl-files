cwlVersion: v1.2
$graph:
- class: Workflow
  label: sardem-sarsen
  doc: This application is designed to process Synthetic Aperture Radar (SAR) data
    from Sentinel-1 GRD (Ground Range Detected) products using a Digital Elevation
    Model (DEM) obtained from Copernicus.
  id: sardem-sarsen
  inputs:
    bbox:
      doc: Bounding box as 'LEFT BOTTOM RIGHT TOP'
      label: bounding box
      type: string
      default: "-118.06817 34.22169 -118.05801 34.22822"
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        bbox: bbox
      out:
      - outputs_result
- class: CommandLineTool
  id: main
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
      default: "-118.06817 34.22169 -118.05801 34.22822"
  outputs:
    outputs_result:
      outputBinding:
        glob: ./output*
      type: Directory
s:author:
- class: s:Person
  s:name: arthurduf
s:contributor:
- class: s:Person
  s:name: arthurduf
s:citation: https://github.com/MAAP-Project/sardem-sarsen.git
s:codeRepository: https://github.com/MAAP-Project/sardem-sarsen.git
s:commitHash: c4ab8153eca3256aaf2311856dadc1851ac4ef93
s:dateCreated: 2025-06-03
s:license: https://github.com/MAAP-Project/sardem-sarsen/blob/main/LICENSE
s:softwareVersion: 1.0.0
s:version: 20
s:releaseNotes: None
s:keywords: ogc, sar
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf