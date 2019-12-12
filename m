Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0CF11CD5D
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 13:39:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YYJm0CSTzDr2q
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 23:39:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AcAgN61D"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YYJS53qYzDqv8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 23:38:57 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id c16so2555307ioo.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 04:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4IpPdaRaBlrxsdfzzqnbETQyqh0ur53iOvEIsIm5ezM=;
 b=AcAgN61DleKY64oDzbwDWOMEtB/55CO5gZrYhVRJ5x3464AyXyxVMD4ty3WUYSZnWs
 BrOL5Gw2VerKzoylEPizRHBgkEmVMUH3jNUhFyASl/F3SlU0jcDmKV7gXeQEeCJzVC3Q
 HxENLUkDcUaFQzjfW9OhFLF0FMrZRLQJ0v9OncQVEDmN7doCsZYDaBRCADan9iRmQbjr
 KCWdDJcgR9gAmn65ChnBOqY+pjX6pbO7mlsHx9q3cd4I1F/v1EtdvVswyQMCI48rB8V3
 m+0VarsAJ5m5wHuFm7oNAGE+S4oi7nSQSeh08P9vSavlVnc1KJEd0PQtKHGcwdQLhp34
 dFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4IpPdaRaBlrxsdfzzqnbETQyqh0ur53iOvEIsIm5ezM=;
 b=c2Mw82sK1fawonvoCBB3/AlVIlaENt2htQ1amiNO0fkBFXh3DVIa629SXCV4UznO2V
 VW3c1pNqAoJFzBZilg0mJ1JCtAi/8jYu161ify4e9SlehwVu1Ib4lWq2eEqBMbQ/wOtu
 /3kJRLGO1E8cVlMDBbFu3DEZmQTGNnvAgpIGWo03vlNUaqELk1unVK0ZwESKJy//VlH0
 COb3Q5d4WlpiJw+IALZiBmcA/tQJ0Xn6kdBqpN9wp4E+2ViR8MlmeQT7DrNO9J0sd8PF
 1zELwrWVmiTAGbK1Z5YnFDi55xcRt/s+oqICBfe78mpf6o1OouGtAGAlfXedFvtbCkb6
 DjRA==
X-Gm-Message-State: APjAAAVTLsYz27I1gRosFHql0z0k42u8MrVjkDvecQhhPlqCyYcgZnf5
 ENSGQN8tlcuNgmgnkAklA9U/cChc
X-Google-Smtp-Source: APXvYqzv8negx1JyPnWHMpPN4IjBEJxJaDFuRdfZDd26K615ZE1ly6bhrJWbhIw8M3xRETIaDjcdVg==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr10039407pgm.312.1576153858182; 
 Thu, 12 Dec 2019 04:30:58 -0800 (PST)
Received: from cnn ([2402:3a80:457:6a63:7070:9118:7874:2897])
 by smtp.gmail.com with ESMTPSA id k6sm6937248pfi.119.2019.12.12.04.30.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:30:57 -0800 (PST)
Date: Thu, 12 Dec 2019 18:00:50 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Message-ID: <20191212123050.GA8443@cnn>
References: <20191211202620.GA31628@cnn>
 <78c346a0-217c-4216-b16a-498f80e7303a@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78c346a0-217c-4216-b16a-498f80e7303a@www.fastmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, sdasari@fb.com, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, manikandan.e@hcl.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 11:39:59AM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 12 Dec 2019, at 06:56, Manikandan Elumalai wrote:
