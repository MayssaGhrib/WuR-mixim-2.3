// ***********************************************************************************
//                 Copyright (C) 2022 Mayssa Ghribi,
//              mail :  mayssa.ghribi@enit.utm.tn
// ************************************************************************************
This example illustrates the use of the Wake-up Radio (WuR)- based simulation model implemented in MiXiM.

We consider a network with a star topology composed of N child nodes and one sink node. 
All child nodes use the transmitter-initiated mode, and they are connected to a common node (sink), which is acting as a gateway between the WSN and the users.
Only child nodes can generate traffic based on an exponential distribution and all generated packets are then addressed to the sink node. 
The time interval between two successive packets is distributed according to an exponential process. 
Specifically, the inter packet arrival time is equal to 1/λ where λ is the packet arrival rate per unit time.
We use a WuC duration of 6 ms with a WuC transmission rate of 5460 bps. We also consider two different delay limits of 12.5 ms and 15.
