Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCE8A46AE
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 04:00:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hBy7g+t/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHr3n5xYNz3cQm
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 12:00:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hBy7g+t/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHr3T5zQnz3dWC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 12:00:21 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 02EBF20178;
	Mon, 15 Apr 2024 10:00:16 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713146421;
	bh=4JN0tAr608v0a3WDiRHuCB76k+2EG5tPDD9zb/YKbbI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=hBy7g+t/Ktc0HAQjVZsZridZcZqOWWQUY7N0QVUIDq3zNeN4Im8BKMf0qtOycLPXi
	 xBq4fpA/kaZH5goAwfoueX3uRkyimqDvxdbM52pyC3hfSDatmoJe1kl6ozjBTPs4CY
	 c60IMdkEeknajh1SnLUfVkJQrpEkaCyTofYpfp0oMJX/cwBmLOrAuJiLWp835MUUpJ
	 ky9NnYGT7Tkl/mHVXIXEA+ckKd7KWMT8CPcjfWmwy9gvqx2ln6DKxj5Yequ0yDiPAP
	 XDn7sDcV0z7drPRCSMhIljXQ+BFp5phmwfcxiysZD70PCq7vWWJT5pSfkNhcv/YCEG
	 p4cShrTqagJSg==
Message-ID: <3eb80a2f21a96cc0fc275db60631f673bb14e77f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 00/12] Revise Meta(Facebook) Harma BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 15 Apr 2024 11:30:14 +0930
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Fri, 2024-04-12 at 17:15 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
>=20
> Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP=
8Qbepm1AVjuCbaKw@mail.gmail.com/
>=20
> Change log:
>=20
> v4 -> v5
>   - Patch 0011 - Add retimer device
>   - Patch 0012 - Modify gpio line name
>=20
> v3 -> v4
>   - Patch 0010 - Revise node name
>   - fixed PDB temperature node name in Patch 0006
>=20
> v2 -> v3
>   - Patch 0007 - Revise max31790 address
>   - Patch 0008 - Harma: Add NIC Fru device
>   - Patch 0009 - Add ltc4286 device
>=20
> v1 -> v2
>   - Add infineon,slb9670 information for tpm.
>   - Patch 0006 - Add PDB temperature.
>=20
> v1
>   - Patch 0001 - Revise SGPIO line name.
>   - Patch 0002 - Mapping ttyS2 to UART4.
>   - Patch 0003 - Remove Vuart.
>   - Patch 0004 - Add cpu power good line name.
>   - Patch 0005 - Add spi-gpio.
>=20
> Peter Yin (12):
>   ARM: dts: aspeed: Harma: Revise SGPIO line name.
>   ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
>   ARM: dts: aspeed: Harma: Remove Vuart
>   ARM: dts: aspeed: Harma: Add cpu power good line name
>   ARM: dts: aspeed: Harma: Add spi-gpio
>   ARM: dts: aspeed: Harma: Add PDB temperature
>   ARM: dts: aspeed: Harma: Revise max31790 address
>   ARM: dts: aspeed: Harma: Add NIC Fru device
>   ARM: dts: aspeed: Harma: Add ltc4286 device
>   ARM: dts: aspeed: Harma: Revise node name
>   ARM: dts: aspeed: Harma: Add retimer device
>   ARM: dts: aspeed: Harma: Modify GPIO line name
>=20
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 107 ++++++++++++++----
>  1 file changed, 85 insertions(+), 22 deletions(-)
>=20

Joel had applied an earlier version of this series to his for-next
branch. I'm collecting patches targeting it while he's on leave. I've
updated the series he'd applied to the v5 you've posted here.

Can you please post any further changes as patches on top? You can find
my branch here:

https://github.com/amboar/linux/tree/for/bmc/dt-6.10

Andrew