> > The Yosemite V2 is a facebook multi-node server
> > platform that host four OCP server. The BMC
> > in the Yosemite V2 platform based on AST2500 SoC.
> > 
> > This patch adds linux device tree entry related to
> > Yosemite V2 specific devices connected to BMC SoC.
> > 
> > --- Reviews summary
> > --- v4[2/2] - Spell and contributor name correction.
> > ---         - License identifier changed to GPL-2.0-or-later.
> > ---         - aspeed-gpio.h removed.
> > ---         - FAN2 tacho channel changed.
> > ---      v4 - Bootargs removed.
> > ---         - Reviewed-by: Vijay Khemka <vkhemka@fb.com>
> > ---      v3 - Uart1 Debug removed .
> > ---         - Acked-by:Andrew Jeffery <andrew@aj.id.au>
> 
> You need to put the Reviewed-by / Acked-by tags down below your Signed-off-by. That
> way we know that the patch is still ready to go (and they appear in patchwork - you can
> (currently) see that they're missing[1]).
> 
> [1] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=147912&state=%2A&archive=both
>
  Thanks for your patience on explaining the procedure for newbies like me . There is change in dts for FAN2 tacho channel needs to review. I will resumit again. 
> Andrew
> 
> > ---      v2 - LPC and VUART removed .
> > ---      v1 - Initial draft.
> > 
> > Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> > ---
> >  .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 148 +++++++++++++++++++++
> >  1 file changed, 148 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts 
> > b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > new file mode 100644
> > index 0000000..ffd7f4c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright (c) 2018 Facebook Inc.
> > +
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +/ {
> > +	model = "Facebook Yosemitev2 BMC";
> > +	compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
> > +	aliases {
> > +		serial4 = &uart5;
> > +	};
> > +	chosen {
> > +		stdout-path = &uart5;
> > +	};
> > +
> > +	memory@80000000 {
> > +		reg = <0x80000000 0x20000000>;
> > +	};
> > +
> > +	iio-hwmon {
> > +		// VOLATAGE SENSOR
> > +		compatible = "iio-hwmon";
> > +		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
> > +		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
> > +		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
> > +		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
> > +	};
> > +};
> > +
> > +&fmc {
> > +	status = "okay";
> > +	flash@0 {
> > +		status = "okay";
> > +		m25p,fast-read;
> > +#include "openbmc-flash-layout.dtsi"
> > +	};
> > +};
> > +
> > +&spi1 {
> > +	status = "okay";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_spi1_default>;
> > +	flash@0 {
> > +		status = "okay";
> > +		m25p,fast-read;
> > +		label = "pnor";
> > +	};
> > +};
> > +
> > +&uart5 {
> > +	// BMC Console
> > +	status = "okay";
> > +};
> > +
> > +&mac0 {
> > +	status = "okay";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_rmii1_default>;
> > +	use-ncsi;
> > +};
> > +
> > +&adc {
> > +	status = "okay";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_adc0_default
> > +			&pinctrl_adc1_default
> > +			&pinctrl_adc2_default
> > +			&pinctrl_adc3_default
> > +			&pinctrl_adc4_default
> > +			&pinctrl_adc5_default
> > +			&pinctrl_adc6_default
> > +			&pinctrl_adc7_default
> > +			&pinctrl_adc8_default
> > +			&pinctrl_adc9_default
> > +			&pinctrl_adc10_default
> > +			&pinctrl_adc11_default
> > +			&pinctrl_adc12_default
> > +			&pinctrl_adc13_default
> > +			&pinctrl_adc14_default
> > +			&pinctrl_adc15_default>;
> > +};
> > +
> > +&i2c8 {
> > +	//FRU EEPROM
> > +	status = "okay";
> > +	eeprom@51 {
> > +		compatible = "atmel,24c64";
> > +		reg = <0x51>;
> > +		pagesize = <32>;
> > +	};
> > +};
> > +
> > +&i2c9 {
> > +	//INLET & OUTLET TEMP
> > +	status = "okay";
> > +	tmp421@4e {
> > +		compatible = "ti,tmp421";
> > +		reg = <0x4e>;
> > +	};
> > +	tmp421@4f {
> > +		compatible = "ti,tmp421";
> > +		reg = <0x4f>;
> > +	};
> > +};
> > +
> > +&i2c10 {
> > +	//HSC
> > +	status = "okay";
> > +	adm1278@40 {
> > +		compatible = "adi,adm1278";
> > +		reg = <0x40>;
> > +	};
> > +};
> > +
> > +&i2c11 {
> > +	//MEZZ_TEMP_SENSOR
> > +	status = "okay";
> > +	tmp421@1f {
> > +		compatible = "ti,tmp421";
> > +		reg = <0x1f>;
> > +	};
> > +};
> > +
> > +&i2c12 {
> > +	//MEZZ_FRU
> > +	status = "okay";
> > +	eeprom@51 {
> > +		compatible = "atmel,24c64";
> > +		reg = <0x51>;
> > +		pagesize = <32>;
> > +	};
> > +};
> > +
> > +&pwm_tacho {
> > +	//FSC
> > +	status = "okay";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> > +	fan@0 {
> > +		reg = <0x00>;
> > +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> > +	};
> > +	fan@1 {
> > +		reg = <0x01>;
> > +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> > +	};
> > +};
> > -- 
> > 2.7.4
> > 
> >
