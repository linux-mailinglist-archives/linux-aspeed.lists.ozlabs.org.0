Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A5A4596A7
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Nov 2021 22:29:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HygPm4McKz2ypZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Nov 2021 08:29:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=VMtR7xTs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:191:4433::2;
 helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.a=rsa-sha256 header.s=mail header.b=VMtR7xTs; 
 dkim-atps=neutral
X-Greylist: delayed 1427 seconds by postgrey-1.36 at boromir;
 Tue, 23 Nov 2021 03:58:20 AEDT
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyYPS4361z2xC3;
 Tue, 23 Nov 2021 03:58:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=kqBhSMWa3sOnZM39EObYBhGUKcC3oHWInrKZjV+i2aU=; 
 t=1637600300; x=1638809900; b=VMtR7xTsZBwcHmNYwL4YZ72oU55HADvvT+mBkekcQpCnYPn
 cQCmXLO5+3qUeR1V2Rh4ohDHKtjYv7DcsntH9+PbyXuHlRynPwwMtpgQBYsPeEXn4udjlHLjPNf6x
 AH3YmJK+DoJlEt1/8qO3YIdVqMe3pGWL9T4MhARJLPjZYW6xo06PFMM3nBYm+m7Hhwh/F5EsUc0O0
 gDIMtxG8/QC4jvm81DsPiiwpGkpUZ2g0KrI0rEA8l3JBHKxuyXK+O7OYsJ5OSwKDbaruLbiiKP2J/
 NhAFFxKfgjD0/CIi2xgj0lgiWcKDhLN1XjC1WxQ33vb3AMPczCYSzfdzWDTs5Sig==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpCFL-001MvE-3o; Mon, 22 Nov 2021 17:32:47 +0100
Message-ID: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Rajendra Nayak
 <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Ludovic Desroches
 <ludovic.desroches@microchip.com>, Tero Kristo <kristo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Benoit Parrot
 <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,  Ulf Hansson
 <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>, Ping-Ke Shih
 <pkshih@realtek.com>,  Kalle Valo <kvalo@codeaurora.org>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Date: Mon, 22 Nov 2021 17:32:43 +0100
In-Reply-To: <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 

I'm not sure it's really a good idea to add a third API here?

We have the upper-case (constant) versions, and already
{u32,...}_get_bits()/etc.

Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
architectures (afaict), so that seems a bit awkward.

Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
if it is indeed a constant? The __field_overflow() usage is already only
done if __builtin_constant_p(v), so I guess we can do the same with
__bad_mask()?

johannes
