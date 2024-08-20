Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11B9579DE
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKc52xGz7CVt
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hx0COoAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 456 seconds by postgrey-1.37 at boromir; Wed, 10 Jul 2024 06:11:58 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJXFp0BBqz3cF4;
	Wed, 10 Jul 2024 06:11:57 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AaFTD003666;
	Tue, 9 Jul 2024 20:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zP7sQqPEBj92a4s3LSeDCL3HKNLXBrQAZfBTvIb5o6s=; b=hx0COoAKiItsHlpc
	XI/O/g8KBt2jauxtDXKJOuHVgImEjzpKR6OhhewHd2vpIa0sOoY5r2IQzd7F1Yiq
	jXxfjWy5CoQCZWznc8kkvMEu/uxW0uAcKwHClRCzPV1+ZFdfl4D8j2S4xnOnKlmg
	nkCI8iCcw8UARzTFoi+7JesepVHUC/w03rQJFAfAjXdm2S9dj4K8eRKTxvDLhJuE
	MUQsVMspnx4LRMwBKg0pjVKP7rHxkRfeEsImXanJRhdzDuItDNGM4uX1dIkS2h3B
	37AoHIjB75ncL8giYg66+mZVBMyLuKq6gtksOROyKGgAUP/74DFbzsBzVVW9OG0Z
	9uTs0g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwqfbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 20:03:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469K3gGn030620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 20:03:42 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 13:03:42 -0700
Message-ID: <1f167dbf-9744-433c-aa5c-a35b66b79dde@quicinc.com>
Date: Tue, 9 Jul 2024 13:03:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsi: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@ozlabs.org>,
        Joel
 Stanley <joel@jms.id.au>, Alistar Popple <alistair@popple.id.au>,
        Andrew
 Jeffery <andrew@codeconstruct.com.au>
References: <20240605-md-drivers-fsi-v1-1-fefc82d81b12@quicinc.com>
 <4d1276a3-ef4a-4c84-8d09-d1613f311a28@quicinc.com>
 <3edca7a4-361b-4381-8b13-70584a30e2b1@linux.ibm.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <3edca7a4-361b-4381-8b13-70584a30e2b1@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VMiwqcJLZgNeAMQCjEju4tHyS8x4Kkr2
X-Proofpoint-ORIG-GUID: VMiwqcJLZgNeAMQCjEju4tHyS8x4Kkr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_08,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=939 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090135
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 7/1/2024 8:00 AM, Eddie James wrote:
> 
> On 6/26/24 00:15, Jeff Johnson wrote:
>> On 6/5/2024 3:39 PM, Jeff Johnson wrote:
>>> make allmodconfig && make W=1 C=1 reports:
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>>>
>>> Add the missing invocations of the MODULE_DESCRIPTION() macro, and fix the
>>> copy/paste of the module description comment in fsi-master-ast-cf.c.
> 
> 
> Thanks!
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

I still don't see this in linux-next yet so following up again to see if
anything else is needed to get this merged.


