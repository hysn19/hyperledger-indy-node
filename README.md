# hyperledger-indy-node


## exec command

docker build --tag hyperledger-indy-node:0.1 . 
docker run -p 9701-9708:9701-9708 --name indy-node -d hyperledger-indy-node:0.1
docker exec -it indy-node /bin/bash

tail -f /var/log/indy/sandbox/Node1.log


## /etc/indy/indy_config.py
 
 ```bash
 # Current network

# Disable stdout logging
enableStdOutLogging = False

# Directory to store ledger.
LEDGER_DIR = '/var/lib/indy'

# Directory to store logs.
LOG_DIR = '/var/log/indy'

# Directory to store keys.
KEYS_DIR = '/var/lib/indy'

# Directory to store genesis transactions files.
GENESIS_DIR = '/var/lib/indy'

# Directory to store backups.
BACKUP_DIR = '/var/lib/indy/backup'

# Directory to store plugins.
PLUGINS_DIR = '/var/lib/indy/plugins'

# Directory to store node info.
NODE_INFO_DIR = '/var/lib/indy'
NETWORK_NAME = 'sandbox'
```



## sucess

Node1
2020-07-28 06:10:42,068|INFO|ordering_service.py|Node1:0 set last ordered as (0, 8)
2020-07-28 06:10:42,071|INFO|ordering_service.py|Node1:0 ordered batch request, view no 0, ppSeqNo 8, ledger 0, state root 9Y7F5NkZKyYCSMDRgm5wuULrM2ZwbBZ66r5NPJQokpLi, txn root 2koSg1fFQWTW9UBbN34xwEN4WJ8ZRKxXget2xRiSGmQy, audit root 3zR1RBBEE1LsaBFkK12HuSCkfSZRqPgdNYeKdXewHE2C, requests ordered 0, discarded 0
2020-07-28 06:10:42,076|INFO|ordering_service.py|Node1:0 set last ordered as (0, 9)
2020-07-28 06:10:42,079|INFO|ordering_service.py|Node1:0 ordered batch request, view no 0, ppSeqNo 9, ledger 2, state root DfNLmH4DAHTKv63YPFJzuRdeEtVwF5RtVnvKYHd8iLEA, txn root GKot5hBsd81kMupNCXHaqbhv3huEbxAFMLnpcX2hniwn, audit root BVJh73r3Xe6opnR6gPXStUSCSuJV4VUyLRDiq35dpQtP, requests ordered 0, discarded 0
2020-07-28 06:10:47,610|INFO|ordering_service.py|Node1:1 set last ordered as (0, 3)
2020-07-28 06:10:47,610|INFO|ordering_service.py|Node1:1 ordered batch request, view no 0, ppSeqNo 3, ledger 1, state root None, txn root None, audit root None, requests ordered 1, discarded 0
2020-07-28 06:10:47,636|INFO|ordering_service.py|Node1:0 set last ordered as (0, 10)
2020-07-28 06:10:47,641|INFO|ordering_service.py|Node1:0 ordered batch request, view no 0, ppSeqNo 10, ledger 1, state root HZPGt6zFyPmh9dbfzBsCt8DPDRSys3sFmXa4fD7fgULe, txn root 68BjKgSMRzpzQNzTrumHwn93ascFXQKZnf9ZAX5hMiiP, audit root 66n3ZfqU7s6wngZoFmdrFEa3Evm9xE3EG2yFEKwVa2uD, requests ordered 1, discarded 0

Node2
2020-07-28 06:10:42,076|INFO|ordering_service.py|Node2:0 set last ordered as (0, 8)
2020-07-28 06:10:42,081|INFO|ordering_service.py|Node2:0 ordered batch request, view no 0, ppSeqNo 8, ledger 0, state root 9Y7F5NkZKyYCSMDRgm5wuULrM2ZwbBZ66r5NPJQokpLi, txn root 2koSg1fFQWTW9UBbN34xwEN4WJ8ZRKxXget2xRiSGmQy, audit root 3zR1RBBEE1LsaBFkK12HuSCkfSZRqPgdNYeKdXewHE2C, requests ordered 0, discarded 0
2020-07-28 06:10:42,087|INFO|ordering_service.py|Node2:0 set last ordered as (0, 9)
2020-07-28 06:10:42,089|INFO|ordering_service.py|Node2:0 ordered batch request, view no 0, ppSeqNo 9, ledger 2, state root DfNLmH4DAHTKv63YPFJzuRdeEtVwF5RtVnvKYHd8iLEA, txn root GKot5hBsd81kMupNCXHaqbhv3huEbxAFMLnpcX2hniwn, audit root BVJh73r3Xe6opnR6gPXStUSCSuJV4VUyLRDiq35dpQtP, requests ordered 0, discarded 0
2020-07-28 06:10:47,643|INFO|ordering_service.py|Node2:0 set last ordered as (0, 10)
2020-07-28 06:10:47,646|INFO|ordering_service.py|Node2:0 ordered batch request, view no 0, ppSeqNo 10, ledger 1, state root HZPGt6zFyPmh9dbfzBsCt8DPDRSys3sFmXa4fD7fgULe, txn root 68BjKgSMRzpzQNzTrumHwn93ascFXQKZnf9ZAX5hMiiP, audit root 66n3ZfqU7s6wngZoFmdrFEa3Evm9xE3EG2yFEKwVa2uD, requests ordered 1, discarded 0
2020-07-28 06:10:47,646|INFO|ordering_service.py|Node2:1 set last ordered as (0, 3)
2020-07-28 06:10:47,647|INFO|ordering_service.py|Node2:1 ordered batch request, view no 0, ppSeqNo 3, ledger 1, state root None, txn root None, audit root None, requests ordered 1, discarded 0

