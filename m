Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE208B3879
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 15:32:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6TIJZJX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQtv85fscz3cXW
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 23:32:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6TIJZJX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQtv26nkGz3cWk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 23:32:30 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QDRP9P027305;
	Fri, 26 Apr 2024 13:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=68d1wHYr0THvLHrFqO+EQYeAxXsNOhERLZBrbFoMOLc=;
 b=j6TIJZJXO7GOuzE2lEQrrkpspBICAfpwo+XFBP6dRpJ4GM7NdJO8YIHY47Y+kcodlu4k
 zT/NN/Z5KY9Nv7rUTop7n1n5bG/vNNcBi/O4bwrveY3u2jc0ffxrFoVrszpAQBmuxFMU
 Gj0udE8D2cTzVYTNJHLBYTHgCvQb+SuuG1en2m6UiKex51YZxM6qdfO/wzMoi6rQkuZJ
 ZgPUk3E9/uDKdGapLSwG+RR/PjeiiFMwxl73kFtktp7LbtWiYt8jpLKisrMzZNgnqIHe
 4TffVKAETUMLuHSLJ+MPTg9UaB/sD+PxBXlxvRnoP+eAMdb7clpIPkFlHm++aNeF3fQr Ng== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrd5qg0gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:32:23 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QAm19H028653;
	Fri, 26 Apr 2024 13:32:22 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2yfp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:32:22 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QDWJcV42533302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 13:32:21 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B577558061;
	Fri, 26 Apr 2024 13:32:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 861E05805F;
	Fri, 26 Apr 2024 13:32:19 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 13:32:19 +0000 (GMT)
Message-ID: <da7bd5a5-6795-4ac9-8529-7dc3596061f9@linux.ibm.com>
Date: Fri, 26 Apr 2024 08:32:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IBM P11 BMC boards
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org
References: <20240415154931.10775-1-eajames@linux.ibm.com>
 <48ad6bcccae315e68bc0aa10669eed645c495139.camel@codeconstruct.com.au>
 <7dd9ba1b-6477-4c09-a571-57002cbfa8b7@linux.ibm.com>
 <6357235a4a42e889a2b6d7d7ad5511ded4cc29d8.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <6357235a4a42e889a2b6d7d7ad5511ded4cc29d8.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O93TGq3cb5fRchxfObB7xzkNaGqHiDnQ
X-Proofpoint-GUID: O93TGq3cb5fRchxfObB7xzkNaGqHiDnQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260090
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: lakshmiy@us.ibm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/25/24 19:03, Andrew Jeffery wrote:
> On Thu, 2024-04-25 at 16:41 -0500, Eddie James wrote:
>> On 4/15/24 19:02, Andrew Jeffery wrote:
>>> On Mon, 2024-04-15 at 10:49 -0500, Eddie James wrote:
>>>> Add the Blueridge and Fuji BMC systems.
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>> Changes since v1:
>>>>    - Change "ody" to "odyssey"
>>>>
>>>>    arch/arm/boot/dts/aspeed/Makefile             |    2 +
>>>>    .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1752 +++++++
>>>>    .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 4016 +++++++++++++++++
>>>>    .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1704 +++++++
>>>>    4 files changed, 7474 insertions(+)
>>> A few points:
>>>
>>> - Altogether this patch is pretty large. Can we do one for each of the
>>> FSI topology and the platforms?
>>>
>>> - The only list to which you've sent the patch is linux-aspeed, which
>>> doesn't appear to be archived on lore. Can you please add at least one
>>> that is? There are a few that should probably be included regardless.
>>>
>>> - I don't plan to merge the patch until it has had review from ideally
>>> more than one other IBMer
>>>
>>> On the review front:
>>>
>>> It looks like you still need to update
>>> Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml with the new
>>> platform compatible strings.
>>>
>>> Also, can you please run
>>>
>>> ```
>>> make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-{blueridge,fuji}.dtb
>>> ```
>>>
>>> and address the warnings? This is best done by first applying the patch
>>> on top of my tree below. It goes some way to eliminating many of the
>>> warnings currently produced for the Aspeed BMC SoCs:
>>>
>>> https://github.com/amboar/linux/tree/dt-warnings/all
>>
>> Thanks, I've sent v3. One patch has turned into 14 to address the
>> warnings...
>>
> Super work, thanks for that.
>
>>   There were still many but they're almost all from
>> aspeed-g6.dtsi.
>>
> This is based on top of my WIP series fixing a bunch of warnings, or on
> top of an upstream tag for submission? Admittedly I didn't fix them all
> but I did clean up a decent chunk of what was there.


