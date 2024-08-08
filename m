Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A992594B983
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 11:13:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=YwrCK3Bi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfhDK2GJ7z2xmV
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 19:13:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=YwrCK3Bi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.67; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1959 seconds by postgrey-1.37 at boromir; Thu, 08 Aug 2024 19:13:30 AEST
Received: from msa.smtpout.orange.fr (smtp-67.smtpout.orange.fr [80.12.242.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfhDB5VQZz2xZT
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 19:13:30 +1000 (AEST)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bygMs1WA1j4pfbygMs0Sl1; Thu, 08 Aug 2024 10:39:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723106386;
	bh=clc8+qLSQc4IJ8Eo2E+itAv4AyWz9hMSaxLRJC2XBVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=YwrCK3Bi5RAPUYYMryFqaR6gycvmvqQyJoABzpvaKJP9Alp4S7xH90da/Bl2/iSrd
	 R7Znr7Lc7e+SMUj7mjTih3bx87fLwArT4ln67hCZSEzpgc5MmtL46H3ZCOnLKYteow
	 UKLwavmCtKkQP8Z16FZGY3FtAB9n/uJHGYOLbFa/cisUoY/sV6Ed/U0mGH9AOY/Z6A
	 ashps3bKtm+l9L2jYkxQaV42ItTccRHgb6fUpNcbh5UzbqAX8yX9AFgJTWuJO8rTC9
	 rJPK1pucj0tKABXFwJdxnof2Co72wdFhisgiJsbPBRoRKjKivLbjEOq2byKOYviNqk
	 4eS7rL/Xwdi7Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 08 Aug 2024 10:39:46 +0200
X-ME-IP: 90.11.132.44
Message-ID: <14ef9485-54ba-402b-9b90-5f10c1523d4e@wanadoo.fr>
Date: Thu, 8 Aug 2024 10:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add AST2700 clock bindings
To: Ryan Chen <ryan_chen@aspeedtech.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240808075937.2756733-1-ryan_chen@aspeedtech.com>
 <20240808075937.2756733-4-ryan_chen@aspeedtech.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240808075937.2756733-4-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 08/08/2024 à 09:59, Ryan Chen a écrit :
> Add dt bindings for AST2700 clock controller
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>   .../dt-bindings/clock/aspeed,ast2700-clk.h    | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100644 include/dt-bindings/clock/aspeed,ast2700-clk.h
> 
> diff --git a/include/dt-bindings/clock/aspeed,ast2700-clk.h b/include/dt-bindings/clock/aspeed,ast2700-clk.h
> new file mode 100644
> index 000000000000..facf72352c3e
> --- /dev/null
> +++ b/include/dt-bindings/clock/aspeed,ast2700-clk.h
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Device Tree binding constants for AST2700 clock controller.
> + *
> + * Copyright (c) 2024 Aspeed Technology Inc.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_AST2700_H
> +#define __DT_BINDINGS_CLOCK_AST2700_H
> +
> +/* SOC0 clk-gate */
> +#define SCU0_CLK_GATE_MCLK	(0)
> +#define SCU0_CLK_GATE_ECLK	(1)
> +#define SCU0_CLK_GATE_2DCLK	(2)
> +#define SCU0_CLK_GATE_VCLK	(3)
> +#define SCU0_CLK_GATE_BCLK	(4)
> +#define SCU0_CLK_GATE_VGA0CLK	(5)
> +#define SCU0_CLK_GATE_REFCLK	(6)
> +#define SCU0_CLK_GATE_PORTBUSB2CLK	(7)
> +#define SCU0_CLK_GATE_RSV8	(8)
> +#define SCU0_CLK_GATE_UHCICLK	(9)
> +#define SCU0_CLK_GATE_VGA1CLK	(10)
> +#define SCU0_CLK_GATE_DDRPHYCLK	(11)
> +#define SCU0_CLK_GATE_E2M0CLK	(12)
> +#define SCU0_CLK_GATE_HACCLK	(13)
> +#define SCU0_CLK_GATE_PORTAUSB2CLK	(14)
> +#define SCU0_CLK_GATE_UART4CLK	(15)
> +#define SCU0_CLK_GATE_SLICLK	(16)
> +#define SCU0_CLK_GATE_DACCLK	(17)
> +#define SCU0_CLK_GATE_DP	(18)
> +#define SCU0_CLK_GATE_E2M1CLK	(19)
> +#define SCU0_CLK_GATE_CRT0CLK	(20)
> +#define SCU0_CLK_GATE_CRT1CLK	(21)
> +#define SCU0_CLK_GATE_VLCLK	(22)
> +#define SCU0_CLK_GATE_ECDSACLK	(23)
> +#define SCU0_CLK_GATE_RSACLK	(24)
> +#define SCU0_CLK_GATE_RVAS0CLK	(25)
> +#define SCU0_CLK_GATE_UFSCLK	(26)
> +#define SCU0_CLK_GATE_EMMCCLK	(27)
> +#define SCU0_CLK_GATE_RVAS1CLK	(28)
> +/* reserved 29 ~ 31*/
> +#define SCU0_CLK_GATE_NUM	(SCU0_CLK_GATE_RVAS1CLK + 1)
> +
> +/* SOC0 clk */
> +#define SCU0_CLKIN		(SCU0_CLK_GATE_NUM + 0)

So SCU0_CLKIN is 28+1+0 = 29 which is said to be reserved in the comment 
above.

> +#define SCU0_CLK_24M		(SCU0_CLK_GATE_NUM + 1)
> +#define SCU0_CLK_192M		(SCU0_CLK_GATE_NUM + 2)
> +#define SCU0_CLK_UART		(SCU0_CLK_GATE_NUM + 3)
> +#define SCU0_CLK_PSP		(SCU0_CLK_GATE_NUM + 4)
> +#define SCU0_CLK_HPLL		(SCU0_CLK_GATE_NUM + 5)

...

