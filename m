Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFB48CDDDC
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 02:06:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=asSNy4Fa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VllZG1TZ2z78mg
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 10:01:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=asSNy4Fa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VllZ62L8qz78lR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 May 2024 10:01:17 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9453C20075;
	Fri, 24 May 2024 08:01:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716508876;
	bh=FRh3v+DpUqq0irMJLtFl1AS9WmSx+bJ219CeU6lA6XE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=asSNy4FaG4rCai1mMhq1l1iBz6v3bmu7J95cNw2rd46+MrZEuQsGsiec6v4UYpRXn
	 hra5+gjbvazAljrMSm29uryjeAm7VO5/pywW4nYn31Z2+knQXJztSenjgcK1aIknk5
	 jSbEhZlnLcwGqourbjISIeHlkIBLisCebh80wJCzo08ssruvLaCcEtS5yz5ksQqKtV
	 rH2VUMnzc1Dp/DJL8AtuNFgSUJ4haK6T03roNi6nta9aPdwCeuSZWAbs9siUhbiims
	 0wpGhSYtpMqbdlq7Tpy9C41eK7ITmKfqi3gNzVPOm7+tvAherXs70okjIP2d2+n2el
	 FxTZol/o9bfwg==
Message-ID: <6cf99700841ac27c74821e92b5d7d9fe778b9e67.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 00/23] Add i2c-mux and eeprom devices for Meta
 Yosemite 4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
Date: Fri, 24 May 2024 09:31:10 +0930
In-Reply-To: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240523091812.2032933-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There's still no response to my comments (either replies or adjustments
to the patches) on v5, and we're now at v8.

Upstreaming the patches won't progress if you don't engage with the
feedback.

Andrew

On Thu, 2024-05-23 at 17:17 +0800, Delphine CC Chiu wrote:
> Changelog:
>   - v8
>     - add fan led config
>   - v7
>     - Revise pca9506 i2c address
>   - v6
>     - Revise i2c duty-cycle for meeting 400khz spec
>   - v5
>     - Support medusa board adc sensors
>     - support NIC eeprom
>   - v4
>     - Re-format gpio linename
>     - Revise i2c device node names
>     - Split patches by logic changes
>   - v3
>     - Correct patch for revising gpio name
>   - v2
>     - Revise mx31790 fan tach config
>     - Add mctp config for NIC
>     - Support mux to cpld
>     - Revise gpio name
>   - v1
>     - Add gpio and eeprom behind i2c-mux
>     - Remove redundant idle-state setting for i2c-mux
>     - Enable adc 15, wdt2,spi gpio for yosemite4 use
>     - Revise quad mode to dual mode to avoid WP pin influnece the SPI
>     - Revise power sensor adm1281 for yosemite4 schematic change
>     - Add gpio pca9506 I/O expander for yosemite4 use
>     - remove space for adm1272 compatible
>     - enable interrupt setting for pca9555
>     - add eeprom for yosemite4 medusa board/BSM use
>     - remove temperature sensor for yosemite4 schematic change
>     - add power sensor for power module reading
>     - Revise adc128d818 adc mode for yosemite4 schematic change
>     - Revise ina233 for yosemite4 schematic change
>     - Remove idle state setting for yosemite4 NIC connection
>     - Initialize bmc gpio state
>     - Revise mx31790 fan tach config
>     - Add mctp config for NIC
>     - Support mux to cpld
>     - Revise gpio name
>=20
> Delphine CC Chiu (23):
>   ARM: dts: aspeed: yosemite4: Revise i2c-mux devices
>   ARM: dts: aspeed: yosemite4: Enable adc15
>   ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
>   ARM: dts: aspeed: yosemite4: Enable watchdog2
>   ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
>   ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic
>     change
>   ARM: dts: aspeed: yosemite4: Add gpio pca9506
>   ARM: dts: aspeed: yosemite4: Remove space for adm1272 compatible
>   ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
>   ARM: dts: aspeed: yosemite4: Add power sensor for power module reading
>   ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
>   ARM: dts: aspeed: yosemite4: Remove temperature sensor for yosemite4
>     schematic change
>   ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode for yosemite4
>     schematic change
>   ARM: dts: aspeed: yosemite4: Revise ina233 config for yosemite4
>     schematic change
>   ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4
>     NIC connection
>   ARM: dts: aspeed: yosemite4: Initialize bmc gpio state
>   ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
>   ARM: dts: aspeed: yosemite4: add mctp config for NIC
>   ARM: dts: aspeed: yosemite4: support mux to cpld
>   ARM: dts: aspeed: yosemite4: support medusa board adc sensors
>   ARM: dts: aspeed: yosemite4: support NIC eeprom
>   ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
>   ARM: dts: aspeed: yosemite4: add fan led config
>=20
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 1410 +++++++++++++++--
>  1 file changed, 1301 insertions(+), 109 deletions(-)
>=20

