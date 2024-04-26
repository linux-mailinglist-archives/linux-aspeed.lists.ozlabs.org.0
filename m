Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 344558B2E2C
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:59:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jZHya2SQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQZ9v5qqTz3dLl
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:59:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jZHya2SQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQZ9p5H70z3cRR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 10:59:10 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7711320075;
	Fri, 26 Apr 2024 08:59:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714093150;
	bh=MAnTooQ3NWgoEkJO0tXSf39pJZ1lMIpBC5h/JQHXvew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jZHya2SQ6YJ7VWUlGZbqB0aMCTZfYXBAsGHhVoMIGiACDXu8l7aI9qVxqPF6RStCa
	 /trLlmZPQAPAeGw9kVikC96f+Ur0+azQhWR3z3lXgosxtyh/Igijl0xzPTHjX/mv/z
	 kK77IgFgLZkNAWpa0x+wsDuh0CfA1sbFWhtVczMiwjd1dEYlIfFAJNZZQ6OZV9O/YP
	 t1CBaTlDYVgRgk1wNcq0eAuw39LeRq8KIl3Pdj7k5fEjGzdl0WJQTs+r92bEuDtBiV
	 jgAiObK3rdJKlKiRnv6qm98UTa9rW+OnY/rU1VIpEH5P6lET5M70qLCaXpVPPq4sab
	 oS/3+SJ8rYPWg==
Message-ID: <cfa6d4071f3789ee6ddef302f685c63d4de0ba36.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] Add nct7363 in yosemite4 dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Fri, 26 Apr 2024 10:29:08 +0930
In-Reply-To: <20240425060626.2558515-3-Delphine_CC_Chiu@wiwynn.com>
References: <20240425060626.2558515-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240425060626.2558515-3-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-25 at 14:06 +0800, Delphine CC Chiu wrote:
> ARM: dts: aspeed: yosemite4:

This should be in the patch subject, not the commit message body.

> Add nct7363(0x21 and 0x23) in yosemite4.dts
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index e45293762316..06b709b0a706 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -467,6 +467,42 @@ channel@5 {
>                                  };
>  			};
> =20
> +			hwmon0: hwmon@21 {

I feel hwmon describes a subsystem in linux more than it does hardware,
and using it for a node name feels a bit off to me. It's not listed in
the devicetree spec (v0.4) as a recommended generic name, and is only
used in a handful of devicetrees - two of which are ancient BMC
devicetrees:

((v6.9-rc5)) $ git grep -l hwmon@ -- arch/arm/boot/dts/
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts
arch/arm/boot/dts/intel/ixp/intel-ixp42x-freecom-fsg-3.dts
arch/arm/boot/dts/intel/ixp/intel-ixp42x-gateworks-gw2348.dts
arch/arm/boot/dts/intel/ixp/intel-ixp43x-gateworks-gw2358.dts
arch/arm/boot/dts/marvell/armada-370-c200-v2.dts
arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
arch/arm/boot/dts/microchip/lan966x.dtsi
arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts
arch/arm/boot/dts/xilinx/zynq-zc702.dts

> +				compatible =3D "nuvoton,nct7363";

This compatible seems to be undocumented as of v6.9-rc5? Should you
also send a binding patch?

Andrew
