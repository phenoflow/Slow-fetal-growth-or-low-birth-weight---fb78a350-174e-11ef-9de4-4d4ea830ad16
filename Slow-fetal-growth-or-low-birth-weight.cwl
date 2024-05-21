cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  slow-fetal-growth-or-low-birth-weight-fetus---primary:
    run: slow-fetal-growth-or-low-birth-weight-fetus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  birthweight---primary:
    run: birthweight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-fetus---primary/output
  slow-fetal-growth-or-low-birth-weight-malnutrition---primary:
    run: slow-fetal-growth-or-low-birth-weight-malnutrition---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: birthweight---primary/output
  slow-fetal-growth-or-low-birth-weight-gestation---primary:
    run: slow-fetal-growth-or-low-birth-weight-gestation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-malnutrition---primary/output
  slow-fetal-growth-or-low-birth-weight-problem---primary:
    run: slow-fetal-growth-or-low-birth-weight-problem---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-gestation---primary/output
  slow-fetal-growth-or-low-birth-weight---primary:
    run: slow-fetal-growth-or-low-birth-weight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-problem---primary/output
  premature-slow-fetal-growth-or-low-birth-weight---primary:
    run: premature-slow-fetal-growth-or-low-birth-weight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight---primary/output
  slow-fetal-growth-or-low-birth-weight-delivered---primary:
    run: slow-fetal-growth-or-low-birth-weight-delivered---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: premature-slow-fetal-growth-or-low-birth-weight---primary/output
  slow-fetal-growth-or-low-birth-weight-unspecified---primary:
    run: slow-fetal-growth-or-low-birth-weight-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-delivered---primary/output
  other-slow-fetal-growth-or-low-birth-weight---primary:
    run: other-slow-fetal-growth-or-low-birth-weight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-unspecified---primary/output
  slow-fetal-growth-or-low-birth-weight-retardation---primary:
    run: slow-fetal-growth-or-low-birth-weight-retardation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: other-slow-fetal-growth-or-low-birth-weight---primary/output
  slow-fetal-growth-or-low-birth-weight-mention---primary:
    run: slow-fetal-growth-or-low-birth-weight-mention---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-retardation---primary/output
  slow-fetal-growth-or-low-birth-weight-nos---primary:
    run: slow-fetal-growth-or-low-birth-weight-nos---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-mention---primary/output
  growth---primary:
    run: growth---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: slow-fetal-growth-or-low-birth-weight-nos---primary/output
  birth---primary:
    run: birth---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: growth---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: birth---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
