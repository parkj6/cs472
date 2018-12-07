# [Simple Cache Simulator](https://oregonstate.instructure.com/courses/1689747/assignments/7404481)

## Cache Simulator that is:
* Configurable
* able to handle cashes with varying capacities
* block sizes
* levels of associativity
* replacement policies
* write policies

## Assumptions
1. Does not need to simulate actual data contents.
	* Pretend data is copied from "main memory" and keep track of hypotetical elapsed time.
2. When block is modified in cache or main meory, entire block is written.
	* Partial block updates is considered full block update.
3. All memory access occur only within single block at a time.

---
### Configuration File (arg1)
The first command line argument will be the path to the configuration file. 
This file contains information about the cache design. 
The file will contain only numeric values, each of which is on a separate line.

Example of a configuration file:
```
8 <-- number of sets in cache (will be a non-negative power of 2)
16 <-- block size in bytes (will be a non-negative power of 2)
3 <-- level of associativity (number of blocks per set)
1 <-- replacement policy (will be 0 for random replacement, 1 for LRU)
1 <-- write policy (will be 0 for write-through, 1 for write-back)
13 <-- number of cycles required to write or read a block from the cache
230 <-- number of cycles required to write or read a block from main memory
0 <-- cache coherence protocol (0 for simple implementation, 1 for MESI, only used for 572 projects)
```

Here is another example configuration file specifying:
* a direct-mapped cache
* 64 entries
* 32 byte block size
* associativity level of 1 (direct-mapped
* least recently used (LRU) replacement policy
* write-through operation
* 26 cycles to read or write data to the cache
* 1402 cycles to read or write data to the main memory.

```
64
32
1
1
0
26
1402
0
```

### Trace File (arg2)
* May generate our own using Valgrind (a memory debugging tool),
` valgrind --log-fd=1 --log-file=./tracefile.txt --tool=lackey --trace-mem=yes name_of_executable_to_trace `
* or use sample trace files from:
`/nfs/farm/classes/eecs/fall2018/cs472/public/tracefiles`

Trace files are in following format:
`[space][operation] [address(64bit hex)],[size of memory operation(dec)]`

Operation of trace files are:
* ‘I’ character represent an instruction load. (ignore)
	* For this assignment, you can ignore instruction read requests and assume that they are handled by a separate instruction cache.
* ‘S’ indicate a data store operation. 
	* This means that data needs to be written from the CPU into the cache or main memory (possibly both) depending on the write policy.
* ‘L’ indicate a data load operation. 
	* Data is loaded from the cache into the CPU.
* 'M' indicate a data modify operation.
	* which implies a special case of a data load, followed immediately by a data store.
* '=' are comments.

---
### Output
```
# example invocation of cache simulator
./cache_sim [config file] [trace file]
Output file written to [trace file].out
```
* Cache simulator requires 2 arguments on the command line:
1. the file path of a **configuration file** 
2. the file path of a **trace file** containing a sequence of memory operations. 

## Generated output contains:
* No. of cache misses, hits and evictions (No. of block replacement)
* Total no. of clock cycle used during the simulation
* Cache simulator will output the following:
``` 
[operation address],[size] [number of cycles] [cache impact]
Hits: [no. of hits] Misses: [no. of misses] Evictions: [no. of evictions]
Cycles: [no of total cycles simulated]
```
	* where [cache impact] indicates hit, miss or evictions.
	* and it could contain up to 3 impacts.
