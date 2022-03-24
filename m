Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C424E6466
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 14:49:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPRQw58n3z30BL
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 00:49:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=egtOUkpF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=egtOUkpF; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPRQq6P6sz2xtc
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 00:49:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648129749; x=1679665749;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ISZkT7ez62uWWDwYq2cHf4s9T2fz9Gv58AVd0CvmmJA=;
 b=egtOUkpFK9tsxCJILyw9Vx89NZwzqIoRQdnQCn+pklCLKAFGQ5TE5c61
 3012aDOxmB4jDn2Ub2lAv9GB9IOERQ/MHoidwrizlmn+MbICZ8ssLaaDp
 A3CbGUUdRIBKN0Y2zah1HbFR5xwTVvjTIOKK2RcXGpWQFjK8tLCLXECi8 M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2022 06:49:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 06:49:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 06:49:03 -0700
Received: from [10.110.37.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 24 Mar
 2022 06:49:02 -0700
Message-ID: <0419edf0-89ba-7db8-7f8f-7682d2af3e7c@quicinc.com>
Date: Thu, 24 Mar 2022 06:48:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/3] ARM: dts: aspeed: Add video engine
Content-Language: en-US
To: Howard Chiu <howard_chiu@aspeedtech.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <SG2PR06MB2315C9F4348D39DA1A448852E6199@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <SG2PR06MB2315C9F4348D39DA1A448852E6199@SG2PR06MB2315.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

Hi Howard,

On 3/24/2022 12:27 AM, Howard Chiu wrote:
> The ast2600 SoC has an embedded video engine
> 
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> ---
>   arch/arm/boot/dts/aspeed-g6.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index c32e87fad4dc..41d5087f7d92 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -389,6 +389,17 @@ sbc: secure-boot-controller@1e6f2000 {
>   				reg = <0x1e6f2000 0x1000>;
>   			};
>   
> +			video: video@1e700000 {
> +				compatible = "aspeed,ast2600-video-engine";
> +				reg = <0x1e700000 0x1000>;
> +				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +					 <&syscon ASPEED_CLK_GATE_ECLK>;
> +				clock-names = "vclk", "eclk";
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				resets = <&syscon ASPEED_RESET_VIDEO>;

Video engine reset is handled by clk-ast2600.c so you don't need to add
'resets'.

> +				status = "disabled";
> +			};
> +

This node was already added back by this change.
https://lore.kernel.org/all/CACPK8XfPPLoS=mhwbAHY4EfVad=1_dnhB+gaHBjPj1wWbWE4gg@mail.gmail.com/

Cheers,

-Jae

>   			gpio0: gpio@1e780000 {
>   				#gpio-cells = <2>;
>   				gpio-controller;
