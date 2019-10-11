Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA859D3EB8
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 13:48:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qR6V1vdczDqXq
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 22:48:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qR6L3RtJzDqPy
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 22:48:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9BBli29074823
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 07:48:02 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vjptme1vm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 07:48:02 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <clg@kaod.org>;
 Fri, 11 Oct 2019 12:48:00 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 12:47:56 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9BBlO0P14352764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 11:47:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7A69AE057;
 Fri, 11 Oct 2019 11:47:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C88AAAE051;
 Fri, 11 Oct 2019 11:47:54 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 11:47:54 +0000 (GMT)
Received: from yukon.kaod.org (sig-9-145-63-191.uk.ibm.com [9.145.63.191])
 by smtp.tls.ibm.com (Postfix) with ESMTP id ADEA422003A;
 Fri, 11 Oct 2019 13:47:53 +0200 (CEST)
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
 <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
 <20191011084503.5b7a7c2c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3836fcc4-c8b0-ed04-0c52-7c642794ecb8@kaod.org>
 <20191011115129.3897cd17@dhcp-172-31-174-146.wireless.concordia.ca>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Fri, 11 Oct 2019 13:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011115129.3897cd17@dhcp-172-31-174-146.wireless.concordia.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101111-0016-0000-0000-000002B72824
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101111-0017-0000-0000-000033183A1A
Message-Id: <026b5c55-194c-934f-e039-7c4d28861d53@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110113
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/10/2019 11:51, Boris Brezillon wrote:
> On Fri, 11 Oct 2019 11:29:49 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> On 11/10/2019 08:45, Boris Brezillon wrote:
>>> On Thu, 10 Oct 2019 23:47:45 +0000
>>> Joel Stanley <joel@jms.id.au> wrote:
>>>   
>>>> On Wed, 9 Oct 2019 at 20:56, Boris Brezillon
>>>> <boris.brezillon@collabora.com> wrote:  
>>>>>
>>>>> Hi Cedric,
>>>>>
>>>>> On Fri,  4 Oct 2019 13:59:03 +0200
>>>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>>>    
>>>>>> Hello,
>>>>>>
>>>>>> This series first extends the support for the Aspeed AST2500 and
>>>>>> AST2400 SMC driver. It adds Dual Data support and read training giving
>>>>>> the best read settings for a given chip. Support for the new AST2600
>>>>>> SoC is added at the end.
>>>>>>
>>>>>> I understand that a new spi_mem framework exists and I do have an
>>>>>> experimental driver using it. But unfortunately, it is difficult to
>>>>>> integrate the read training. The Aspeed constraints are not compatible
>>>>>> and i haven't had the time to extend the current framework.    
>>>>>
>>>>> Hm, I don't think that's a good reason to push new features to the
>>>>> existing driver, especially since I asked others to migrate their
>>>>> drivers to spi-mem in the past. I do understand your concerns, and I'll
>>>>> let the SPI NOR/MTD maintainers make the final call, but I think it'd
>>>>> be better for the SPI MEM ecosystem to think about this link-training
>>>>> API (Vignesh needs it for the Cadence driver IIRC) rather than pushing
>>>>> this kind of feature to spi-nor controller drivers.    
>>>>
>>>> As Cedric mentioned, the OpenBMC project has been shipping the read
>>>> training code for the ast2400/ast2400 for several years now. It would
>>>> be great to see it in mainline.
>>>>
>>>> I think it's reasonable to ask for the driver to be moved to the
>>>> spi-mem subsystem once it has the required APIs.  
>>>
>>> Except it won't have the necessary APIs unless someone works on it, and
>>> adding this feature to existing spi-nor drivers won't help achieving
>>> this goal.  
>>
>>
>> What would you suggest ? Something like the patch below which would
>> call a 'train' operation at the end of spi_add_device().
> 
> This has been discussed in the past with Vignesh, but I can't find the
> thread where this discussion happened. My understanding was that link
> training would use a command with well-known output (is there a
> dedicated SPI NOR command for that?) and test different clk settings
> until it finds one that works.

The read training on Aspeed consists of finding the appropriate read
timing delays for well-known HCLK dividers and store the results in 
the Read Timing Compensation register. 

We first read a golden buffer at low speed and then perform reads with 
different clocks and delay cycle settings to find a breaking point. This 
selects the default clock frequency for the CEx control register. 

 
>> Also, when doing read training, we might need to know some lowlevel 
>> characteristics of the chip being trained. Should we offer a way 
>> to grab the probed m25p80 device and give access to the underlying 
>> 'struct spi_nor' ? 
>>
>>   static struct spi_nor *spi_get_pnor(struct spi_device *spi)
>>   {
>> 	struct spi_mem *spimem = spi_get_drvdata(spi);
>> 	struct m25p *flash = spi_mem_get_drvdata(spimem);
>>
>> 	return flash ? &flash->spi_nor : NULL;
>>   }
>>
>> Yeah, it's hideous. I just want to raise the issue.
> 
> Oh no. We definitely don't want to expose the spi_nor chip to the
> spi_mem layer, but, if needed, we can add more fields to spi_mem and
> let the spi_mem driver fill them. We just need to figure out what's
> really needed.

We need the SPI/NOR flash characteristics for link training and its 
size to configure the controller to access the CS on the AHB window. 

[ ... ]

>>  	int (*fw_translate_cs)(struct spi_controller *ctlr, unsigned cs);
>> +
>> +	int			(*train)(struct spi_device *spi);
> 
> Was more thinking of something like:
> 
> 	int (*link_setup)(struct spi_mem *mem,
> 			  struct spi_mem_op *op_template,
> 			  ...);
> 
> where the op_template would potentially differ depending on the type of
> memory (NOR, NAND, SRAM?). I also don't know what other params would be
> needed to do the link training.

The Aspeed controller needs to set read delay timings at different HCLK
settings. It's doing read operations with the default IO mode.
 
> BTW, this hook should be in the spi_mem_controller_ops struct not in
> spi_controller.

ok. Let's wait for feedback from Vinesh.

Thanks,

C. 


