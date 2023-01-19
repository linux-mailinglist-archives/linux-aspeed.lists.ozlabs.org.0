Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9B677461
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bFt3WcQz3bTq
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha1 header.s=fm2 header.b=bQ1Lex1b;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm3 header.b=gH4TLQKq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bQ1Lex1b;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gH4TLQKq;
	dkim-atps=neutral
X-Greylist: delayed 352 seconds by postgrey-1.36 at boromir; Thu, 19 Jan 2023 15:45:01 AEDT
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny9655BTkz3c7Q
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:45:01 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 2E52F32002D8;
	Wed, 18 Jan 2023 23:44:58 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 18 Jan 2023 23:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674103497; x=1674189897; bh=RA62djbRjH
	AtR5eYDGCg3s9PgydQzyaEPXFw3P5ADCE=; b=bQ1Lex1biSOsg9sZ0oCG32YJjg
	ymUiX5FA89IlkUP0WnP4Mqbfg3cRGRfDMd/Q9HMHxZyPeveH/z8DNzb9Y2JyciS9
	PbR458V7YzwoRUwih89rXDzIQeadvmjl4laV/9igg04WSdFxrnnOafzF1oehvDhV
	0XayKr4JLT10lkAZu7NShyxFpzhNgRANVRnvZBuZpCszrKLwIWYebsJyx6jGy5lr
	zkVjlgVd103/d/Z3i2laAkK2x0leJjXwsw5Wf+dzjJ3jK4CiVCz+0qPuE158uMq7
	cWkgoFDu0cNjnseoQ+eeu9L4IPa6Le4Uc5xvVu8zdwPvQ9mUCD0aB3zHWiQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674103497; x=1674189897; bh=RA62djbRjHAtR5eYDGCg3s9PgydQ
	zyaEPXFw3P5ADCE=; b=gH4TLQKqQ3ouj/hKJKXkuCBSaYp1Utvr1tqT5JHO8dAS
	LqMSLpW0Q1IiOhP11OGXZnGtFt6/CNcATiaWIEajheAAQqh/+sVZC1mKFZyV6Gfr
	1zJShEs48+Id9p6LgF4Hv78ghevwRh/72pA3tZGN3pq9BF2LRG/kyuF1A+LofmL4
	7oTrKkLV9/3vOJdY6eCabQcLB3OyzxsRmSreTHRKUCYT7vOqzXzafdg15xpCH/x3
	0/+9NGh8xLdxaLeVwGSCyyqZKgHswU9a/IVf4B2mLGdH3fp2uWzroVajfJ8toLIG
	XD+wjySvyoz7fvaZ5PVyU+V9eszLfmriVqQKpz7i2g==
X-ME-Sender: <xms:yMrIY7pCyXxUMOvaDKg2BAcTqICUraG38J-Nrpj3Jqt5QjSlu4Tu_w>
    <xme:yMrIY1qhEgvdxItp5fbsmCTEN1D2vbWb98Gg8GxGhXwrFWABp7HZHQV3cPqpLhGPC
    OvL8Qv3UAAvNOjnZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:yMrIY4PnPTa0pI2mk7ylIXFS6WM5xsFnHxvupr09IJ7xciQy9a-poQ>
    <xmx:yMrIY-6wAgKJPmeYq1fdu5mkCyeb74PoPwTI_8bMlCnagMBn9b8N2A>
    <xmx:yMrIY67txgF_3CsmtcEk9pWkopnv4Fg3GzuNDnu2P2ykVK1LxhHxAg>
    <xmx:ycrIY_pByLB2jT-LFgxAD3ro1NLEN5i3aZT12bkvkjM1hHQvuvnyIw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A40C61700089; Wed, 18 Jan 2023 23:44:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <9a82d30a-c8ca-47fb-a976-f7f4d99cefec@app.fastmail.com>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Date: Thu, 19 Jan 2023 15:14:36 +1030
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
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation, lowercase
 hex
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
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--

For the Aspeed change:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
