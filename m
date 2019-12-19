Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF23126616
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 16:49:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dxBd2J7SzDqsX
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Dec 2019 02:49:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dxBQ6nDMzDqlY
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Dec 2019 02:49:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJFljJv132736; Thu, 19 Dec 2019 10:48:47 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x0a9npec1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 10:48:46 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBJFlulW009200;
 Thu, 19 Dec 2019 15:48:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2wvqc7be7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 15:48:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJFmirc55050534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 15:48:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87DF8BE053;
 Thu, 19 Dec 2019 15:48:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1860DBE04F;
 Thu, 19 Dec 2019 15:48:43 +0000 (GMT)
Received: from [9.211.143.195] (unknown [9.211.143.195])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 15:48:43 +0000 (GMT)
Subject: Re: [PATCH v3 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
To: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
References: <1576681778-18737-1-git-send-email-eajames@linux.ibm.com>
 <1576681778-18737-6-git-send-email-eajames@linux.ibm.com>
 <73cbffea-89f1-4212-99af-10c32968cf15@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <45cabf88-063d-aea1-6c2b-fa8cc0d8cbd3@linux.ibm.com>
Date: Thu, 19 Dec 2019 09:48:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <73cbffea-89f1-4212-99af-10c32968cf15@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_04:2019-12-17,2019-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190131
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 12/18/19 5:12 PM, Andrew Jeffery wrote:
>
> On Thu, 19 Dec 2019, at 01:39, Eddie James wrote:
>> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes since v2:
>>   - Remove 'sdmc', rename 'vga-mem' to 'memory'
>>
>>   .../devicetree/bindings/soc/aspeed/xdma.txt   | 40 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 +++
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> new file mode 100644
>> index 000000000000..58253ea1587b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> @@ -0,0 +1,40 @@
>> +Aspeed AST25XX and AST26XX XDMA Engine
>> +
>> +The XDMA Engine embedded in the AST2500 and AST2600 SOCs can perform
>> automatic
>> +DMA operations over PCI between the SOC (acting as a BMC) and a host
>> processor.
>> +
>> +Required properties:
>> + - compatible		: must be "aspeed,ast2500-xdma" or
>> +			  "aspeed,ast2600-xdma"
>> + - reg			: contains the address and size of the memory region
>> +			  associated with the XDMA engine registers
>> + - clocks		: clock specifier for the clock associated with the
>> +			  XDMA engine
>> + - resets		: reset specifier for the syscon reset associated with
>> +			  the XDMA engine
>> + - interrupts-extended	: two interrupt cells; the first specifies the
>> global
>> +			  interrupt for the XDMA engine and the second
>> +			  specifies the PCI-E reset or PERST interrupt.
>> + - scu			: a phandle to the syscon node for the system control
>> +			  unit of the SOC
> I think this should be aspeed,scu.


Sure.


>
>> + - memory		: contains the address and size of the memory area to
>> +			  be used by the XDMA engine for DMA operations
> Hmm, I was thinking more like a phandle to a reserved memory region,
> like we have in the aspeed-lpc-ctrl binding.


I think I mentioned before, but that doesn't work with the VGA memory. 
Linux can't reserve it. I haven't quite understood what happens in the 
memory system but I've tried it and it didn't work.


>
>> +
>> +Optional properties:
>> + - pcie-device		: should be either "bmc" or "vga", corresponding to
>> +			  which device should be used by the XDMA engine for
>> +			  DMA operations. If this property is not set, the XDMA
>> +			  engine will use the BMC PCI-E device.
>> +
>> +Example:
>> +
>> +    xdma@1e6e7000 {
>> +        compatible = "aspeed,ast2500-xdma";
>> +        reg = <0x1e6e7000 0x100>;
>> +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
>> +        resets = <&syscon ASPEED_RESET_XDMA>;
>> +        interrupts-extended = <&vic 6>, <&scu_ic
>> ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
>> +        scu = <&syscon>;
>> +        pcie-device = "bmc";
>> +        memory = <0x9f000000 0x01000000>;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ac9c120d192b..8a14d4268bdc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2708,6 +2708,12 @@ S:	Maintained
>>   F:	drivers/media/platform/aspeed-video.c
>>   F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>>   
>> +ASPEED XDMA ENGINE DRIVER
>> +M:	Eddie James <eajames@linux.ibm.com>
>> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> +
>>   ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>>   M:	Corentin Chary <corentin.chary@gmail.com>
>>   L:	acpi4asus-user@lists.sourceforge.net
>> -- 
>> 2.24.0
>>
>>
