Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E689452FE
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 20:50:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YG6WD8wb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZdMd5DRBz3dVC
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 04:50:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YG6WD8wb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZdMX20lFz3dL8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 04:50:47 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Gx8Hn026526;
	Thu, 1 Aug 2024 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	yhyR78qT1byKkheMVR2YqFZ0cI1JiXXE3mkBqbk0s18=; b=YG6WD8wbi0cuJVUR
	l7N7Y4aYoggaMg8BdB9HdGCRUxIi1QhppGI+VMgKNACrkCITL1xXJS9tuR00H/+k
	yUIXer4R5avVhC/XUV7UBokJvudUk3m3sT1hvojNTCnJuZT6aVVDmTgaxNqX/cCV
	T3z6+RBex8qk1XnL8HsWWwSrKnWeJx/rxzYzQcMoD2SgQdLH77pmO3V8avaqrVvj
	AMwokzpc5LKlRwWIPqDRyAfKhHrdlMeztaSQac/IXkrSMrqoxoKnCFnXVlfz1kvH
	qqJpgc9zck4MSVKqzTYncvkVB46qD0Acn0h0LJ3zEo4eiQCOTu565EeNRj3cnh4i
	0IQcfQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40rebqg716-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 18:50:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 471GQd3h003745;
	Thu, 1 Aug 2024 18:50:31 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndemu42c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 18:50:31 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 471IoSZD56885652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2024 18:50:30 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EFC25805D;
	Thu,  1 Aug 2024 18:50:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10C7A58058;
	Thu,  1 Aug 2024 18:50:28 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Aug 2024 18:50:27 +0000 (GMT)
Message-ID: <fc92ccbd-89c7-4392-91ac-213aba31d37b@linux.ibm.com>
Date: Thu, 1 Aug 2024 13:50:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: Rob Herring <robh@kernel.org>
References: <20240731214737.986010-1-ninad@linux.ibm.com>
 <172252600790.120672.12772438670145461296.robh@kernel.org>
 <4d5b8958-2d33-42df-ac97-82bb63fdff38@linux.ibm.com>
 <CAL_JsqLd8Xcj7gD=WKrt8ygYHb3jNpvxof5yFAPPydiRCPv0eQ@mail.gmail.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <CAL_JsqLd8Xcj7gD=WKrt8ygYHb3jNpvxof5yFAPPydiRCPv0eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lL-RT0xlWfwnEsdMy8QR8wqU9ubpeLB8
X-Proofpoint-ORIG-GUID: lL-RT0xlWfwnEsdMy8QR8wqU9ubpeLB8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_16,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=936
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408010118
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
Cc: devicetree@vger.kernel.org, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 8/1/24 12:36, Rob Herring wrote:
> On Thu, Aug 1, 2024 at 10:25 AM Ninad Palsule <ninad@linux.ibm.com> wrote:
>> I have seen these warning. I am not sure how to fix them as it is
>> already documented in the following file.
>>
>> Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> $ git log -- Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> (END)

Yes, This file only exist in the www.github.com/openbmc/linux. I will 
try to upstream it along with driver changes later.

Sorry I was not suppose to send this patch to upstream. So please ignore 
the patch.

Thanks & Regards,

Ninad Palsule

