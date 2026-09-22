cwlVersion: v1.2

$graph:
  - class: Workflow
    id: dps_tutorial_outputs
    label: DPS Tutorial Outputs
    doc: Testing multiple named outputs

    inputs:
      biomass_bounding_box:
        doc: Area of interest
        label: Biomass bounding box
        type: string

      create_bounding_box:
        doc: Whether to create the output bounding box
        label: Create bounding box
        type: boolean
        default: true

      date:
        doc: Date to run analysis
        label: Date
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
          biomass_bounding_box: biomass_bounding_box
          create_bounding_box: create_bounding_box
          date: date

        out:
          - output_geotiff
          - updated_boundingbox

  - class: CommandLineTool
    id: main

    requirements:
      DockerRequirement:
        dockerPull: gal16/dps_tutorial_outputs:mmgis-mapable

      NetworkAccess:
        networkAccess: true

      ResourceRequirement:
        ramMin: 1
        coresMin: 1
        outdirMax: 20

    baseCommand:
      - /app/dps_tutorial/mapable_algorithm_outputs/run_alg.sh

    inputs:
      biomass_bounding_box:
        type: string
        inputBinding:
          position: 1
          prefix: "--biomass-bounding-box"

      create_bounding_box:
        type: boolean
        inputBinding:
          position: 2
          prefix: "--create-bounding-box"

      date:
        type: string
        default: "2026-08-28"
        inputBinding:
          position: 3
          prefix: "--date"

    outputs:
      output_geotiff:
        type: File
        format: https://www.iana.org/assignments/media-types/image/tiff
        outputBinding:
          glob: output_geotiff.tif

      updated_boundingbox:
        type: File
        format: https://www.iana.org/assignments/media-types/application/geo+json
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