# Macro for randomising group names for blinding pre-analysis

## Background

This macro was developed to allow for automatic blinding pre-analysis but after acquisition of confocal images. I decided to use the ImageJ macro language since Fiji is capable of handling files with .lif extensions.

## How it works

The macro prompts the user to define the number and names of the groups of images that need to be blinded. It then randomly assigns a letter identifier for each group by using the Fisher-Yates shuffle algorithm and creates a key in .txt format. It then saves copies of blinded images and the key to a pre-defined directory while leaving the original images unchanged.