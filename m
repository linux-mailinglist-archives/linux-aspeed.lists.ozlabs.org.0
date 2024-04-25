Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A600A8B2B1B
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Apr 2024 23:41:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KN4KIeat;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQTnr2G0Yz3dLd
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 07:41:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KN4KIeat;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQTnl5rZvz2y70
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 07:41:31 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLYl7M010948;
	Thu, 25 Apr 2024 21:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+8ylJ/UFsPl1rFKbP7WA3Ug4IhuEoIMFv1oKrB3hro0=;
 b=KN4KIeatRMGa21wUWaAGAWMgyLRoBN63DGTEEoi/Cx2M3jkNWDv0J8eAG0R6X9jmdmUj
 1FIO81Llc87yR+1CBvxjXV7JiNYNNggWUr0gQpAUI3F3r7FkGqAzGnUUS5/Rnb8GAxRU
 3Qr3mrRi2VdFKlNltBZxdglY7W8DVNGaTcE7AxjS1HFZVxRsv2Bhw9iolL/27BmihyzQ
 ddYldYUHqSr7weAoB3pYqK0ca15av5Nknsvbz+yo2+TscmVTDKR2f1T+UQBSBIHJsbsP
 CzQnMCn7DqapSsXT4UC+Q6okrRUHCHVnrQ8KSzIzInJAdbNIjc03IdErsSnfNBXSQ3SE uA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy66r0d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:41:23 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PJhMv1005373;
	Thu, 25 Apr 2024 21:41:23 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3ctxem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:41:23 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLfK1x45613404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:41:22 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABDF058056;
	Thu, 25 Apr 2024 21:41:20 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C03358068;
	Thu, 25 Apr 2024 21:41:20 +0000 (GMT)
Received: from [9.61.133.34] (unknown [9.61.133.34])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:41:20 +0000 (GMT)
Message-ID: <7dd9ba1b-6477-4c09-a571-57002cbfa8b7@linux.ibm.com>
Date: Thu, 25 Apr 2024 16:41:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IBM P11 BMC boards
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org
References: <20240415154931.10775-1-eajames@linux.ibm.com>
 <48ad6bcccae315e68bc0aa10669eed645c495139.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <48ad6bcccae315e68bc0aa10669eed645c495139.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8HykEsnsJnkA3KsbNWJ51s2M7AjAVVta
X-Proofpoint-ORIG-GUID: 8HykEsnsJnkA3KsbNWJ51s2M7AjAVVta
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250157
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


On 4/15/24 19:02, Andrew Jeffery wrote:
> On Mon, 2024-04-15 at 10:49 -0500, Eddie James wrote:
>> Add the Blueridge and Fuji BMC systems.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>   - Change "ody" to "odyssey"
>>
>>   arch/arm/boot/dts/aspeed/Makefile             |    2 +
>>   .../dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1752 +++++++
>>   .../boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 4016 +++++++++++++++++
>>   .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1704 +++++++
>>   4 files changed, 7474 insertions(+)
> A few points:
>
> - Altogether this patch is pretty large. Can we do one for each of the
> FSI topology and the platforms?
>
> - The only list to which you've sent the patch is linux-aspeed, which
> doesn't appear to be archived on lore. Can you please add at least one
> that is? There are a few that should probably be included regardless.
>
> - I don't plan to merge the patch until it has had review from ideally
> more than one other IBMer
>
> On the review front:
>
> It looks like you still need to update
> Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml with the new
> platform compatible strings.
>
> Also, can you please run
>
> ```
> make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-{blueridge,fuji}.dtb
> ```
>
> and address the warnings? This is best done by first applying the patch
> on top of my tree below. It goes some way to eliminating many of the
> warnings currently produced for the Aspeed BMC SoCs:
>
> https://github.com/amboar/linux/tree/dt-warnings/all


Thanks, I've sent v3. One patch has turned into 14 to address the 
warnings... There were still many but they're almost all from 
aspeed-g6.dtsi. The only remaining ones from Blueridge/Fuji that I saw 
were for undocumented compatibles for max31785 and pca955x. Those 
bindings exist but are not in yaml format so the tool doesn't pick them 
up. I'm sure those can be addressed at another time...


Thanks,

Eddie


>
> Andrew
