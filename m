Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E0F45E369
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 00:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Z4K1fdjz30R8
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 10:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=cbvNymNX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:191:4433::2;
 helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.a=rsa-sha256 header.s=mail header.b=cbvNymNX; 
 dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzjYx1prsz2x9K;
 Thu, 25 Nov 2021 01:09:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ehMa9pgWHBM7TnvPMQnjh4s1Rj7IHG2tDkzpNOpErAk=; 
 t=1637762980; x=1638972580; b=cbvNymNXTl3OOR4xI2kENt36B0SJBzdxod1/qVj70JDIE8A
 KUEgitEM0vBCQACluhgrLAdnnbKXJXCNdb3alfskKQQJahs1E/5SrRS9pz58pk/cAHNrCbE2QSS0+
 X4PU8cYgfb9x4HYqdCp9JPGVFxp8DoZyZ2D/NGugrenWR1I+i8WuTEIMwcHsXy1W0Z0W9jWIBW+27
 F8Q2cuCouEOo7D0O7YA3StbDF+3+2QxNVgEWHfYJpSuHHOq3DDuy4NlMjx89+y/NRTnPI0BjA6o4e
 pxbeWbfyMBXwUO1P5HmgNLEg6bxzhY7OmAR5Q4M4dEnB8cItypkJYdQIZMcoFJOw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpsw9-002JSq-Fw; Wed, 24 Nov 2021 15:07:49 +0100
Message-ID: <eea90adf2d51326f6d0bf0b97834063752a35c3f.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 24 Nov 2021 15:07:47 +0100
In-Reply-To: <20211124055935.416dc472@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
 <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
 <20211123154922.600fd3b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <05d4673a0343bfd83824d307e9cf8bf92e3814a6.camel@sipsolutions.net>
 <20211124055935.416dc472@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Fri, 26 Nov 2021 10:35:12 +1100
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
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Keerthy <j-keerthy@ti.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2021-11-24 at 05:59 -0800, Jakub Kicinski wrote:
> 
> FWIW I never found the be/le versions useful. Most of the time the data
> comes from bus accessors which swap or is unaligned so you have to do
> be/le_get_unaligned, which swaps. Plus if you access/set multiple
> fields you'd swap them one by one which seems wasteful.

Oh, we use them all the time in wifi!

I'm not sure I'm too concerned about wasteful - actually in wifi most of
the time it's little endian to start with, which matches the CPU for all
practical uses of wifi (**), and often we just access one field or so.
And anyway if we extract more than a single bit we need to swap anyway,
and I hope if it's just a single bit the compiler will optimize since
the one side is a constant? But whatever ...

(**) I had a fight with big-endian ARM a few years ago just to get wifi
tested on big-endian ...


> Right now it seems the uppercase macros are more prevalent.
> 

Not in my world ;-)

$ git grep FIELD_GET -- ... | wc -l
20
$ git grep le32_get_bits -- ... | wc -l
44
$ git grep le16_get_bits -- ... | wc -l
12
$ git grep u8_get_bits -- ... | wc -l
17

:-)

johannes
