# Introduction

Here is a script to improve runtime when testing some steps in heavy-ion collision simulations. 
The steps are MUSIC and iSS. MUSIC runs from an initial IPGlasma2D condition.

# Usage

Using it is very simple; just clone and compile the repository in the `codes` directory:

```bash
./get_music+iss.sh
./compile_code.sh
```
After that, just run the script:

```bash
./run_music+iSS.sh
```
You can also add your own parameters to the `input` as long as they are named exactly as they are here in the repository.


