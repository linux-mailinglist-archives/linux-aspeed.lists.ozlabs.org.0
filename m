Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D14ECF36
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTKy42N6qz2yyK
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector1 header.b=oCE6dat5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foss.st.com (client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=00868e5266=patrice.chotard@foss.st.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=oCE6dat5; 
 dkim-atps=neutral
X-Greylist: delayed 607 seconds by postgrey-1.36 at boromir;
 Mon, 28 Mar 2022 20:20:36 AEDT
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRnH859GQz2ynk;
 Mon, 28 Mar 2022 20:20:32 +1100 (AEDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8FOlk021087;
 Mon, 28 Mar 2022 11:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QNqrDD64oegmAPAA7c6Kuvj4h/Mo4WJ2EudsRNthV8U=;
 b=oCE6dat5TQz7eCa51/SqzVDKh9IaU6RCkI5tLfvrJaB6+xkYae3WC2aW1iLZIyTEKpS3
 CCSpftC7+yt34expFb6wiGmu8X6oTQtHUotdm3ekypG7+EY0B90ygXHxnK1otXO1/maO
 Ls62vY3zD3i1rYNIJZe+cvNuMFH439ejbkQarZgY4Y/cFuJlRDe/ZV7DK61wbEdDUEob
 cxa7hQAlEp+effh6Pj0MqMZtugaYh4K3BJmNUP1jJzmhyVSi0AHjNPAYUQqKo5/Fu+qO
 49ds7rPdKQwQZVOzKPm1f5azlOxH2lihq4Encg42tAIs16YBSuBhQU18acXCi8Ud202z HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1u240c3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 11:20:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2B7610002A;
 Mon, 28 Mar 2022 11:20:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B41621BF69;
 Mon, 28 Mar 2022 11:20:02 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 28 Mar
 2022 11:20:01 +0200
Message-ID: <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
Date: Mon, 28 Mar 2022 11:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-actions@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@axis.com>,
 <linux-aspeed@lists.ozlabs.org>, <linux-rpi-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <kernel@dh-electronics.com>, <linux-mediatek@lists.infradead.org>,
 <openbmc@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
 <linux-oxnas@groups.io>, <linux-arm-msm@vger.kernel.org>,
 <linux-unisoc@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-realtek-soc@lists.infradead.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <fef4e5dd-d843-ea37-7701-bcfac9d1c9b5@foss.st.com>
In-Reply-To: <fef4e5dd-d843-ea37-7701-bcfac9d1c9b5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_03,2022-03-28_01,2022-02-23_01
X-Mailman-Approved-At: Thu, 31 Mar 2022 08:56:02 +1100
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 3/28/22 11:09, Patrice CHOTARD wrote:
> Hi Ansuel
> 
> On 3/28/22 02:09, Ansuel Smith wrote:
>> - Categorize every dts in arm directory in subdirectory
>> - Fix Makefile to address for the arm subdirectory
>> - Fix any arm64 dependency
>>
>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> 
>>  create mode 100644 arch/arm/boot/dts/st/Makefile
>>  rename arch/arm/boot/dts/{ => st}/spear1310-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear1310.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear1340-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear1340.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear13xx.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear300-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear300.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear310-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear310.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear320-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear320-hmi.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear320.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear320s.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear3xx.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear600-evb.dts (100%)
>>  rename arch/arm/boot/dts/{ => st}/spear600.dtsi (100%)
> 
> 
> All SPEAr device tree should go into stm sub-directory, as this platform is a STMicroelectronics one
> as STi or STM32.

Just got an internal discussion, all STMicroelectronics platform should go into "st" sub-directory, and not in "stm" as indicated in my previous e-mail. ;-)

Patrice

> 
> Thanks
> 
> Patrice
> 
>>  create mode 100644 arch/arm/boot/dts/st_ericsson/Makefile
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8500.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8505.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8500.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8520.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db9500.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-ab8500.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-family-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-stuib.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r2.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r3.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href520-tvk.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-stuib.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-tvk.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-stuib.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-tvk.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-nhk15.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-s8815.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-stn8815.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-snowball.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-codina.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-gavini.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-golden.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-janice.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-kyle.dts (100%)
>>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-skomer.dts (100%)
>>  create mode 100644 arch/arm/boot/dts/stm/Makefile
>>  create mode 120000 arch/arm/boot/dts/stm/armv7-m.dtsi
>>  rename arch/arm/boot/dts/{ => stm}/st-pincfg.h (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih407-b2120.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih407-clock.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih407-family.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih407-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih407.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih410-b2120.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih410-b2260.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih410-clock.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih410-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih410.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih418-b2199.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih418-b2264.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih418-clock.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stih418.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stihxxx-b2120.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32429i-eval.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32746g-eval.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f4-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f429-disco.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f429-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f429.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f469-disco.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f469-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f469.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f7-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f746-disco.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f746-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f746.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f769-disco.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32f769-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h7-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h743.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-disco.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-eval.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h750.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32h750i-art-pi.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp13-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp131.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp133.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp135.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp135f-dk.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xc.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xf.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp151.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp153.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp153c-dhcom-drc02.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-avenger96.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dhcor-avenger96.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dk1.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-edimm2.2.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-iot-box.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-pdk2.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-picoitx.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dk2.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ed1.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emsbc-argon.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emstamp-argon.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ev1.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-lxa-mc1.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey-som.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey.dts (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xc.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-drc02.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-pdk2.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-picoitx.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-som.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-avenger96.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-io1v8.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-som.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dkx.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-osd32.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxaa-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxab-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxac-pinctrl.dtsi (100%)
>>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxad-pinctrl.dtsi (100%)
