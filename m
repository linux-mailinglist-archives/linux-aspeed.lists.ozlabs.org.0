Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0E957926
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ00v3Bz30Ns
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KHU+A3iT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZGcw0HYFz3brZ;
	Wed, 14 Feb 2024 09:45:35 +1100 (AEDT)
Received: from heihei.fritz.box (ppp14-2-125-29.adl-apt-pir-bras32.tpg.internode.on.net [14.2.125.29])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AC79201BD;
	Wed, 14 Feb 2024 06:45:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707864333;
	bh=rroNdU9BVPUWE5wDt+3REaeJt2znsw1CC54JRzmWpmY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KHU+A3iT+rXyEDnXx+5mY8gdyPd9RWW+IqjkatculYf0WMU9pEWV3lRQCkTDA0EzI
	 xaQRdVv6ONl5bSVVt+LS/QHv9KXR0YT+wOKEzHEk6ENorzt6peBUrGxgmVVbj1w/iy
	 1HjnEw+ZCd2iWua115sYd63cgh4PNaf4kwKyTyoar7mOLyZhESbJxdxIq+yzZzyaNX
	 SW0fRRSQjx4ywPBzEZtsbYSOEQ+k4WVQplTD0W2lni1ygtrlTWCGNAeTjZ9xaf0EWM
	 Dto/KMIkfYa0O5HKCg8KnOdWszlCAKyfH/kkPoEvmSP1qCSUbu5pEXrDsZ9ADFy8aH
	 cV53xTq95Tecw==
Message-ID: <9a67cee101e7e15d5e70553e3929ee2fbd480c1f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, soc@kernel.org, Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine
 Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>, Ray Jui
 <rjui@broadcom.com>,  Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>,  Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  Jonathan
 =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan
 Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  =?ISO-8859-1?Q?Beno=EEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Chanho
 Min <chanho.min@lge.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Date: Wed, 14 Feb 2024 09:15:14 +1030
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
	 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-02-13 at 13:34 -0600, Rob Herring wrote:
> The dtc interrupt_provider warning is off by default. Fix all the warning=
s
> so it can be enabled.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/amazon/alpine.dtsi                   |  1 -
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi                | 14 ------------=
--
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi                | 15 +-----------=
---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                | 18 ++----------=
------

I wrote a very similar patch just a day or so ago, so thanks :)

For the Aspeed portions:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
