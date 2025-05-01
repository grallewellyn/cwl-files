#!/usr/bin/env cwl-runner
arguments:
- -p
- input_stac_catalog_dir
- $(inputs.input.path)
- -p
- output_stac_catalog_dir
- $(runtime.outdir)
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- --cwd
- /home/jovyan
- output_nb.ipynb
- -f
- /tmp/inputs.json
- --log-output
- -k
- python3
class: Workflow
  label: grace-processcwl
  doc: altered description
  id: grace-processcwl
class: CommandLineTool
cwlVersion: v1.2
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
requirements:
  DockerRequirement:
    dockerPull: gllewellyn19/unity-example-application:c8813c74
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  InlineJavascriptRequirement: {}
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
s:version: 11