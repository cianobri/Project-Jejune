
=== Introduction ===
#bgm:introduction
{Somewhere, high above the Indian ocean. | Init.NATO_RFprotocol.IP.ping ...SUCCESS!}
* [Where the sky is black.] -> Handshake
+ {Handshake} [Commence handshake.] -> MetalGroan

== Handshake
> [2113-10-05] Handshake received [COM_9]. Tunnelling...
> ...
> ...
> Terminal link established with unknown vessel.
+ [Request CHECKSUM.] -> Checksum

== Checksum ==
> Received, registered vessel {distressedVesselName} [{distressedVesselCallSign}].
+ [Request register of the vessel {distressedVesselName}.] -> Register

== MetalGroan
{The Abukuma groans under the stress of contact. | The main engine of the Toeplitz subtly changes pitch.}
+ [Start communication uplink.] -> ComUplink
+ [Ship Register.] -> JejuneInfo
+ [Request Abukuma vessel register.] -> Register
+ [Start docking protocol.] -> Docking

== JejuneInfo
> Fetching your vessel information...

>           NAME: {myVesselName}
>      CALL-SIGN: {myVesselCallSign}
>         NUMBER: NATO-ENG-2102-11
>    CONSTRUCTED: 2102-11-23
>  GROSS TONNAGE: 17964
>  NATO VRI TYPE: Engineering Support
+ [Close.] -> MetalGroan

== Register
>           NAME: {distressedVesselName}
>      CALL-SIGN: {distressedVesselCallSign}
>         NUMBER: NATO-SCI-2098-02
>    CONSTRUCTED: 2098-02-11
>  GROSS TONNAGE: 130634
>  NATO VRI TYPE: High altitude platform [Zone 6]
 
+ [Request the location of the Abukuma.] -> AbukumaLocation
+ [Get COM log.] -> ComLog
+ [Return.] -> MetalGroan

== ComLog
> RECEIVED: 2113-10-02 / 13:21:01 UTC.
> FROM: [{aiName}] LargeKernelModel@{distressedVesselName}.nato
> ___________________________________
> THIS IS AN AUTOMATED STATUS REPORT.
>
> Low pressure detected in strut L7. 
>
> ___________________________________
> "No trees were killed in sending this message, but a number of electrons were inconvenienced."
+ [Next.] -> ComLog2

==ComLog2
> RECEIVED: 2113-10-02 / 15:26:35 UTC.
> FROM: [{aiName}] LargeKernelModel@{distressedVesselName}.nato
> ___________________________________
> THIS IS AN AUTOMATED STATUS REPORT.
>
> Involuntary altitude descent.
>
> ___________________________________
> "No trees were killed in sending this message, but a number of electrons were inconvenienced."
+ [Next.] -> ComLog3

==ComLog3
> RECEIVED: 2113-10-02 / 18:35:55 UTC.
> FROM: {aiName}] LargeKernelModel@{distressedVesselName}.nato
> ___________________________________
> THIS IS AN AUTOMATED STATUS REPORT.
>
> Uncontrolled altitude descent. Starting MAYDAY sequence.
>
> ___________________________________
> "No trees were killed in sending this message, but a number of electrons were inconvenienced."
+ [Next.] -> ComLog4

==ComLog4
> RECEIVED: 2113-10-02 / 18:35:55 UTC.
> FROM: [{aiName}] LargeKernelModel@{distressedVesselName}.nato
> ___________________________________
> THIS IS AN AUTOMATED STATUS REPORT.
> 
> ÿÿrrrÿeeeÿTTTÿKKKÿEEEÿGGGÿNNNÿ M]A]Y]D]A]Y > PPPÿQQQÿPPPÿOOOÿOOOÿOOOÿMMMÿNNNÿMMMÿJJJÿJJJÿJJJÿIIIÿIIIÿGGGÿGGGÿGGGÿGGGÿGGGÿEEEÿEEEÿEEEÿDDDÿDDDÿCCCÿBBBÿBBBÿBBBÿ@@@ÿAAAÿ@@@ÿ???ÿ???ÿ>>>ÿ===ÿ<<<ÿ<<<ÿ;;;ÿ;;;ÿ999ÿ999ÿ888ÿ999ÿ888ÿ6 ERROR 66ÿ666ÿ666ÿ555ÿ444ÿ444ÿ333ÿ222ÿ222ÿ111ÿ111ÿ000ÿ000ÿ000ÿÿ---ÿ---ÿ---ÿ,,,ÿ+++ÿ+++ÿ+++ÿ+
`6 uî2ÀHƒÄ(Ã°ë÷ÌÌ
uî2ÀHI have been @ good {aiName} :)uî2ÀH
uî2ÀHI have been @ good {aiName} :)uî2ÀH
OOÿOOOÿOOOÿMMMÿNNNÿMMMÿJJJÿJJJÿJJJÿIIIÿIIIÿGGGÿGGGÿGGGÿGGGÿGGGÿEEEÿEEEÿEEEÿDDDÿDDDÿCCCÿBBBÿBBBÿBBBÿ@@@ÿAAAÿ@@@ÿ???ÿ???ÿ>>>ÿ===ÿ<<<
;
;
.
+ [Return.] -> MetalGroan

== AbukumaLocation
REFERENCE FRAME: Earth Standard Frame 
     LATITUDE: -10.70
    LONGITUDE:  65.02
ALTITUDE INFO: 108,234m above sea level [G ~ 9.47m/s^2].
+ [Return.] -> Register

== ComUplink ==
... FAIL [Packet loss threshold exceeded]
... FAIL [Packet loss threshold exceeded]
... FAIL [Packet loss threshold exceeded] 
+ [Abort uplink.] -> MetalGroan

== Docking ==
Initializing...
> pLock 1 SUCCESS!
> pLock 2 SUCCESS!
> pLock 3 SUCCESS!
> pLock 4 SUCCESS!
> pLock 5 SUCCESS!
> ...
> Verifying vacuum seal... SUCCESS!
> Verifying pressure... SUCCESS!
> Docking routine complete.

+ [Quit terminal.] -> Main