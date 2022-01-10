cwlVersion: v1.0
class: Workflow

label: Main workflow for hello-world project

# Define inputs and outputs of entire workflow
inputs:
    input_nb: File
    output_nb: string
    parameters: File

outputs:
  example_out:
    type: File

# Steps that describe the actual workflow
steps:
  stage_in:
    run: hello-world.cwl
    in:
      input_nb: input_nb
      output_nb: output_nb
      parameters: parameters

    out:
      [example_out]

  process:
    run: process.cwl
    in:
      input_nb: input_nb
      output_nb: output_nb
      parameters: parameters
    out:
      [example_out]

  stage_out:
    run: stage_out.cwl
    in:
      input_nb: input_nb
      output_nb: output_nb
      parameters: parameters

    out:
      [example_out]
