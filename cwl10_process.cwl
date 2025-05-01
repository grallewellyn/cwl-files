cwlVersion: v1.2
$graph:
- class: Workflow
  label: grace-processcwl
  doc: altered description
  id: grace-processcwl
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
      run: '#main'
      in:
        bbox: bbox
        stac_catalog_folder: stac_catalog_folder
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
    example_argument_bool:
        default: true
        type: boolean
    example_argument_empty:
        default: null
        type: string
    example_argument_float:
        default: 1.0
        type: float
    example_argument_int:
        default: 1
        type: int
    example_argument_string:
        default: string
        type: string
    input: Directory
    output_collection:
        default: urn:nasa:unity:unity:dev:unity-example-application___1
        type: string
    summary_table_filename:
        default: summary_table.txt
        type: string
    outputs:
        output:
            outputBinding:
            glob: $(runtime.outdir)
            type: Directory
        process_output_nb:
            outputBinding:
            glob: $(runtime.outdir)/output_nb.ipynb
            type: File
s:author:
- class: s:Person
  s:name: arthurduf
s:contributor:
- class: s:Person
  s:name: arthurduf
s:citation: https://github.com/MAAP-Project/sardem-sarsen.git
s:codeRepository: https://github.com/MAAP-Project/sardem-sarsen.git
s:dateCreated: 2025-04-15
s:license: https://github.com/MAAP-Project/sardem-sarsen/blob/main/LICENSE
s:softwareVersion: 1.0.0
s:version: 10
s:releaseNotes: None
s:keywords: ogc, sar
$namespaces:
  s: https://schema.org/
$schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf