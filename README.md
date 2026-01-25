# The Jamel Project
The goal of this project is to write a full stack compiler from ILP to
RISC-V.

The project is decomposed into two independant sub-projects:
- The conversion from ILP to Tree (Java, ~30% of the final grade)
- The conversion from Tree to RISC-V (OCaml, ~70% of the final grade)

Each subproject is described in depth in the corresponding directory
`ilp_to_tree` and `tree_to_risc`

### First Steps
run `chmod +x configure.sh; ./configure.sh`. This will guide you
through installing the requirements of the project.

run `make`. This will compile the two sub-projects.

run `./jamel.sh Samples/u01-1.ilpml`. This will compile the ilp source file and produce
(among other things) the riscv file: Samples/u01-1.s.

run `ls Samples/u01-1.*` and examine the produced files.

You can also execute run `./jamel.sh --check Samples/u01-1.ilpml` to
verify that the checkpoints representations (hir,lir,riscv) run
correctly.

run `make test`. This will lauch `./jamel.sh --check` on all ilpml
files of the Samples directory.