Node3
2020-07-28 06:10:42,092|INFO|ordering_service.py|Node3:0 set last ordered as (0, 8)
2020-07-28 06:10:42,094|INFO|ordering_service.py|Node3:0 ordered batch request, view no 0, ppSeqNo 8, ledger 0, state root 9Y7F5NkZKyYCSMDRgm5wuULrM2ZwbBZ66r5NPJQokpLi, txn root 2koSg1fFQWTW9UBbN34xwEN4WJ8ZRKxXget2xRiSGmQy, audit root 3zR1RBBEE1LsaBFkK12HuSCkfSZRqPgdNYeKdXewHE2C, requests ordered 0, discarded 0
2020-07-28 06:10:42,101|INFO|ordering_service.py|Node3:0 set last ordered as (0, 9)
2020-07-28 06:10:42,103|INFO|ordering_service.py|Node3:0 ordered batch request, view no 0, ppSeqNo 9, ledger 2, state root DfNLmH4DAHTKv63YPFJzuRdeEtVwF5RtVnvKYHd8iLEA, txn root GKot5hBsd81kMupNCXHaqbhv3huEbxAFMLnpcX2hniwn, audit root BVJh73r3Xe6opnR6gPXStUSCSuJV4VUyLRDiq35dpQtP, requests ordered 0, discarded 0
2020-07-28 06:10:47,625|INFO|ordering_service.py|Node3:0 set last ordered as (0, 10)
2020-07-28 06:10:47,630|INFO|ordering_service.py|Node3:0 ordered batch request, view no 0, ppSeqNo 10, ledger 1, state root HZPGt6zFyPmh9dbfzBsCt8DPDRSys3sFmXa4fD7fgULe, txn root 68BjKgSMRzpzQNzTrumHwn93ascFXQKZnf9ZAX5hMiiP, audit root 66n3ZfqU7s6wngZoFmdrFEa3Evm9xE3EG2yFEKwVa2uD, requests ordered 1, discarded 0
2020-07-28 06:10:47,630|INFO|ordering_service.py|Node3:1 set last ordered as (0, 3)
2020-07-28 06:10:47,631|INFO|ordering_service.py|Node3:1 ordered batch request, view no 0, ppSeqNo 3, ledger 1, state root None, txn root None, audit root None, requests ordered 1, discarded 0

Node4
2020-07-28 06:10:42,090|INFO|ordering_service.py|Node4:0 set last ordered as (0, 8)
2020-07-28 06:10:42,093|INFO|ordering_service.py|Node4:0 ordered batch request, view no 0, ppSeqNo 8, ledger 0, state root 9Y7F5NkZKyYCSMDRgm5wuULrM2ZwbBZ66r5NPJQokpLi, txn root 2koSg1fFQWTW9UBbN34xwEN4WJ8ZRKxXget2xRiSGmQy, audit root 3zR1RBBEE1LsaBFkK12HuSCkfSZRqPgdNYeKdXewHE2C, requests ordered 0, discarded 0
2020-07-28 06:10:42,098|INFO|ordering_service.py|Node4:0 set last ordered as (0, 9)
2020-07-28 06:10:42,101|INFO|ordering_service.py|Node4:0 ordered batch request, view no 0, ppSeqNo 9, ledger 2, state root DfNLmH4DAHTKv63YPFJzuRdeEtVwF5RtVnvKYHd8iLEA, txn root GKot5hBsd81kMupNCXHaqbhv3huEbxAFMLnpcX2hniwn, audit root BVJh73r3Xe6opnR6gPXStUSCSuJV4VUyLRDiq35dpQtP, requests ordered 0, discarded 0
2020-07-28 06:10:47,625|INFO|ordering_service.py|Node4:0 set last ordered as (0, 10)
2020-07-28 06:10:47,630|INFO|ordering_service.py|Node4:0 ordered batch request, view no 0, ppSeqNo 10, ledger 1, state root HZPGt6zFyPmh9dbfzBsCt8DPDRSys3sFmXa4fD7fgULe, txn root 68BjKgSMRzpzQNzTrumHwn93ascFXQKZnf9ZAX5hMiiP, audit root 66n3ZfqU7s6wngZoFmdrFEa3Evm9xE3EG2yFEKwVa2uD, requests ordered 1, discarded 0
2020-07-28 06:10:47,630|INFO|ordering_service.py|Node4:1 set last ordered as (0, 3)
2020-07-28 06:10:47,630|INFO|ordering_service.py|Node4:1 ordered batch request, view no 0, ppSeqNo 3, ledger 1, state root None, txn root None, audit root None, requests ordered 1, discarded 0