>
> Did you mean Documentation/devicetree/bindings/hwmon/max31785.txt? If
> so, there is no 'pmbus-fan' in it or anywhere else except aspeed dts
> files.
>
> The state of the aspeed dts files is really quite sad. This is a count
> of warnings. The first number is total warnings. The second number is
> unique warnings (stripping the dtb name so we don't have N warnings
> for N boards). The 2nd list is undocumented (by schema) compatibles.
>
> The number of warnings vs. Linus's tree is higher already and we just
> started the cycle. That's the wrong direction and in general I see
> very little if any effort reducing the warnings for aspeed.
>
> This is all run daily here: https://gitlab.com/robherring/linux-dt/-/jobs
>
> arch/arm/boot/dts/aspeed:3682:635
>      184  sbefifo@2400: '#address-cells', '#size-cells' do not match
> any of the regexes: 'pinctrl-[0-9]+'
>      160  i2cr@20: #address-cells: 1 was expected
>       88  eeprom@0: 'size' is a required property
>       88  eeprom@0: 'pagesize' is a required property
>       88  eeprom@0: 'address-width' is a required property
>       70  lpc@1e789000: reg-io-width: 4 is not of type 'object'
>       62  kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>       62  kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>       62  kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>       62  kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>       45  sram@1e720000: 'ranges' is a required property
>       45  sram@1e720000: '#size-cells' is a required property
>       45  sram@1e720000: '#address-cells' is a required property
>       45  lpc@1e789000: lpc-snoop@90: 'clocks' does not match any of
> the regexes: 'pinctrl-[0-9]+'
>       25  timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>       25  syscon@1e6e2000: 'smp-memram@180' does not match any of the
> regexes: '^interrupt-controller@[0-9a-f]+$',
> '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$',
> '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
>       25  lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of
> the regexes: 'pinctrl-[0-9]+'
>       25  ftgmac@1e690000: $nodename:0: 'ftgmac@1e690000' does not
> match '^ethernet(@.*)?$'
>       25  ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not
> match '^ethernet(@.*)?$'
>       25  ftgmac@1e670000: $nodename:0: 'ftgmac@1e670000' does not
> match '^ethernet(@.*)?$'
>       25  ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not
> match '^ethernet(@.*)?$'
>       25  fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master',
> 'fsi-master'] is too long
>       25  fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master',
> 'fsi-master'] is too long
>       25  crypto@1e6fa000: 'aspeed,ahbc' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>       25  bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
>       24  sdc@1e740000: sdhci@1e740200:compatible:
> ['aspeed,ast2600-sdhci', 'sdhci'] is too long
>       24  sdc@1e740000: sdhci@1e740100:compatible:
> ['aspeed,ast2600-sdhci', 'sdhci'] is too long
>       22  spi@60: 'eeprom@0' does not match any of the regexes:
> '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
>       22  spi@40: 'eeprom@0' does not match any of the regexes:
> '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
>       22  sbefifo@2400: occ: 'occ-hwmon', 'reg' do not match any of the
> regexes: 'pinctrl-[0-9]+'
>
> arch/arm/boot/dts/aspeed:68
> ['adi, adm1272']
> ['adm1272']
> ['adm1275']
> ['aspeed,ast2400-cf-fsi-master', 'fsi-master']
> ['aspeed,ast2400-cvic', 'aspeed-cvic']
> ['aspeed,ast2400-i2c-ic']
> ['aspeed,ast2400-ibt-bmc']
> ['aspeed,ast2400-lhc']
> ['aspeed,ast2400-p2a-ctrl']
> ['aspeed,ast2400-pwm-tacho']
> ['aspeed,ast2400-timer']
> ['aspeed,ast2400-vic']
> ['aspeed,ast2400-video-engine']
> ['aspeed,ast2500-cf-fsi-master', 'fsi-master']
> ['aspeed,ast2500-cvic', 'aspeed-cvic']
> ['aspeed,ast2500-gfx', 'syscon']
> ['aspeed,ast2500-i2c-ic']
> ['aspeed,ast2500-ibt-bmc']
> ['aspeed,ast2500-lhc']
> ['aspeed,ast2500-p2a-ctrl']
> ['aspeed,ast2500-pwm-tacho']
> ['aspeed,ast2500-scu-ic']
> ['aspeed,ast2500-sdram-edac']
> ['aspeed,ast2500-video-engine']
> ['aspeed,ast2500-xdma']
> ['aspeed,ast2600-fsi-master', 'fsi-master']
> ['aspeed,ast2600-gfx', 'syscon']
> ['aspeed,ast2600-ibt-bmc']
> ['aspeed,ast2600-lhc']
> ['aspeed,ast2600-scu-ic0']
> ['aspeed,ast2600-scu-ic1']
> ['aspeed,ast2600-sdhci', 'sdhci']
> ['aspeed,ast2600-sdram-edac', 'syscon']
> ['aspeed,ast2600-smpmem']
> ['aspeed,ast2600-timer']
> ['aspeed,ast2600-udma']
> ['aspeed,ast2600-video-engine']
> ['aspeed,ast2600-xdma']
> ['atmel,at30tse004a']
> ['dallas,ds3231']
> ['delta,dps800']
> ['dps650ab']
> ['fsi-master-gpio', 'fsi-master']
> ['fsi-master-hub']
> ['ibm,bonnell-bmc', 'aspeed,ast2600']
> ['ibm,fsi-i2c-master']
> ['ibm,fsi-master-hub']
> ['ibm,fsi2pib']
> ['ibm,pca9552']
> ['infineon,ir35221']
> ['infineon,pxe1610']
> ['ipmb-dev']
> ['isil,isl69260']
> ['isil,raa229004']
> ['lm75']
> ['max31790']
> ['maxim,max31785a']
> ['microchip,emc1413']
> ['mps,mp5023']
> ['nuvoton,w83795g']
> ['nvt210']
> ['nxp,pca9551']
> ['nxp,pca9552']
> ['nxp,pca9641']
> ['pmbus']
> ['pmbus-fan']
> ['si,si7021a20']
> ['ti,ucd90160']
