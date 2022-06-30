Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A817B56197F
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 13:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYc444Phjz3cgK
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Jun 2022 21:46:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLT1Xl+i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLT1Xl+i;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYc416FCGz2ywN;
	Thu, 30 Jun 2022 21:46:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 50BCAB82A3F;
	Thu, 30 Jun 2022 11:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1447FC34115;
	Thu, 30 Jun 2022 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656589580;
	bh=B8ISvDEASl8FP59YKzwtXMHgySxwzT/4KstMqaLQL5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FLT1Xl+igkEAna5MAvod65f8ERT05WB3ErDtcs6yKGTb8XubADtJ40Ru8AIM6vWQM
	 Q+ULqAkMw1S/1DhbomngHfKp6IN4Ch0Y6QYH52ugCPKXK1R5su59g2TIIDhz9Tk8tG
	 e0T4Kv8saaI7vxjcR3kqn8JQm9HAtqBz4hudBsTTP1wAA1pYHvEBLfPE45mC7X6APU
	 mwSWzvcVf+yzfVmUG+wiPeGHEMzMLk0uKCtzTw7kKQnNTK8nxiXCherSLolKqByfFy
	 FOCpeHQnrEyzUblulmpVZ+Me7AdTvaYoYPwV0LAR4AsjolUWGzUUE9t13tD13MeE0l
	 14sUTDuKSoFBQ==
From: Mark Brown <broonie@kernel.org>
To: clg@kaod.org, linux-spi@vger.kernel.org
In-Reply-To: <20220622161617.3719096-1-clg@kaod.org>
References: <20220622161617.3719096-1-clg@kaod.org>
Subject: Re: [PATCH v3 0/2] spi: aspeed: Fix division by zero
Message-Id: <165658957778.347350.13855044340681991332.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 12:46:17 +0100
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, p.yadav@ti.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jun 2022 18:16:15 +0200, Cédric Le Goater wrote:
> Here is a small series adding some debug and fixing a division by zero
> on a board using normal speed reads.
> 
> Thanks,
> 
> C.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: aspeed: Add dev_dbg() to dump the spi-mem direct mapping descriptor
      commit: 8988ba7dec43aabd43adb1214b922b8873e9da88
[2/2] spi: aspeed: Fix division by zero
      commit: 30554a1f0fd6a5d2e2413bdc05389995d5611736

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
