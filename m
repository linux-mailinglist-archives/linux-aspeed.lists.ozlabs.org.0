Return-Path: <linux-aspeed+bounces-491-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05632A12AE3
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2025 19:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYF1x50lWz2ysW;
	Thu, 16 Jan 2025 05:31:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.199
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736965877;
	cv=none; b=jzwPZJejogEtIrQeu13SV+3QT5solnBsasN9e997FwbI/Pg/RQVB71HrcPkyeDWIWwP/ayUHcVsmR6EKuNM6V/BxR/f+dblsGYuT700ivRsk4OVcdI5AB8jBz5ZeN1Em5Mf/P5UFxeyoCxhwjSwXWtZ/XQ5JTmBBKclb/qhUOW7nm1mTANSoq/Zs3i9ug8y5MBcR82AN98DvVuLKVjuObAXdzcy+p6djw0s0XHxyt6L5QMX+F/yNSpiQz7ZO6JITAZQPUQIVxYFbsnUO5fo0ZdWUPv/sv3Y87pf/1Lny5khvCU7GhFVnLq5UUWitRujnkRx423GG2buytN11jzbepA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736965877; c=relaxed/relaxed;
	bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVHBsTZCSFgXUzSuuVbnoc9RVDQ1JUvBvIIXrE3g8JTV/E/hZgFQHpEPtweEmPoF6Utrmg60l9yNLiWIYDkgfPKMzzXBtVIc06I6vVzShVvCXfV5voNAcwbGxP9XcV+4aROuDsBZsjF9hqtN0/s7vP5lEovqlzMrrXFcnti9VQbNaiq8PuS4IAPZG75PbYxIRSveQYMWUzmjwXKBTLK3og5okErRwIgh6MOp7zi4FrCV6UKRNr4hDBWlgkispIxZvk4j0bpbOKh1d7JVULBBg2geRQsKHqw0cr1OQEqV7EYqezTw4bcHGYT1u8ufKCWNYFwEU96+WTVJz94uvVfD+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XVoQSRAs; dkim-atps=neutral; spf=pass (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XVoQSRAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYF1v3FL7z2ynR;
	Thu, 16 Jan 2025 05:31:14 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420B0FF803;
	Wed, 15 Jan 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736965870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=;
	b=XVoQSRAsHPXADFu3jVGI7dBwCecPD+dviwtiINSG7gG2QTYI7ZKoCGbAlzsXnHawAhGKwl
	24LiXfzCQR3pIZBqvn9qb/WI76bBR/gYM5iK3v27XfrrihWyj6I9DuAIL0fsvT3vsw3I/q
	czvnLPptcYBnGEnhrm8GhgmQ8vCeUtjENVYUkzFUKo7lU8h2121ib4vf8mK5lggJa2imhw
	wuKxnh8Eev9ag9+Xsu7zpWrkt2h27deaKdBBBwhgImA9Rm+AwpotMeHj0kiG0/Az9PUc1t
	KHhtrdM1rJLw5PWkyTBKEJFeu2A3AfGxN8CmN6JVLXE0bXGUEx1cXfp5ava0qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 21/27] mtd: spinand: Create distinct fast and slow read from cache variants
Date: Wed, 15 Jan 2025 19:31:02 +0100
Message-ID: <173696548250.435435.10416906996871126975.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com> <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 10 Jan 2025 15:45:23 +0100, Miquel Raynal wrote:
> So far, the SPINAND_PAGE_READ_FROM_CACHE_OP macro was taking a first
> argument, "fast", which was inducing the possibility to support higher
> bus frequencies than with the normal (slower) read from cache
> alternative. In practice, without frequency change on the bus, this was
> likely without effect, besides perhaps allowing another variant of the
> same command, that could run at the default highest speed. If we want to
> support this fully, we need to add a frequency parameter to the slowest
> command. But before we do that, let's drop the "fast" boolean from the
> macro and duplicate it, this will further help supporting having
> different frequencies allowed for each variant.
> 
> [...]

The following patches have been applied to nand/next:

[21/27] mtd: spinand: Create distinct fast and slow read from cache variants
        commit: 042087247835dad1ec5e39052abf022fd13c6326
[22/27] mtd: spinand: Add an optional frequency to read from cache macros
        commit: 7ce0d16d5802bfde4209e52ee8ad644ca1eab423
[23/27] mtd: spinand: Enhance the logic when picking a variant
        commit: 666c299be696f02c3354da104295fb94b8f65d25
[24/27] mtd: spinand: Add support for read DTR operations
        commit: 8586bc8d95488dfaadbc1af89ba59900d2c39119
[25/27] mtd: spinand: winbond: Update the *JW chip definitions
        commit: 1ea808b4d15b9bddc48af75b0668b82366b5b927
[26/27] mtd: spinand: winbond: Add comment about naming
        commit: 61c7155e3fe938d4da4671b2f84e29eaf79f5f46
[27/27] mtd: spinand: winbond: Add support for DTR operations
        commit: be7a05db4252edbffb43484b14755048fb8db710

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

