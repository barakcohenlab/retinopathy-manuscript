#!/usr/bin/env python3

import sys

def count_bcs(source, expected_bcs):
    expected_bcs_counts = dict.fromkeys(expected_bcs, 0)

    for bc in map(str.strip, source):
        if bc in expected_bcs_counts:
            expected_bcs_counts[bc] += 1
    
    return expected_bcs_counts

def write_bc_counts(counts, sink):
    sink.write("BC\tcount\n")
    for (BC, count) in counts.items():
        sink.write(f"{BC}\t{count}\n")

if __name__ == "__main__":
    expected_bcs = []
    with open(sys.argv[1], "r") as known_bc_file:
        expected_bcs = list(map(str.strip, known_bc_file))
    bc_counts = count_bcs(sys.stdin, expected_bcs)
    write_bc_counts(bc_counts, sys.stdout)
