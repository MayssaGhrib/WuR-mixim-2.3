//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package org.mixim.modules.mac;

import org.mixim.base.modules.BaseMacLayer;
simple D2MACWuR extends BaseMacLayer
{
    parameters:
		@class(D2MACWuR);
        // debug switch
        bool debug = default(false);
        bool stats = default(true);
        bool trace = default(false);

        // length of MAC header
        headerLength @unit(bit) = default(0 bit);//32
        // size of the MAC queue (maximum number of packets in Tx buffer)
        double queueLength = default(100); //par d�faut c'�tait 100 2 comme dans cca-wur et adp-wur
        // bit rate default(250000 bps);
        double bitrate @unit(bps) = default(50000 bps);        
          
        // Clear Channel Assessment detection time
        double ccaDetectionTime @unit(s) = default(0.000128 s); // 8 symbols 0.00192 s //0.000128
        // Time to setup radio to reception state
        double rxSetupTime @unit(s);
        // Time to switch radio from Rx to Tx state
        double aTurnaroundTime @unit(s) = default(0.000192 s);    // 12 symbols 0.000192
        //tx power [mW]
        double txPower @unit(mW);
        
        // Send/Expect MAC acks for unicast traffic?
        bool useMACAcks;
        // maximum number of frame retransmission
        // only used when usage of MAC acks is enabled
        double macMaxFrameRetries = default(3);        
        // time to wait for an acknowledgement after transmitting a unicast frame.
        // only used when usage of MAC acks is enabled
        double macAckWaitDuration @unit(s) = default(0.00056 s);  // 1+12+10+12 symbols
        // complete MAC ack message length (in bits) 
        // (! headerLength is not added to this)
        // only used when usage of MAC acks is enabled
        double ackLength @unit(bit) = default(40 bit);   
        // simple interframe space. Time to wait between receiving a frame and acknowledging it.
        // Should be bigger than the maximum time for switching between Tx and Rx at the receiver.
        // only used when usage of MAC acks is enabled
        double sifs @unit(s) = default(0.000192 s); // 12 symbols
        
        double macCritDelay @unit(s) = default(0.0081 s);//0.005// 0.00856  0.01112  0.01368  0.006578  0.006578
        
        //backoff method to use: constant, linear or exponential
        string backoffMethod = default("exponential");
        // maximum backoffs
        double macMaxCSMABackoffs = default(5);
        // base unit for all backoff calculations
        double aUnitBackoffPeriod @unit(s) = default(0.00032 s);
        // # of backoff periods of the initial contention window
        // (for linear and constant backoff method only)
        int contentionWindow = default(8);
        // minimum backoff exponent (for exponential backoff method only)
        double macMinBE = default(3);
        // maximum backoff exponent (for exponential backoff method only)
        double macMaxBE = default(8);
}
