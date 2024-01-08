Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3426E8278B2
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 20:46:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gYlyPH/S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T84LK23tVz3bcJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 06:46:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gYlyPH/S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T84L7513Wz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 06:45:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 408IxDxV004556;
	Mon, 8 Jan 2024 19:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HQMWlmhGCI0gqIzD3pTcfRRdTKO/pXigIEMbMJBUbps=;
 b=gYlyPH/S4ZZPETPD828r+fCJMMeXZRoA6GVidkXKqIM2YTQKtEtLh1VOm9tR2xXlEtak
 gb8+P8g3GA1SIgmbM5QcAl8RB13LBJjMzvWcj1YWI4FaqFMCWMcIj9t+MJ8zDNizpgmU
 GcqAcbX2KJ8M4wmzibsAENr27KCB963+iN/5aha2yIyq0cvZMqVdGOs2WZ72kLIvy7Rd
 vxt3h6oPVALxFrSsm0uXDCfgu9X/LNCGMarI7XOPvMEwUhRtCx2iY0qvEhgqdh3Fg+Si
 fvszzXvgUH6495MwYuXQm0Bo7DfOmqR0dj2fTjE1+2hajPdwtlLiWxDN+jpoi0KmnkLg pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgjsrg9ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 19:44:38 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 408JUABl009175;
	Mon, 8 Jan 2024 19:44:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgjsrg9aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 19:44:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 408HGBKD000400;
	Mon, 8 Jan 2024 19:44:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfh6stf3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 19:44:35 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 408JiZA438404384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jan 2024 19:44:35 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F187058045;
	Mon,  8 Jan 2024 19:44:34 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2048258052;
	Mon,  8 Jan 2024 19:44:33 +0000 (GMT)
Received: from [9.61.145.235] (unknown [9.61.145.235])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jan 2024 19:44:33 +0000 (GMT)
Message-ID: <a2732262-2078-45e9-ab4b-f913ef68211a@linux.ibm.com>
Date: Mon, 8 Jan 2024 13:44:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
 <20231213161347.GA1204384-robh@kernel.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20231213161347.GA1204384-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5jHxyaT-zAgHLIcN9cmGSD4rg_rsIi2W
X-Proofpoint-ORIG-GUID: Cma1fBCfpUOX8LEvDKc8aTniKKcx3aAf
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_08,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080163
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 12/13/23 10:13, Rob Herring wrote:
> On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
>> From: Johannes Holland <johannes.holland@infineon.com>
>>
>> Add a dt schema to support device tree bindings for the generic I2C
>> physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
>> Specification for TPM 2.0 v1.04 Revision 14.
>>
>> This includes descriptions for the Nuvoton and Infineon devices.
> This is incomplete and conflicts with this series[1]. Please help
> review and make sure it works for the cases you care about.
>
> Rob
>
> [1] https://lore.kernel.org/all/cover.1701093036.git.lukas@wunner.de/

Looks like my patch "dt-bindings: tpm: Add schema for TIS I2C devices" 
is not required. I am removing it.

Thanks for the review.

Regards,

Ninad

