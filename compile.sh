#!/usr/bin/env bash

typst compile --input answers=true  FUP_manual.typ FUP_manual.pdf
typst compile --input answers=false FUP_manual.typ FUP_manual_without_answers.pdf
