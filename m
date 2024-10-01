Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2D98C70B
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 22:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ9B86NgJz2yVt
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 06:52:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727815966;
	cv=none; b=VyngziWh+iXo/fUizy6jzJ/o2OeKM9KrePEa4wCp6och2qBEwhyJhI7TkSRFDO9g8YpgwVnAJFkg5fWMfIkUM9s+PH8FVGE8qD7CIVrplloaHTmD0qBcXTXgJtxJya3fmXO02J3//NYrzmsWnZQKT7XFy5FI1N/A+41N6Ti9p1c0KdrZnZdIFsxvR1UFfkWEEXCpWP3bpdPDjiP+AuQL2tm54LoYZRsKf2Hqi42i6m37UNxgb3XDgNBKbKxW/pB/NHSWEcLtewjkp0JqIAlLJI0g3+PmOm5cWwQkKTwugk1J4Xlhci7o+wguXaF51HSpGbCaAVMz39x2SBBEoeBWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727815966; c=relaxed/relaxed;
	bh=rooI+IAD5MvdFCFwtLHhq3xYNtHGUAW5X4cbhbuFckI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm8Cwrs5Yl8Y3Htsct31NLWl02VF/MIbwfWnI3LzTcL3UZ8atFoP0g0tzECApRQ/atua2m2F8G36Cqy9moQkE4NKhL98wZ1QhRmSzlnzbhxf1iqiSmuLkn8D3yvZVnDpwgPW7bT/NSe3pNTB0FM64MlSR73yvWivtU0ovrFS9Jijke5308YPHtaZFU7J6AdqNWgtp2LTqlFGaImBKil97mtrs4BG3pxik1AwRaSDc6Th7x3sGLrL/db0cxL2enKGcfbX6XeCi/aPI1L0NWKrcByAOq0P153dJaZuL3rI1lbUfjtB8AQz6lWSD3wOuLXjLFfMomjBHK4XXmfgQXJxZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qULLUFVC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qULLUFVC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ9B61mtGz2yGh
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 06:52:46 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491KqYEi010830;
	Tue, 1 Oct 2024 20:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=r
	ooI+IAD5MvdFCFwtLHhq3xYNtHGUAW5X4cbhbuFckI=; b=qULLUFVCBLeUUjIn9
	doQIiqugJfYpJ5Tf3w+IIS9M8Pm4MmpyRmXjaiasietpRkyXWRFLozXqAKH4+B71
	gjlSysbS9dKbSq+ug5TxOWL0vARjq0cak9OZHSi27+5q7UVnlZAZRt7aHz8fBjc8
	s8FA+ITEDPTvwBCupVzlVnx5/YPWttOXjidSDr6TgqmVSapiKFA4UbMOm5ClOAE1
	0LbJ/NbVoUDKlsykLIeM07k9t9+ePGG3KmufkPi7PWUNeBCj57wffXJHp+E+YV08
	zpUFEVv5D/YmIN6bHs2ZkoAcRkMo/iaVSoogkJHRLAVMFN49EyvE63GXfAu0WZxL
	p1Fbw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420qyq03fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:52:33 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491JspeN002346;
	Tue, 1 Oct 2024 20:48:40 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41xxu169xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 20:48:40 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491Kmd4v32768332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 20:48:39 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64CD158059;
	Tue,  1 Oct 2024 20:48:39 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE41A5805D;
	Tue,  1 Oct 2024 20:48:38 +0000 (GMT)
Received: from [9.61.115.177] (unknown [9.61.115.177])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 20:48:38 +0000 (GMT)
Message-ID: <dabd422e-4ec1-48a7-9841-9faf4137820e@linux.ibm.com>
Date: Tue, 1 Oct 2024 15:48:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ARM: dts: aspeed: system1: Bump up i2c busses freq
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
References: <20241001191756.234096-1-ninad@linux.ibm.com>
 <20241001191756.234096-2-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20241001191756.234096-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WFi6jJaaitELYhhUkqrANDnF_zjgqZcP
X-Proofpoint-ORIG-GUID: WFi6jJaaitELYhhUkqrANDnF_zjgqZcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_16,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=792
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2410010138
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


On 10/1/24 14:17, Ninad Palsule wrote:
> Bump up i2c8 and i2c15 bus frequency so that PCIe slot and FPGA runs
> faster


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index f3efecc7eb8d0..1cbf257fb0a0b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -1007,6 +1007,7 @@ i2c7mux0chn7: i2c@7 {
>   
>   &i2c8 {
>   	status = "okay";
> +	bus-frequency = <400000>;
>   
>   	i2c-mux@71 {
>   		compatible = "nxp,pca9548";
> @@ -1468,6 +1469,7 @@ i2c14mux0chn7: i2c@7 {
>   
>   &i2c15 {
>   	status = "okay";
> +	bus-frequency = <400000>;
>   
>   	i2c-mux@71 {
>   		compatible = "nxp,pca9548";