For submission I rebased on next, but when checking warnings I used your 
tree. Here's my output:


DTC_CHK arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
sdram@1e6e0000: compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is 
too long
     from schema $id: 
http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
ahb: apb: { ... } should not be valid under {'type': 'object'}
     from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
     from schema $id: 
http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
ethernet@1e670000: Unevaluated properties are not allowed 
('#address-cells', '#size-cells' were unexpected)
     from schema $id: 
http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
ethernet@1e690000: Unevaluated properties are not allowed 
('#address-cells', '#size-cells' were unexpected)
     from schema $id: 
http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: 
'^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', 
'^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with 
compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/display@1e6e6000: failed to match any schema with compatible: 
['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: 
['aspeed,ast2600-xdma']
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
adc@1e6e9000: 'interrupts' does not match any of the regexes: 
'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
adc@1e6e9100: 'interrupts' does not match any of the regexes: 
'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 
'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
gpio@1e780000: 'i2c3_mux_oe_n-hog', 'usb_power-hog' do not match any of 
the regexes: 'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with 
compatible: ['aspeed,ast2600-lhc']
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
sdc@1e750000: sdhci@1e750100: Unevaluated properties are not allowed 
('compatible' was unexpected)
     from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
sdc@1e750000: sdhci@1e750100:compatible: ['aspeed,ast2600-sdhci'] is too 
short
     from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@200/pca9552@61: failed to match any schema 
with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@0/pca9551@60: failed to 
match any schema with compatible: ['nxp,pca9551']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@300/i2c-mux@70/i2c@0/pca9551@60: failed to 
match any schema with compatible: ['nxp,pca9551']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@300/i2c-mux@70/i2c@1/pca9551@61: failed to 
match any schema with compatible: ['nxp,pca9551']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@30: failed to match any schema 
with compatible: ['ibm,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@31: failed to match any schema 
with compatible: ['ibm,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@32: failed to match any schema 
with compatible: ['ibm,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@33: failed to match any schema 
with compatible: ['ibm,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/max31785@52: failed to match any 
schema with compatible: ['maxim,max31785a']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9551@60: failed to match any schema 
with compatible: ['nxp,pca9551']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@400/pca9552@61: failed to match any schema 
with compatible: ['nxp,pca9552']
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
dps310@76: '#io-channel-cells' does not match any of the regexes: 
'pinctrl-[0-9]+'
     from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@480/pca9552@60: failed to match any schema 
with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@480/pca9552@61: failed to match any schema 
with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-mux@70/i2c@0/pca9551@60: failed to 
match any schema with compatible: ['nxp,pca9551']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@700/pca9552@60: failed to match any schema 
with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@780/pca9552@60: failed to match any schema 
with compatible: ['nxp,pca9552']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/bus@1e78a000/i2c-bus@800/pca9552@60: failed to match any schema 
with compatible: ['nxp,pca9552']
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is 
too long
     from schema $id: 
http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
fsi@1e79b000: Unevaluated properties are not allowed ('compatible' was 
unexpected)
     from schema $id: 
http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/fsi@1e79b000: failed to match any schema with compatible: 
['aspeed,ast2600-fsi-master', 'fsi-master']
/home/eajames/devel/linux-2/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is 
too long
     from schema $id: 
http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/fsi@1e79b100: failed to match any schema with compatible: 
['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: 
/ahb/apb/dma-controller@1e79e000: failed to match any schema with 
compatible: ['aspeed,ast2600-udma']


>
>>   The only remaining ones from Blueridge/Fuji that I saw
>> were for undocumented compatibles for max31785 and pca955x.
>>
> Fantastic.
>
>> Those
>> bindings exist but are not in yaml format so the tool doesn't pick them
>> up. I'm sure those can be addressed at another time...
> Yep, sounds good.
>
> Thanks for your efforts.
>
> Andrew
>
