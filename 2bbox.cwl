cwlVersion: v1.2
$graph:
- class: Workflow
  label: dps_tutorial_bounding_box_other_inputs
  doc: testing bbox
  id: dps_tutorial_bounding_box_other_inputs
  inputs:
    biomass bounding box:
      doc: Area of interest
      label: biomass bbox
      type: string
    output bounding box:
      doc: Where output should be generated for
      label: output bounding box
      type: string
    date:
      doc: Date to run analysis
      label: date
      type: string
      default: 2026-08-28
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        biomass bounding box: biomass bounding box
        output bounding box: output bounding box
        date: date
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
    biomass bounding box:
      type: string
      inputBinding:
        position: 1
        prefix: --biomass bounding box
    output bounding box:
      type: boolean
      inputBinding:
        position: 2
        prefix: --output bounding box
    date:
      type: string
      inputBinding:
        position: 3
        prefix: --date
      default: 2026-08-28
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