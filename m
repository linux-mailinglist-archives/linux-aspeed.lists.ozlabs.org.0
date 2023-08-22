Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE67885FC
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:39:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i9ojrL97;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHzT6mHkz3dJc
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:39:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i9ojrL97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVZDS4y72z30f4
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 02:14:32 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MG1L2k008589;
	Tue, 22 Aug 2023 16:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yC5f33Ob4/TsP6gqRM1f9CgoFNkgmI1O4+HZP8dDm/8=;
 b=i9ojrL97z3xPv1C6+EZFLQkmfuM4z/fFYT43DodIto7CpxBiUsFq2dtTqOsdHv7TjXfG
 9c8TYNWQpnKaXhee1o/3tBwTFUQ80qn9KeLtd4L+W9AePVUy9FEdtAl5gmrbJROzuYgJ
 mnEw4hkQoE0yZOa4kG8VuWZgN3cHGaUuggOS+b4Y45EmX0u47cvibQyuFx88WIQrjmrZ
 LIodQsjTZ1TlOK2O/ZemrGM46mgHcZb5YQ9QjvSN3t9dtngQ00206qn01T0Vb6oMQiur
 04LUPnfN6dZXDHILiFlSlraVqZPQFRHi5VCeEBqa5gBGTBPFLWb0vcu0d0QwNJj1a7ZF 7A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sn05w91fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 16:14:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37MEpej0020687;
	Tue, 22 Aug 2023 16:14:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sk9jkmrrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 16:14:18 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37MGEHXk65995120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Aug 2023 16:14:17 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D50258062;
	Tue, 22 Aug 2023 16:14:17 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17BB558059;
	Tue, 22 Aug 2023 16:14:16 +0000 (GMT)
Received: from [9.67.101.231] (unknown [9.67.101.231])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Aug 2023 16:14:15 +0000 (GMT)
Message-ID: <6cea8ee7-f845-6ef3-631f-3f252ff5e949@linux.vnet.ibm.com>
Date: Tue, 22 Aug 2023 11:14:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] soc/aspeed: Add host side BMC device driver
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Ninad Palsule <ninad@linux.ibm.com>
References: <20230821183525.3427144-1-ninad@linux.ibm.com>
 <20230821183525.3427144-2-ninad@linux.ibm.com>
 <5159abb8-1b4c-4576-b370-4dd9db142beb@lunn.ch>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <5159abb8-1b4c-4576-b370-4dd9db142beb@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jw-rUKEt0Unr8q74GG93j6Xch7D8yZe1
X-Proofpoint-ORIG-GUID: Jw-rUKEt0Unr8q74GG93j6Xch7D8yZe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1011 phishscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220124
X-Mailman-Approved-At: Fri, 25 Aug 2023 21:33:58 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Andrew,

Thanks for the review.

On 8/21/23 2:29 PM, Andrew Lunn wrote:
>> Testing:
>>    - This is tested on IBM rainier system with BMC. It requires BMC side
>>      BMC device driver which is available in the ASPEED's 5.15 SDK
>>      kernel.
> How relevant is that? To the host side, it just appears to be an
> 16550A. Is the SDK emulating an 16550A? If you where to use a
> different kernel, is it still guaranteed to be an 16550A? I also
> notice there is a mainline
> drivers/tty/serial/8250/8250_aspeed_vuart.c. Could that be used on the
> BMC? That would be a better testing target than the vendor kernel.

This is just to indicate how I tested my code.

Yes, aspeed chip (in this case ast2600) is compatible with 16550 UART.

I am guessing it should work with different kernel too as 16550 standard 
is used.

The 8250_aspeed_vuart.c is a BMC side driver for accessing VUART over 
LPC bus and

this is a host side driver to access VUART over PCIe bus.

>> +config ASPEED_HOST_BMC_DEV
>> +	bool "ASPEED SoC Host BMC device driver"
>> +	default ARCH_ASPEED
>> +	select SOC_BUS
>> +	default ARCH_ASPEED
> same default twice?
Removed.
>
>> +static int __init aspeed_host_bmc_device_init(void)
>> +{
>> +	int ret;
>> +
>> +	/* register pci driver */
>> +	ret = pci_register_driver(&aspeed_host_bmc_dev_driver);
>> +	if (ret < 0) {
>> +		pr_err("pci-driver: can't register pci driver\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +
>> +}
>> +
>> +static void aspeed_host_bmc_device_exit(void)
>> +{
>> +	/* unregister pci driver */
>> +	pci_unregister_driver(&aspeed_host_bmc_dev_driver);
>> +}
>> +
>> +late_initcall(aspeed_host_bmc_device_init);
>> +module_exit(aspeed_host_bmc_device_exit);
> It looks like you can use module_pci_driver() ?
yes, It should work unless the late initcall is important. I will test 
it and see.

Thanks & Regards,

Ninad Palsule

