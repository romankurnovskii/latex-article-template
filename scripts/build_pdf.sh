#!/bin/bash

# Get current date and time in YYYY-MM-DD-HH-MM format
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M")

# Define the output PDF file name
OUTPUT_PDF="article-${TIMESTAMP}.pdf"

# Build the Docker image
docker build -t latex-compiler .

# Run the Docker container to compile the LaTeX file
docker run --rm -v "$(pwd)":/app latex-compiler /bin/bash -c \
    "latexmk -pdf -xelatex -outdir=./output main.tex && mv ./output/main.pdf ./output/${OUTPUT_PDF}"

# Move the final PDF to the project root
mv output/${OUTPUT_PDF} .

echo "PDF created: ${OUTPUT_PDF}"
