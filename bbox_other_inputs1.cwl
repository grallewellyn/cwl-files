cwlVersion: v1.2
$graph:
- class: Workflow
  label: dps_tutorial_bounding_box_other_inputs
  doc: testing bbox
  id: dps_tutorial_bounding_box_other_inputs
  inputs:
    bounding box:
      doc: bbox
      label: bbox
      type: string
    atmospheric correction:
      doc: atmospheric_correction
      label: atmospheric_correction
      type: boolean
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        bounding box: bounding box
        atmospheric correction: atmospheric correction
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
    bounding box:
      type: string
      inputBinding:
        position: 1
        prefix: --bounding box
    atmospheric correction:
       type: boolean
       inputBinding:
        position: 2
        prefix: --atmospheric correction
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