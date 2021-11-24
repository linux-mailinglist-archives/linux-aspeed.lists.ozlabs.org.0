Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6645E368
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 00:35:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Z4G1qhNz2ymc
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 10:35:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qwjskdle;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qwjskdle; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzjLN4rBQz2yN1;
 Thu, 25 Nov 2021 00:59:40 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B124C6135F;
 Wed, 24 Nov 2021 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637762378;
 bh=qRP+clj8R/VdWhftZ8Y8X7gwjyLiR1Ndt0XMFQ1d99I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qwjskdleu3wFs5Bp+wvn7/HQgcncwjzNLbZJvm05oYaNrcYQTwWP5OPt4NA+r19ce
 xvpj4Ygu81mu+0T0HClP6KV/QWjpcF9snHTHoGaG5tUeLxnTTWkLES0g3C2OG9fyHP
 3gdMDDzRgjs1FxHFxipNVT3bu4+1WLgAMlUBkLt05N30IajW10WzN8g5y+5eK5i725
 UrYk6tfyltIEGHPLMkyi6LuRszHy8ZTAL81DcgYxpSc8FxYZIzgFUL244Ub8IMFPQK
 iyz4glX1RQI/lDwdXU9D49kB+bXi/+6kFMsXGuBY9Lzmn68zgSqocZJHLF6A/zwCj2
 E8n91Zb/v+PWQ==
Date: Wed, 24 Nov 2021 05:59:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <20211124055935.416dc472@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <05d4673a0343bfd83824d307e9cf8bf92e3814a6.camel@sipsolutions.net>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
 <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
 <20211123154922.600fd3b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <05d4673a0343bfd83824d307e9cf8bf92e3814a6.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 24 Nov 2021 09:03:24 +0100 Johannes Berg wrote:
> On Tue, 2021-11-23 at 15:49 -0800, Jakub Kicinski wrote:
> > > Indeed.
> > > 
> > > Also as I said in my other mail, the le32/be32/... variants are
> > > tremendously useful, and they fundamentally cannot be expressed with the
> > > FIELD_GET() or field_get() macros. IMHO this is a clear advantage to the  
> > 
> > Can you elaborate?  
> 
> Well, the way I see it, the only advantage of FIELD_GET() is that it
> will auto-determine the type (based on the mask type.) This cannot work
> if you need be/le conversions, because the be/le type annotations are
> invisible to the compiler.
> 
> So obviously you could write a BE32_FIELD_GET(), but then really that's
> equivalent to be32_get_bits() - note you you have to actually specify
> the type in the macro name. I guess in theory you could make macros
> where the type is an argument (like FIELD_GET_TYPE(be32, ...)), but I
> don't see how that gains anything.

Ah, that's what you meant! Thanks for spelling it out.

FWIW I never found the be/le versions useful. Most of the time the data
comes from bus accessors which swap or is unaligned so you have to do
be/le_get_unaligned, which swaps. Plus if you access/set multiple
fields you'd swap them one by one which seems wasteful.

> > > typed versions, and if you ask me we should get rid of the FIELD_GETand
> > > FIELD_PREP entirely - difficult now, but at least let's not propagate
> > > that?  
> > 
> > I don't see why.  
> 
> Just for being more regular, in the spirit of "there's exactly one
> correct way of doing it" :)

Right now it seems the uppercase macros are more prevalent.

Could just be because of the way the "swapping ones" are defined.
