Return-Path: <linux-aspeed+bounces-422-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41686A094AA
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jan 2025 16:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV4kT5Q1gz3cWY;
	Sat, 11 Jan 2025 02:06:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736521617;
	cv=none; b=g9GsenGqRzoOPa9OCjQj3o8bwLpVjVBSaBVOKzYNggqQQCJ8HvGmHkEmYFUhS85Ti/GfQyGsK356lPlV96FeeIERm1q1Uvo/HCuDRxQ7hjoyUGxV/zJSNwLngsarUOcODn83D59mLZSrcqAm5xtT9or4NRTxq7/e4iTecla0gjBJOFPaZ3w5TUorBtkKWxtBai76825b4AJqpusxyRMK/qFYQRgSLFm6v1zS2Hq/Ivw1v/A7kDoMeMuzeOb5OfjctnZXvmdJxUieu+T52iLF7kFFQ4KNtnFpkseEWp6wjAqdCdNUVEh2uDvwYbgIu2uEotHNipPrQ3LxeBQpOd0tLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736521617; c=relaxed/relaxed;
	bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=myf9XSifOWWEzWKo/9IBNUkZXs+NqLrj28ydKCBIxfl1Yip380D4F5EoBzVi1OyvM/BMMUnyZ5bHhm5Y1yuuMLmcwhXvj00w/4/rXzbg+qryrytlNY2twGW+HGZenDo59NtXmc7csaThp7Jv++QQPQjmZSTJrBav6pHEr/tPd7luBcoVhWK6OkIvRcOSO+5l/vfQb+4D8LxaBMR6Sc+Gok4d/ovhNfkfnkRagMtjlEoL0Ml9g2aXTwv6YgY9npTiDHGwlfSIaYWdsxGDB2VVihbFbyvSIVZVTgvz/EbRPXlTKvx/ZihcvnumnHTzMjtm+8/SX6hqypWf3BxA6SVm1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bM3aHv2e; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bM3aHv2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV4kR51Syz2ynj;
	Sat, 11 Jan 2025 02:06:53 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD1D1BF205;
	Fri, 10 Jan 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736521608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8hqtpx7uSmFFCBt4R+XArsWuILvupPoqhgNSuXM+dY=;
	b=bM3aHv2eZDPIEogkHXuaz90KY+89c/SS6D88M5Wwse/oE9y22gsGc/f1A8uC8lhyczxePx
	Rb00zNoRl/Jqt4Rnx2w8AcwTkm4UgnSaR/HS4gHDeSMDpQTBSITwMoxgl5bMwlfDR7/2Ex
	4678QsL8tSDo270hZROIzDvS4dvPmSaDeww2Q2qXcyFoH/YdmcJiq6OWaXl/7F2wYSL727
	yhpchOJrpNEM7J52JVcWYn19Jz67QyEwTI9gquIRwE3+7wGP8GWRfXVZ+CnsGH511T/Ug0
	dK1IpVJOGgF/Nc85wZftpbWnToLYHGKcXdNY97F3DTjah4672ArjZoy9pk9bKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung <schung@nuvoton.com>,
  Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Raju Rangoju <Raju.Rangoju@amd.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <stlin2@winbond.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-mtd@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
  openbmc@lists.ozlabs.org,  linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
In-Reply-To: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jan 2025 14:52:29 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
	<20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
	<ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
	<87tta6ag5b.fsf@bootlin.com>
	<c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:06:42 +0100
Message-ID: <87y0zi908t.fsf@bootlin.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/01/2025 at 14:52:29 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jan 10, 2025 at 03:37:52PM +0100, Miquel Raynal wrote:
>> On 10/01/2025 at 12:42:47 GMT, Mark Brown <broonie@kernel.org> wrote:
>
>> > This breaks the build:
>
>> > /build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting typ=
es for =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct=
 spi_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem=
_op *)=E2=80=99}
>> >   580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
>
>> Crap, that's a fixup that landed in the wrong commit (mtd: spinand:
>> Enhance the logic when picking a variant). I'll fix it.
>
> Please only resend that patch - the rest builds and tests fine in my CI,
> I'm just checking a merge fixup.

Ah, oops, didn't see this in time and rushed v3.

