Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AF785AC0
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 16:34:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LiNDyfRP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW7yg726Wz3c8c
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Aug 2023 00:34:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LiNDyfRP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW7xq0Qvnz3c5c;
	Thu, 24 Aug 2023 00:33:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B4CC6590E;
	Wed, 23 Aug 2023 14:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57AFC433C7;
	Wed, 23 Aug 2023 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692801227;
	bh=C1hbzTT6cGFihe4H7gW/Ju/jQ9Q/OxtUlBHuZSP0Aao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiNDyfRPBz0JDIDpc6M+9dKrvS/aRPlmLvOCU2bx0bt46aHIVLafisFA6+khEH5Bk
	 o6r/0eeU/0s/FAdjgpVIpkRdyEX9YDdleQJQToGyHz4qhHRb5rr9RHSvgNscVlPDyW
	 R3uXSKp0d3rpIp7beUxmhuFd8neoGTIHpD97pND3hrUBvDQofTYu7TxxlkrnR7MacW
	 ZRkgh0k9JGczZo+lBsGo8z1nDkBZBWSiXxI5vWq/3dXfiTQo1AJSZIOH5v7jLKDBAk
	 NUnOk5mEJI7ZbZsAEGblRzqxg4GnI2k8b8utY/iEGAGJ1zVy4biyyrO11BWNwvurj1
	 iI1WR338xShPg==
Date: Wed, 23 Aug 2023 15:33:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next v2 00/25] spi: Use devm_clk_get_*() helper function
 to simplify the drivers.
Message-ID: <027ab9d7-4c05-4ce6-a4c8-14a79ce8a11a@sirena.org.uk>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LSyj1/J+nxUF5eC"
Content-Disposition: inline
In-Reply-To: <20230823133938.1359106-1-lizetao1@huawei.com>
X-Cookie: Some optional equipment shown.
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
Cc: heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, tali.perry1@gmail.com, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, jbrunet@baylibre.com, florian.fainelli@broadcom.com, yuenn@google.com, khilman@baylibre.com, tmaimon77@gmail.com, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com, martin.blumenstingl@googlemail.com, rjui@broadcom.com, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, sbranden@broadcom.com, venture@google.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org, daire.mcnamara@microchip.com, olteanv@gmail.com, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--+LSyj1/J+nxUF5eC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 09:39:13PM +0800, Li Zetao wrote:
> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks") provides a new helper function for prepared and
> enabled clocks when a driver keeps a clock prepared (or enabled) during
> the whole lifetime of the driver. So where drivers get clocks and enable
> them immediately, it can be combined into a single function

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--+LSyj1/J+nxUF5eC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmGMAACgkQJNaLcl1U
h9Ahbgf8DmK8AENTGZ3rHpzuOXsW2ZP5aIOm6S92ZFJyw2EZHDmCjszD8WoTtiU0
GJyELU/5q3nOfQB1kT9EdP5reA2E6Ak/GELG72pFrlofJ89iJyG0B2Of+8WFypx/
j/w+U3B0R0cd43VTQQVSfDpzP3WVOSYv212ysvnY1iU5JnrMUbanse/GROeFp7JU
WGsd/42DTpJlwqQbVOgxyyGVa7EWxhyZx4OdZWLWnKzSBm81TAXBcrU/lXJX5wVl
/61+l7cq4sIx72yGG26gXY85gg0cZspzYQQdZd6tpGFUUbFldZHuoGrtF1bDNUyt
MomQencPLvinPUy4FR8IqluPGiYJaQ==
=UpUO
-----END PGP SIGNATURE-----

--+LSyj1/J+nxUF5eC--
