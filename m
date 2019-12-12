Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65711C1E4
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 02:08:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YFzl0D1ZzDqng
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 12:08:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Imlmo23G"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iJi33v66"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YFzZ0Sf1zDqg6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 12:08:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9168D22396;
 Wed, 11 Dec 2019 20:08:21 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 11 Dec 2019 20:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=22RmgyxfJBeRaOGSVLQVBw8m1e4rYRQ
 3qBL8OQyhN/Y=; b=Imlmo23GJ4QKdJUpt5POxJxEZpbC7ctOVu7pyNq2j/KsAzP
 zZrU1zj8p43psHP0Gbye7hKCnxDVNOhMF27UkYYI/92V5lZZ7vTwZPMg16jRez1h
 FOHZIHzMjaKN/LV5QKNISXQAptOxja0WwfnAIyYZNM47nRDEtnt3prAW95FQ04lq
 zaEQSJvcGlZ7plP8tYrmbw8wbd5kFeLOnH3jrc22GnBut5c2kvyVPGZLyINFclO8
 sH0/YatoOr8+nMGyYGgrCe/cbMjaRHWtikPY3oVq55fyAzpU1j+dpEeroZgGXT3q
 z/S9vmOIBZj55RaylPOmg7otZTvDm74JrIHcU9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=22Rmgy
 xfJBeRaOGSVLQVBw8m1e4rYRQ3qBL8OQyhN/Y=; b=iJi33v66ZxMXJSINKmsIje
 i15D2JBbp7LqZbs6GzH5B21XuH4tnx6hWkeFHjk+Hna88R/ZxH7CczzV6s0QWy28
 El1nJh9TQSIXG17cBmrIz2UezZoIGIopAMJsBkudjXoqEpKg0HdJiMDqgrWhjjKy
 biUIGl22KQI27E3AvwkIykU1YtztFmxbasx6XNPsRXsJaYeScwxVmquNCASYdUx/
 l2u28/D9/rL1/UYZRCPj5n4zDXhKd7AYU5RG4lMF0q+VGDHlSpdILS4E9ZjJ0OVP
 7FDzycKrwQYbJHdJVK9lDOqhUX3Ud7PrgURwFNV6mVs7JdsKtIvU/Tkj1pEcpWVg
 ==
X-ME-Sender: <xms:BJPxXRu9Q43kARsWuqi9hPpfRnqs0NAe9O-1iraS9_Td-uCXSUnUSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeliedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehoiihlrggsshdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:BJPxXc3sE6S4-KnHKsaJfEmfm9cy3_7h_SywkMa7HBmp7UiyIhvRag>
 <xmx:BJPxXeACy88E_qLznCMjv-WUPyuZTxmzG_P0IHghE4IdODxFLWBKYw>
 <xmx:BJPxXbUkRlBYL9dpfySX1av0iQDMxTufh5HlSR3AjUJOxmEyU-ZbbA>
 <xmx:BZPxXS5vw9LN0T0uSZEZixaXr2S6QM5crlBzqRYudQn-waBXInKcuQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6CCE0E00A2; Wed, 11 Dec 2019 20:08:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <78c346a0-217c-4216-b16a-498f80e7303a@www.fastmail.com>
In-Reply-To: <20191211202620.GA31628@cnn>
References: <20191211202620.GA31628@cnn>
Date: Thu, 12 Dec 2019 11:39:59 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: manikandan-e <manikandan.hcl.ers.epl@gmail.com>,
 "Joel Stanley" <joel@jms.id.au>, vkhemka@fb.com
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Sai Dasari <sdasari@fb.com>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 manikandan.e@hcl.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 12 Dec 2019, at 06:56, Manikandan Elumalai wrote:
> The Yosemite V2 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V2 platform based on AST2500 SoC.
> 
> This patch adds linux device tree entry related to
> Yosemite V2 specific devices connected to BMC SoC.
> 
> --- Reviews summary
> --- v4[2/2] - Spell and contributor name correction.
> ---         - License identifier changed to GPL-2.0-or-later.
> ---         - aspeed-gpio.h removed.
> ---         - FAN2 tacho channel changed.
> ---      v4 - Bootargs removed.
> ---         - Reviewed-by: Vijay Khemka <vkhemka@fb.com>
> ---      v3 - Uart1 Debug removed .
> ---         - Acked-by:Andrew Jeffery <andrew@aj.id.au>

You need to put the Reviewed-by / Acked-by tags down below your Signed-off-by. That
way we know that the patch is still ready to go (and they appear in patchwork - you can
(currently) see that they're missing[1]).

[1] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=147912&state=%2A&archive=both

Andrew

> ---      v2 - LPC and VUART removed .
> ---      v1 - Initial draft.
> 
> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> ---
>  .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 148 +++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> new file mode 100644
> index 0000000..ffd7f4c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2018 Facebook Inc.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +/ {
> +	model = "Facebook Yosemitev2 BMC";
> +	compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	iio-hwmon {
> +		// VOLATAGE SENSOR
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
> +		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
> +		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
> +		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
> +};
> +
> +&uart5 {
> +	// BMC Console
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +	use-ncsi;
> +};
> +
> +&adc {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default
> +			&pinctrl_adc1_default
> +			&pinctrl_adc2_default
> +			&pinctrl_adc3_default
> +			&pinctrl_adc4_default
> +			&pinctrl_adc5_default
> +			&pinctrl_adc6_default
> +			&pinctrl_adc7_default
> +			&pinctrl_adc8_default
> +			&pinctrl_adc9_default
> +			&pinctrl_adc10_default
> +			&pinctrl_adc11_default
> +			&pinctrl_adc12_default
> +			&pinctrl_adc13_default
> +			&pinctrl_adc14_default
> +			&pinctrl_adc15_default>;
> +};
> +
> +&i2c8 {
> +	//FRU EEPROM
> +	status = "okay";
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +	};
> +};
> +
> +&i2c9 {
> +	//INLET & OUTLET TEMP
> +	status = "okay";
> +	tmp421@4e {
> +		compatible = "ti,tmp421";
> +		reg = <0x4e>;
> +	};
> +	tmp421@4f {
> +		compatible = "ti,tmp421";
> +		reg = <0x4f>;
> +	};
> +};
> +
> +&i2c10 {
> +	//HSC
> +	status = "okay";
> +	adm1278@40 {
> +		compatible = "adi,adm1278";
> +		reg = <0x40>;
> +	};
> +};
> +
> +&i2c11 {
> +	//MEZZ_TEMP_SENSOR
> +	status = "okay";
> +	tmp421@1f {
> +		compatible = "ti,tmp421";
> +		reg = <0x1f>;
> +	};
> +};
> +
> +&i2c12 {
> +	//MEZZ_FRU
> +	status = "okay";
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +	};
> +};
> +
> +&pwm_tacho {
> +	//FSC
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +};
> -- 
> 2.7.4
> 
>
