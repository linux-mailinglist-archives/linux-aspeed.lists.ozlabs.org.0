Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3834596A6
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Nov 2021 22:28:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HygPj4DdZz2xrt
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Nov 2021 08:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XYC0QVZe;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XYC0QVZe; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyXpn1wyVz2yPP;
 Tue, 23 Nov 2021 03:31:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2AB60F24;
 Mon, 22 Nov 2021 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637598699;
 bh=iFOBiXk1C/As6/il8FGU5DiqUhIBtU/YMVkyvDJzQME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYC0QVZe/yHz4tn1Ns+3SkcvOpWvBTvUo3eDiFl+LMVW2VmQVljeAVXqs+uEgWo5j
 Bn3Hr1OA1n9R+SqMDcTIBZ+U4CRlLsz5WrJ5U3phLVmG5YErMn8IAtyWdLD3GEgpTk
 1OFUk2QerMpoYcASzaxIN35W/DlD2VlfD7R7w8gpMfuFRpjGrwzFQRaP0E2f1lYvfD
 8oyujkH+Ipt5JGY4bNgZxPE/yxJYVGlRR+74nkiluH5nzYaUkeR7ovS8Gguch81/zw
 PTDrwU6YHu8IRdG4PltzeEvJO0VZVADDdju2Mi2EJ3rgjxwVY3lzLdY5MnHCtaHk5f
 GtEJSF+kC4eLw==
Date: Mon, 22 Nov 2021 16:31:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 14/17] regulator: ti-abb: Use bitfield helpers
Message-ID: <YZvF3yh9XnTcaXe9@sirena.org.uk>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <c8508cae36c52c750dbb12493dd44d92fcf51ad4.1637592133.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRjZyYaT+L2tgnde"
Content-Disposition: inline
In-Reply-To: <c8508cae36c52c750dbb12493dd44d92fcf51ad4.1637592133.git.geert+renesas@glider.be>
X-Cookie: Lake Erie died for your sins.
X-Mailman-Approved-At: Tue, 23 Nov 2021 08:28:20 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Eduardo Valentin <edubezval@gmail.com>, Paul Walmsley <paul@pwsan.com>,
 Rajendra Nayak <rnayak@codeaurora.org>, Tero Kristo <kristo@kernel.org>,
 Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--jRjZyYaT+L2tgnde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 22, 2021 at 04:54:07PM +0100, Geert Uytterhoeven wrote:
> Use the field_{get,prep}() helpers, instead of open-coding the same
> operations.

Acked-by: Mark Brown <broonie@kernel.org>

--jRjZyYaT+L2tgnde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGbxd8ACgkQJNaLcl1U
h9Au/Qf/V1gk6vuEyYqep3F+nkFeONrTZVKuCnRfhWw5gYk2o7IrGtqaN4L0XgcG
LQLotuaAu0BBZX/+cxF2XPbrWNjnR9MQMIUZo98nlGSTjxam1UhUdHJPbpXm2fbk
K8DExTJKv+DKeOGRk8LcmAyVHyrkTmZbcPcEE5qwaQldeS/Iuvmg6i889evqj3oD
FKHeZo8KvkL9B69w+j8bvlnCPiUZJd1spFZc3KMhS1N7HfzQxDGAIsEhezb0vSKa
Vu8+J+B7goS0IcpAHyB8ng4sUvJZAWDWTzaW+VKb818Swfd84YLF8vEEYabZTM9c
OVDG47kEUXwqHRPv3qz2+BqXpg9oYw==
=aIIx
-----END PGP SIGNATURE-----

--jRjZyYaT+L2tgnde--
