# Design a distributed key value caching system

(like Memcached/Redis)

```
App ⇔ Cache → Database
```

1. Check if entry is in cache
2. if in cache, read it
3. if not in cache, get from database, save to cache and read


## The amount of data

a few TBs

## Eviction strategy

1. FIFO
2. LRU
3. LFU

### See also

- <https://www.interviewbit.com/problems/lru-cache/>
- <https://leetcode.com/problems/lru-cache/>

## Access Pattern

- Write through cache
- Write around cache
- Write back cache

<https://www.computerweekly.com/feature/Write-through-write-around-write-back-Cache-explained>

## Points

- Latency
- Consistency
- Availability
