Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52869528D3E
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 May 2022 20:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L27MX1vdrz3c88
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 04:39:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aethkcie;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aethkcie; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L27MR21Znz2xnR
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 04:39:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B1E961467;
 Mon, 16 May 2022 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41F0C34100;
 Mon, 16 May 2022 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652726367;
 bh=uB3ceHjdyIYIrq6O7Ou3iUbDoNJSf6Vwwjiv6bTT8sk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aethkcieAmzy7b8cGKRBdAPWSFwCkpCHnoew6BVpYkR+d2cK4K/pBjL1t5aVjwjsL
 IKpSpsuuA4p7ZkjTiArGHGzCf71Dzd/T8Q5T3tVT1bDrJO5E0ISnK9Ju7tDX45aqn9
 kOaTmja9a8ZIy8icvgXmoAeRwygYc23PkmOJ/mfuu1TK+ovdHbvDVf/+kGhLlOI4oc
 Mtssfd4RwKymKzutwv7n/tF6lUnOABU1zSBy+Z3GOfUU27g/NeHFoZ8EApXL0jvwP/
 5WeV1TkuII719KFikxqcfPVelTHUqHpL05ggq0iMFgbWtBbDoMimfQnteSigwpQ55w
 zJkZhLPRfmpLg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, clg@kaod.org
In-Reply-To: <20220509175616.1089346-1-clg@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC driver
 to spi-mem
Message-Id: <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
Date: Mon, 16 May 2022 19:39:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org,
 tudor.ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, p.yadav@ti.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 9 May 2022 19:56:05 +0200, Cédric Le Goater wrote:
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
> 
>  * AST2600 Firmware SPI Memory Controller (FMC)
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>  * AST2500 Firmware SPI Memory Controller (FMC)
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>  * AST2400 New Static Memory Controller (also referred as FMC)
>  * AST2400 SPI Flash Controller (SPI)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[02/11] dt-bindings: spi: Convert the Aspeed SMC controllers device tree binding
        commit: ce9858ea499da025684a7a5f19823c2c3f14bdce
[03/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
        commit: 9c63b846e6df43e5b3d31263f7db545f32deeda3
[04/11] spi: aspeed: Add support for direct mapping
        commit: 9da06d7bdec7dad8018c23b180e410ef2e7a4367
[05/11] spi: aspeed: Adjust direct mapping to device size
        commit: bb084f94e1bca4a5c4f689d7aa9b410220c1ed71
[06/11] spi: aspeed: Workaround AST2500 limitations
        commit: 5785eedee42c34cfec496199a80fa8ec9ddcf7fe
[07/11] spi: aspeed: Add support for the AST2400 SPI controller
        commit: 53526ab27d9c256504f267713aea60db7af18fb0
[08/11] spi: aspeed: Calibrate read timings
        commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4
[11/11] mtd: spi-nor: aspeed: set the decoding size to at least 2MB for AST2600
        commit: 73ae97e3cabb580639f02f12a192324a53c4bebb

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
