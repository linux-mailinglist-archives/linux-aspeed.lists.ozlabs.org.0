Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC258AE7
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2019 21:20:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZV9Z5NktzDqhT
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Jun 2019 05:20:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZV8b44XszDqjg
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Jun 2019 05:19:58 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RJGWFs027725
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2019 15:19:55 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2td2ndbf35-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2019 15:19:55 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 27 Jun 2019 20:19:54 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 20:19:50 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5RJJnLr61145392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 19:19:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB5A9136053;
 Thu, 27 Jun 2019 19:19:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B900213604F;
 Thu, 27 Jun 2019 19:19:48 +0000 (GMT)
Received: from [9.85.237.135] (unknown [9.85.237.135])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 19:19:48 +0000 (GMT)
Subject: Re: [PATCH v3 1/8] dt-bindings: soc: Add Aspeed XDMA engine binding
 documentation
To: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
References: <1559153408-31190-1-git-send-email-eajames@linux.ibm.com>
 <1559153408-31190-2-git-send-email-eajames@linux.ibm.com>
 <58b74556-cbf0-4da2-9392-4c4ac40ad760@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Thu, 27 Jun 2019 14:19:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <58b74556-cbf0-4da2-9392-4c4ac40ad760@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19062719-0012-0000-0000-00001749ABD0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011342; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224131; UDB=6.00644264; IPR=6.01005319; 
 MB=3.00027493; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-27 19:19:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062719-0013-0000-0000-000057DB5727
Message-Id: <c8d80e9a-6fa9-aa57-3b5f-e20b20dd0f66@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270220
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 5/30/19 12:30 AM, Andrew Jeffery wrote:
>
> On Thu, 30 May 2019, at 03:40, Eddie James wrote:
>> Document the bindings.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/soc/aspeed/xdma.txt        | 23 ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> new file mode 100644
>> index 0000000..85e82ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
>> @@ -0,0 +1,23 @@
>> +* Device tree bindings for the Aspeed XDMA Engine
>> +
>> +The XDMA Engine embedded in the AST2500 SOC can perform automatic DMA
>> +operations over PCI between the AST2500 (acting as a BMC) and a host
>> processor.
>> +
>> +Required properties:
>> +
>> + - compatible		"aspeed,ast2500-xdma"
>> + - reg			contains the offset and length of the memory region
>> +			assigned to the XDMA registers
>> + - resets		reset specifier for the syscon reset associated with
>> +			the XDMA engine
>> + - interrupts		the interrupt associated with the XDMA engine on this
>> +			platform
> The indentation is quite distracting. If you rev the series can you fix it?


I think the diff is throwing it off; it all lines up when applied.

Thanks,

Eddie


>
> Otherwise,
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
>> +
>> +Example:
>> +
>> +    xdma@1e6e7000 {
>> +        compatible = "aspeed,ast2500-xdma";
>> +        reg = <0x1e6e7000 0x100>;
>> +        resets = <&syscon ASPEED_RESET_XDMA>;
>> +        interrupts = <6>;
>> +    };
>> -- 
>> 1.8.3.1
>>
>>

