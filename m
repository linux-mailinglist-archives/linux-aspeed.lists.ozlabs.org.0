Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118A98CB6E
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 05:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJKcK3htpz2yR5
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 13:12:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727838751;
	cv=none; b=g5Zrf031nf76S4Bt0V2x4hkvyw4SgHamoNLgWqb4ovfzONuz2vBPCoxyMwhystuDZHWs+U6T/uRaNDrA0A1xl1WGCvtduiajTSs2uHmYMORoEdxWLd9pdkjxzyHULW64k33UQfi0zWWRAdRw0Xyhbz/v8D9TXt29g+YtAHgDMTSPONegcaTbnn7Db9vJf0K7/S9kgcVgSa5iMjZLvYOJxOtoTthNUXmfrVvgLDkvNIEglr5t/fWWFtlbMUwjNSnNiLNVQYYbPv5bAlAWv+xGPSzqOd/CqAEbLvgOE7b2w7FreuKNdZ7sX3+rS92yZUbDZJcNaG7YFMsG4gYFCRkEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727838751; c=relaxed/relaxed;
	bh=d7Rx5CCMQGs48tFUBEGYyiO5Kb2I0+qYUHWXtMohil0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FR/BoxgCyhWZdhVNBKdN+q+M78i1IufnqJyZvMcUoquCFoujrVsp3ICyMdGQjNmvI0mDkk9kQt7E2X0w4v+MTQJKl4UuX2IXMKBpsTMfIoXxNQ8KwimHIDE+a+kQ6PWKFcQK8LgCaipuv4S6ivjtw6P1sTzvb1qsX1xwl2YPJzQXRehBSMECIkD62wSnlfiCi7UXnCmxkQSYrDuCS+911QjsukQsleHPnYdezJR5hwdLhHLyA1I4G6vJacVtQSZgNhUdYSgtXz76SbTuofv9k7xVMWz+2y6Y30J3yedcr13kogIo7QlthWbOgDL7KlC2KFZr/6F1jWyCn4U/sMkF6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QKhsXioz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QKhsXioz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJKcG6GXWz2xGt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 13:12:30 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4921KXLE011400;
	Wed, 2 Oct 2024 03:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=d
	7Rx5CCMQGs48tFUBEGYyiO5Kb2I0+qYUHWXtMohil0=; b=QKhsXiozlFyDrVpmK
	stxEdSlYd1bq7Kga6pWLyZioPup/3RCvUziMew831EnxZ9cYbiY2OT006CXKj3IB
	/VM/wqzFYLJ1AEXKkBPdGKa8QLGGu3g/sqh2y5/ESlhSA9lr7PBHaQtKi/SLGNPz
	j+HuN8Qt9uZ8Z/g8S961ZNyjcMcWJn1UJlsH83NJCN67vqOCIx7Z4iuDhl4TG4mM
	ckXCRo5HBolSDbXZGZ6gczPmaZXa7fhPftdCEGSbWaKT93rlrdTPWpAKZt2KBoBY
	39elmBALhPWFIpBw5ANM7fS4X35h69t46EeyHTCsmAWN7vyG4y3DVP5ieLNy3Kvb
	SPGNA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420ve009v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 03:12:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491Mj108014098;
	Wed, 2 Oct 2024 03:12:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xwmk7tfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 03:12:11 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4923CBpl25821716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Oct 2024 03:12:11 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2A658055;
	Wed,  2 Oct 2024 03:12:11 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C90F85804E;
	Wed,  2 Oct 2024 03:12:10 +0000 (GMT)
Received: from [9.61.120.47] (unknown [9.61.120.47])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Oct 2024 03:12:10 +0000 (GMT)
Message-ID: <434b4a7c-59ca-47c2-a90f-b4fb994bccac@linux.ibm.com>
Date: Tue, 1 Oct 2024 22:12:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Device tree changes for system1 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        eajames@linux.ibm.com
References: <20241001191756.234096-1-ninad@linux.ibm.com>
 <172782880678.751051.14871757116202304815.b4-ty@codeconstruct.com.au>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <172782880678.751051.14871757116202304815.b4-ty@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -dI_X3iO1Me1Sx9TiS99svVMYyO1_SW2
X-Proofpoint-GUID: -dI_X3iO1Me1Sx9TiS99svVMYyO1_SW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-02_02,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=795 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410020022
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On 10/1/24 19:26, Andrew Jeffery wrote:
> On Tue, 01 Oct 2024 14:17:47 -0500, Ninad Palsule wrote:
>> Please review the device tree changes for BMC for system1 machine.
>>
>> Ninad Palsule (3):
>>    ARM: dts: aspeed: system1: Bump up i2c busses freq
>>    ARM: dts: aspeed: system1: Enable serial gpio0
>>    ARM: dts: aspeed: system1: Add GPIO line names
>>
>> [...]
> Thanks, I've applied this to be picked up through the BMC tree.
Thank you!
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
