#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Ciao', 'Hello', 'Hola'

process sayHello {

  publishDir params.output_folder, mode: 'copy'
  echo true
  input: 
    val x from cheers
  output:
    path "*.txt" into outfiles
  script:
    """
    echo '$x world!' > "${x}_${params.filename}"
    """
}
