Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4874F677462
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bFz1KHZz3bZ4
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha1 header.s=fm2 header.b=MUTjYaga;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm3 header.b=Q52GecV3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=MUTjYaga;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q52GecV3;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny9Jn5w92z3bbc;
	Thu, 19 Jan 2023 15:54:17 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 4732E3200933;
	Wed, 18 Jan 2023 23:54:14 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 18 Jan 2023 23:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674104053; x=1674190453; bh=Jp0nEIifZi
	HOJSvV20z7BP6fpn/Kau5COB1QREBO070=; b=MUTjYaga/VCVR8wOIxvTD1adQB
	bVcsOamVjgMrs5qSWExP21qadvS9tslA8kaK8PAv1FY/Ij+tKRK4qMo/AkgwDK4u
	+Egl+gmfZqsMV7bp+XfiZybdaBEKaPRO9xomqyOIi0rZrUMLuUT7Lz9xr3OMMRvr
	WOcmHZVaDGAsYPVTh8VH/DEv8EmBtdKXnrgdt141UDjJIqFZZWJh/8WvaCFM6Rw3
	K8rrIgzZFIWll7Q8TjYbSjpzmNJKqqeklTpZAL57RjU+vYBHXNx+zq25vqpvFXG8
	mxFDlhr4IDsFMYzYFVBfOU38Ro7U3V/XGqGnnF4EBHvMktipbUfTiY73XyGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674104053; x=1674190453; bh=Jp0nEIifZiHOJSvV20z7BP6fpn/K
	au5COB1QREBO070=; b=Q52GecV34my9RM50i4VjcIWg/PrSmrWYotOymHrXZiyQ
	VHgeG2VvTiQD5hf6H8K2Ug2TVQhUQdbMzfGPs2WDeOUbjjUtk7ZC3FU7g6U7pm10
	sOQt57lRcqImb454oTPbUCyqG6QweAJfGVw/Ms0iczG7rylZwDkQbv28kEu8fw2x
	CN+pqnWIa895VWyzaiyb+CfEGWBJIYtduX9QiuhkaRVL32fme9CmuuKWRM4A0X93
	hMBgFKlQsCaJ1HHV8X7MS0eH1iqmThckugzVf1mD9aajNyFnJUljp9iYDAD1/Cyd
	EfQN5wgL9dF3KyR3Z1iXLxbPMR+91z+iar22sJH7Bg==
X-ME-Sender: <xms:9czIY6kWaYeYw_FKjA7Nl7poJpuOj4scvZKNgvQWSRcttVOaIlC0GQ>
    <xme:9czIYx2Y3Msp27EujWGe4TaFxUvoTP9gxq-_jT6sfZOTDYijUAZUD-tlvYYzE9tqB
    IHD23qA3o33QjBZWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9czIY4oqs1Uo2gRCmXk67fJ8llPsqDtXBwE7XqNCwaNyPfo-DgNM4Q>
    <xmx:9czIY-mEnJ0P4Vqa60Ko5f3Hofzf5pgIN3gYWvf368x1UkzE1KD3Yw>
    <xmx:9czIY42xHYz1PSscl1louZ3dhQXg6D_yYEuGVx7UM6aJ5wr_7QE2kQ>
    <xmx:9czIY2m5I1IcHq89PeACGhMtafkHrE2oynuAdpnu6dTpWzSUSMEe4Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 183811700089; Wed, 18 Jan 2023 23:54:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <47290046-59a2-4bf0-8af0-3a7b4304deb3@app.fastmail.com>
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 19 Jan 2023 15:23:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Mark Brown" <broonie@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>, "Kamal Dasu" <kdasu.kdev@gmail.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Han Xu" <han.xu@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Andy Gross" <agross@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Haibo Chen" <haibo.chen@nxp.com>,
 "Yogesh Gaur" <yogeshgaur.83@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Heiko Stuebner" <heiko@sntech.de>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Li-hao Kuo" <lhjeff911@gmail.com>,
 "Michal Simek" <michal.simek@xilinx.com>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 =?UTF-8?Q?=EF=BF=BDecki?= <rafal@milecki.pl>,
 "Vaishnav Achath" <vaishnav.a@ti.com>,
 "Parshuram Thombare" <pthombar@cadence.com>,
 "Leilk Liu" <leilk.liu@mediatek.com>, "Gabor Juhos" <juhosg@openwrt.org>,
 "Bert Vermeulen" <bert@biot.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Marek Vasut" <marex@denx.de>, "Birger Koblitz" <mail@birger-koblitz.de>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Anson Huang" <Anson.Huang@nxp.com>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Kuldeep Singh" <singh.kuldeep87k@gmail.com>,
 "Pragnesh Patel" <pragnesh.patel@sifive.com>,
 "Christophe Kerello" <christophe.kerello@foss.st.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Erwan Leray" <erwan.leray@foss.st.com>,
 "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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



On Thu, 19 Jan 2023, at 04:09, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/allwinner,sun4i-a10-spi.yaml  |  2 +-
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml   |  6 +++---
>  .../bindings/spi/amlogic,meson6-spifc.yaml     |  6 +++---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml       |  2 +-

For the Aspeed change:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
