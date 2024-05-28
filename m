Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E167B8D1F55
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 May 2024 16:56:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dIDTxp5C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpb750mcwz79cg
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 May 2024 00:51:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dIDTxp5C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpb6z2GB4z79bD;
	Wed, 29 May 2024 00:51:07 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SEhI5f003610;
	Tue, 28 May 2024 14:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=bYLnu2uRhQiJIzawm02kqqSHPnZb/mNe6+kbvP6fwYk=;
 b=dIDTxp5Cuc4X1w7Wt8O4NO/JAKZPKlB2rTIOArOz6oUXGVwOUY1T/9a/XISQDn0MgIQa
 d3Xpm1/+BtZShQsFfDelWiIszyEMGmkfV7XJ5pLAzajQHfw1QVfqwxHcig+D8jrXK200
 gIwn1k/6lwzldkeFg5srOxcXuft0F2i2OycCg9vFBxA+6nsKwWm+/Q6Vsca/3oMqIrC6
 sjrRCL7McII1jlgwr07Sc9LjyPCIjlrJF4UBIGzJEMpifYLjv9so/uS3WuhR1G0oAj/U
 q4W12yhJ/4aaVLSGN3wUYllE1DUOru5wNgyE+gZXuGolGWP9N536dTHhALYMB8ArzX3c VQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydh99g0x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:50:56 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SERo3E027098;
	Tue, 28 May 2024 14:50:56 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ybvhkq1w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:50:56 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SEoqu424314418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:50:54 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 881CF58066;
	Tue, 28 May 2024 14:50:52 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4FA858054;
	Tue, 28 May 2024 14:50:51 +0000 (GMT)
Received: from [9.61.45.62] (unknown [9.61.45.62])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:50:51 +0000 (GMT)
Message-ID: <45724dae-ebe6-48f9-8cb7-d6e27d5fdad9@linux.ibm.com>
Date: Tue, 28 May 2024 09:50:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/20] ARM: dts: aspeed: Add IBM P11 Blueridge BMC
 system
To: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-15-eajames@linux.ibm.com>
 <dca4ac91-c18b-4271-a3f9-fbf3b5a3c43d@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <dca4ac91-c18b-4271-a3f9-fbf3b5a3c43d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lv0hgdLUj0_GkwgitpXGDZ3pd6ypzCFN
X-Proofpoint-ORIG-GUID: Lv0hgdLUj0_GkwgitpXGDZ3pd6ypzCFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=907 lowpriorityscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405280111
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, robh@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 5/24/24 17:47, Ninad Palsule wrote:
>> +		led@6 {
>> +			reg = <6>;
>> +			default-state = "keep";
>> +			label = "cpu-vrm1";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +
> Is there a specific reason for skipping led@7? Its not connected?


Yes, again not connected.


>> +		led@8 {
>> +			reg = <8>;
>> +			default-state = "keep";
>> +			label = "lcd-russel";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +	};
>> +
>
> Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
>

Thanks,

Eddie

