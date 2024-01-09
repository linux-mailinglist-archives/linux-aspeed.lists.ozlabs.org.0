Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D010829111
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jan 2024 00:56:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KWHdhVHj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8nrm1CXgz307V
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jan 2024 10:56:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KWHdhVHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8nrc4HB4z2xm5
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jan 2024 10:56:16 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409NbJm3009737;
	Tue, 9 Jan 2024 23:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pIGSxdBl3VdFv5WEtQLCwxeYviazI+Eu7DuRMU0A1oc=;
 b=KWHdhVHj3VKfhziPmSNboFMdSDTaDFdLW9viw4pwp+QoBg7IuvRsRZuBcpZ+5BKqjB1S
 YxCZHa2zuCxWE1AIkjMAWV6GWaGLNqWJ6DrCLkB+Swv5oV2mLt6pjON0FGbYvdlMHCL0
 Fw0Teabh/rqsdHAoSOWJNmHl+VdlRDUNITOjysUl8mx7ThdTaHRnZnVHvnwL3vGvfXWT
 MUblorRxuY30v2EQtSkhaGmFX0J5k5LC5pcAX1z2+vuZso0zkGh9NKLSoqIfshoRUWD+
 SWjUURc4e6D6M3MAwEtmlG5l/G/o0pynqHjVIfE79Qxy/Nzzev61BFdo7JSbu3aGoSwi 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhfykrcf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:55:48 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409NdZhO015894;
	Tue, 9 Jan 2024 23:55:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhfykrce5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:55:47 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409MFg0l022877;
	Tue, 9 Jan 2024 23:55:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfj6nhvxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 23:55:45 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409Nti5113042216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 23:55:45 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2BA658052;
	Tue,  9 Jan 2024 23:55:44 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB20458065;
	Tue,  9 Jan 2024 23:55:43 +0000 (GMT)
Received: from [9.61.145.235] (unknown [9.61.145.235])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 23:55:43 +0000 (GMT)
Message-ID: <01974929-dfbf-4989-ba39-369e521827d0@linux.ibm.com>
Date: Tue, 9 Jan 2024 17:55:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
 <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
 <20231212-mouth-choice-40a83caa34ec@spud>
 <2946fbb1-2a47-4d21-83dc-8e45bf6ba5a9@roeck-us.net>
 <60c8bbdb-4e08-44f0-88d4-ab164d4843b5@linux.ibm.com>
 <20240109-pep-coerce-2a86ae88753d@spud>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240109-pep-coerce-2a86ae88753d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EkkFGVaYhXbBhJlALwA8NDTvgmLdFbqX
X-Proofpoint-ORIG-GUID: RWeIWYqaZ-TKAU0q3z3TP5Kvth-CNNwp
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090192
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Conor,

On 1/9/24 11:14, Conor Dooley wrote:
> On Mon, Jan 08, 2024 at 02:05:53PM -0600, Ninad Palsule wrote:
>> Hello Guenter,
>>
>> On 12/12/23 13:50, Guenter Roeck wrote:
>>> On 12/12/23 10:51, Conor Dooley wrote:
>>>> On Tue, Dec 12, 2023 at 10:00:39AM -0800, Guenter Roeck wrote:
>>>>> On Tue, Dec 12, 2023 at 05:15:51PM +0000, Conor Dooley wrote:
>>>>>> On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
>>>>>>> From: Joel Stanley <joel@jms.id.au>
>>>>>>>
>>>>>>> The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.
>>>>>>>
>>>>>>> https://www.nuvoton.com/products/cloud-computing/security/trusted-platform-module-tpm/
>>>>>>>
>>>>>>>
>>>>>>> Add a compatible string for it, and the generic compatible.
>>>>>>>
>>>>>>> OpenBMC-Staging-Count: 3
>>>>>> Delete this from every patch that it appears from.
>>
>> I have send it as a separate commit. https://lore.kernel.org/linux-kernel/20231214144954.3833998-1-ninad@linux.ibm.com/
> Why did you do that? It now just adds undocumented compatibles to the
> driver. Please, as Rob requested, work with Lukas on his series to make
> sure that these devices are documented.

I think krzysztof kozlowski suggested to send these patches separately: 
https://lore.kernel.org/linux-kernel/1c5ace65-2fd8-4503-b22f-e0f564d1c83f@linaro.org/

Did I misunderstood it? Do you guys want me to include that commit again?

Regards,

Ninad


