 cwlVersion: v1.2

$graph:
  - class: Workflow
    label: dps_tutorial_outputs
    doc: testing bbox
    id: dps_tutorial_outputs

    inputs:
      biomass bounding box:
        doc: Area of interest
        label: biomass bbox
        type: string

      create bounding box:
        doc: Where output should be generated for
        label: create bounding box
        type: string

      date:
        doc: Date to run analysis
        label: date
        type: string
        default: "2026-08-28"

    outputs:
      output_geotiff:
        type: File
        outputSource: process/output_geotiff

      updated_boundingbox:
        type: File
        outputSource: process/updated_boundingbox

    steps:
      process:
        run: "#main"

        in:
          biomass bounding box: biomass bounding box
          create bounding box: create bounding box
          date: date

        out:
          - output_geotiff
          - updated_boundingbox

  - class: CommandLineTool
    id: main

    requirements:
      DockerRequirement:
        dockerPull: gal16/dps_tutorial_outputs:mmgis-mapable
        networkAccess: true

      ResourceRequirement:
        ramMin: 1
        coresMin: 1
        outdirMax: 20

    baseCommand: /app/dps_tutorial/mapable_algorithm_bbox/run_alg.sh

    inputs:
      biomass bounding box:
        type: string
        inputBinding:
          position: 1
          prefix: "--biomass bounding box"

      create bounding box:
        type: boolean
        inputBinding:
          position: 2
          prefix: "--create bounding box"

      date:
        type: string
        inputBinding:
          position: 3
          prefix: "--date"
        default: "2026-08-28"

    outputs:
      output_geotiff:
        type: File
        outputBinding:
          glob: output_geotiff.tif

      updated_boundingbox:
        type: File
        outputBinding:
          glob: updated_boundingbox.geojson

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