## failure

Node1
2020-07-28 06:07:19,428|INFO|message_processor.py|Node1 discarding message ({'protocolVersion': 2, 'reqId': 1595916439387017332, 'operation': {'type': '1', 'dest': 'VVKag1sBnv7B7aYVEUZbEp', 'verkey': 'GXa725cSiPBCz3E9utm47TKNyQJu8VV4TA4CthQiCTeY', 'role': '101'}, 'identifier': '9VgkwQpKYrtsifJ3EN8toy', 'signature': '3nArUW4sNQHJZwZvCEi9jLhXAFKHyDmcPGMuce7uJhshmfNL6McsyAXVm1hX782AEFAPkjXwQVTdWdrwVRc3owra'}, b'M+qyf9Q1WWw3LkkYseEZyEs+U2vxJMKAQZnZCODu4mM=') because could not authenticate, verkey for 9VgkwQpKYrtsifJ3EN8toy cannot be found

Node2
2020-07-28 06:07:19,423|INFO|message_processor.py|Node2 discarding message ({'signature': '3nArUW4sNQHJZwZvCEi9jLhXAFKHyDmcPGMuce7uJhshmfNL6McsyAXVm1hX782AEFAPkjXwQVTdWdrwVRc3owra', 'operation': {'role': '101', 'dest': 'VVKag1sBnv7B7aYVEUZbEp', 'verkey': 'GXa725cSiPBCz3E9utm47TKNyQJu8VV4TA4CthQiCTeY', 'type': '1'}, 'reqId': 1595916439387017332, 'identifier': '9VgkwQpKYrtsifJ3EN8toy', 'protocolVersion': 2}, b'M+qyf9Q1WWw3LkkYseEZyEs+U2vxJMKAQZnZCODu4mM=') because could not authenticate, verkey for 9VgkwQpKYrtsifJ3EN8toy cannot be found

Node3
2020-07-28 06:07:19,425|INFO|message_processor.py|Node3 discarding message ({'identifier': '9VgkwQpKYrtsifJ3EN8toy', 'operation': {'role': '101', 'type': '1', 'dest': 'VVKag1sBnv7B7aYVEUZbEp', 'verkey': 'GXa725cSiPBCz3E9utm47TKNyQJu8VV4TA4CthQiCTeY'}, 'reqId': 1595916439387017332, 'signature': '3nArUW4sNQHJZwZvCEi9jLhXAFKHyDmcPGMuce7uJhshmfNL6McsyAXVm1hX782AEFAPkjXwQVTdWdrwVRc3owra', 'protocolVersion': 2}, b'M+qyf9Q1WWw3LkkYseEZyEs+U2vxJMKAQZnZCODu4mM=') because could not authenticate, verkey for 9VgkwQpKYrtsifJ3EN8toy cannot be found

Node4
2020-07-28 06:07:19,442|INFO|message_processor.py|Node4 discarding message ({'identifier': '9VgkwQpKYrtsifJ3EN8toy', 'protocolVersion': 2, 'reqId': 1595916439387017332, 'signature': '3nArUW4sNQHJZwZvCEi9jLhXAFKHyDmcPGMuce7uJhshmfNL6McsyAXVm1hX782AEFAPkjXwQVTdWdrwVRc3owra', 'operation': {'dest': 'VVKag1sBnv7B7aYVEUZbEp', 'type': '1', 'role': '101', 'verkey': 'GXa725cSiPBCz3E9utm47TKNyQJu8VV4TA4CthQiCTeY'}}, b'M+qyf9Q1WWw3LkkYseEZyEs+U2vxJMKAQZnZCODu4mM=') because could not authenticate, verkey for 9VgkwQpKYrtsifJ3EN8toy cannot be found
