Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4A943857
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2024 23:57:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aiy7eoDA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ5YV0KYMz3dJB
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 07:57:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aiy7eoDA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ5YP0m9vz3c7K
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 07:57:28 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VLSLQe025083;
	Wed, 31 Jul 2024 21:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=e
	5BpIFBV9dvf22kSzpxc/CcySZZQFH+i7XVuBYM1ARk=; b=aiy7eoDAkIO+yFk6B
	UOhTys6RSIX96ihSp/v5eFx/tipWiPi+OXHrtujyTsk9UdFrWwk+dmDLIucyiDnB
	IDP4azvVoWq13YxMJCal58L/j/LmZKkmR2/vx3iuORpu2txfSk1xK2fms+RIfnRw
	wqB/xIdWZ+NpedMAGYY5QJiwXwNBZvP7MbUpk67fopsvBEdSrWsqdanOj9HaOHeB
	XgOeWWR1AecPJOKOPce2JCU1kn5dDKvoCmENX76oRNTGPkCkRSw2ohRxixKGVtvF
	wNH0TeBp+E/UDVhJIlzULCxuGINHYtXQJTTTlfLmAHneLdJpPOQJ+Cl2rsgqUy9E
	bj5vg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40qw7801x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 21:57:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46VL0XQA011143;
	Wed, 31 Jul 2024 21:57:15 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40ncqmx6as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 21:57:15 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46VLvCkP46530932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 21:57:15 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A99FB58043;
	Wed, 31 Jul 2024 21:57:12 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1814058053;
	Wed, 31 Jul 2024 21:57:12 +0000 (GMT)
Received: from [9.61.157.158] (unknown [9.61.157.158])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jul 2024 21:57:11 +0000 (GMT)
Message-ID: <5d86ab31-7b29-4f5e-9c9f-be904c128497@linux.ibm.com>
Date: Wed, 31 Jul 2024 16:57:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: Ninad Palsule <ninad@linux.ibm.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20240731214737.986010-1-ninad@linux.ibm.com>
 <20240731214737.986010-2-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20240731214737.986010-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RK-45OovhNuK21F1MvrvRInB_y4im7hy
X-Proofpoint-GUID: RK-45OovhNuK21F1MvrvRInB_y4im7hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310150
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 7/31/24 16:47, Ninad Palsule wrote:
> Updated MAX31785a pmbus based fans in the device tree.
>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 96 +++++++++++++++++++
>   1 file changed, 96 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index f3efecc7eb8d0..f96b299d743ba 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -764,17 +764,113 @@ regulator@43 {
>   	};
>   };
>   
> +


Don't really need the white space here, but no worries.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>   &i2c6 {
>   	status = "okay";
>   
>   	fan-controller@52 {
>   		compatible = "maxim,max31785a";
>   		reg = <0x52>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fan0: fan@0 {
> +			compatible = "pmbus-fan";
> +			reg = <0>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan1: fan@1 {
> +			compatible = "pmbus-fan";
> +			reg = <1>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan2: fan@2 {
> +			compatible = "pmbus-fan";
> +			reg = <2>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan3: fan@3 {
> +			compatible = "pmbus-fan";
> +			reg = <3>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan4: fan@4 {
> +			compatible = "pmbus-fan";
> +			reg = <4>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
>   	};
>   
>   	fan-controller@54 {
>   		compatible = "maxim,max31785a";
>   		reg = <0x54>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fan5: fan@0 {
> +			compatible = "pmbus-fan";
> +			reg = <0>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan6: fan@1 {
> +			compatible = "pmbus-fan";
> +			reg = <1>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
>   	};
>   
>   	eeprom@55 {
