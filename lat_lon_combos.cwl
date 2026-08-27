cwlVersion: v1.2
$graph:
- class: Workflow
  label: dps_tutorial_lat_lon_combo
  doc: testing bbox
  id: dps_tutorial_lat_lon_combo
  inputs:
    latlon:
      doc: lat lon
      label: lat lon
      type: string
    lnglat:
      doc: lnglat
      label: lnglat
      type: string
    longitude latitiude:
      doc: longitude latitiude
      label: longitude latitiude
      type: string
    firstlongitudelatitude:
      doc: firstlongitudelatitude
      label: firstlongitudelatitude:
      type: string
    second lng latitude:
      doc: second lng latitude
      label: second lng latitude
      type: string
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        latlon: latlon
        lnglat: lnglat
        longitude latitiude: longitude latitiude
        firstlongitudelatitude: firstlongitudelatitude
        second lng latitude: second lng latitude
      out:
      - outputs_result
- class: CommandLineTool
  id: main
  requirements:
    DockerRequirement:
      dockerPull: mas.uat.maap-project.org/root/maap-workspaces/custom_images/maap_base:v6.0.0
    NetworkAccess:
      networkAccess: true
    ResourceRequirement:
      ramMin: 1
      coresMin: 1
      outdirMax: 20
  baseCommand: /app/dps_tutorial/mapable_algorithm_bbox/run_bbox.sh
  inputs:
    latlon:
      type: string
      inputBinding:
        position: 1
        prefix: --latlon
    lnglat:
      type: string
      inputBinding:
        position: 2
        prefix: --lnglat
    longitude latitiude:
      type: string
      inputBinding:
        position: 3
        prefix: --longitude latitiude
    firstlongitudelatitude:
      type: string
      inputBinding:
        position: 4
        prefix: --firstlongitudelatitude
    second lng latitude:
      type: string
      inputBinding:
        position: 5
        prefix: --second lng latitude
  outputs:
    outputs_result:
      outputBinding:
        glob: ./output*
      type: Directory
s:author:
- class: s:Person
  s:name: null
s:contributor:
- class: s:Person
  s:name: null
s:citation: null
s:codeRepository: https://github.com/MAAP-Project/dps_tutorial.git
s:commitHash: 9cd05c0400517782d38abca20a41fa635b0a557a
s:dateCreated: 2026-08-11
s:license: null
s:softwareVersion: 1.0.0
s:version: mmgis-mapable
s:releaseNotes: null
s:keywords: null
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf