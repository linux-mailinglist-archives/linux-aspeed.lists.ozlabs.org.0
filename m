Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7A45E364
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 00:35:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Z4519Ytz30RC
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 10:35:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=nINUpNJR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:191:4433::2;
 helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.a=rsa-sha256 header.s=mail header.b=nINUpNJR; 
 dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzYSc2pmTz2xCp;
 Wed, 24 Nov 2021 19:04:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=A8apBARRFPbiSEW1ceN6aynN1mbMSw2kt4pRYV7bzUs=; 
 t=1637741070; x=1638950670; b=nINUpNJRQTuCZsKaaoC6wsSLg1vek61L5Am+KSSe/cT4RsL
 PkIbn760TKvIX41QCNQXYIlhFPRhrgaxMx1Kta7oHuasz3Y3bmdoKN9CgkQzHRwEQ8dm66wMqSCxt
 XZbHAeHAPm6Rwcp9xK9eCx9XRa+JfBEjiGzlMx+UIWnkNJttSoZ7Kkgmi0QCrBNCBkoeNyFWMyJkN
 YNY4RXj++pO9YWZ1SHySTZzTHY6sTJMdndwMOZ7jI9qcl8jNOS1s9pTusyuqYbc9YQ7Kr21oZa+qg
 GFHB0TTgwS8Ajp8NsSRd7iRRpZ24X+C4HOQtdj8/tTwWv87Y2p4EQRtOHTH5O3aQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpnFW-0027Gb-B2; Wed, 24 Nov 2021 09:03:26 +0100
Message-ID: <05d4673a0343bfd83824d307e9cf8bf92e3814a6.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 24 Nov 2021 09:03:24 +0100
In-Reply-To: <20211123154922.600fd3b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
 <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
 <20211123154922.600fd3b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Tue, 2021-11-23 at 15:49 -0800, Jakub Kicinski wrote:
> On Tue, 23 Nov 2021 17:24:15 +0100 Johannes Berg wrote:
> > > (*_replace_bits() seems to be useful, though)  
> > 
> > Indeed.
> > 
> > Also as I said in my other mail, the le32/be32/... variants are
> > tremendously useful, and they fundamentally cannot be expressed with the
> > FIELD_GET() or field_get() macros. IMHO this is a clear advantage to the
> 
> Can you elaborate?

Well, the way I see it, the only advantage of FIELD_GET() is that it
will auto-determine the type (based on the mask type.) This cannot work
if you need be/le conversions, because the be/le type annotations are
invisible to the compiler.

So obviously you could write a BE32_FIELD_GET(), but then really that's
equivalent to be32_get_bits() - note you you have to actually specify
the type in the macro name. I guess in theory you could make macros
where the type is an argument (like FIELD_GET_TYPE(be32, ...)), but I
don't see how that gains anything.

> > typed versions, and if you ask me we should get rid of the FIELD_GETand
> > FIELD_PREP entirely - difficult now, but at least let's not propagate
> > that?
> 
> I don't see why.

Just for being more regular, in the spirit of "there's exactly one
correct way of doing it" :)

johannes
