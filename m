Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB663E873A
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Aug 2021 02:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkrFG3NQxz30FS
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Aug 2021 10:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=SA00P7Gx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IQWeXBM2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=SA00P7Gx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IQWeXBM2; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkrFB3TX5z2xZn
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Aug 2021 10:25:18 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1EDB6580490;
 Tue, 10 Aug 2021 20:25:16 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 10 Aug 2021 20:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=CQaGtiKaZFJhddHZEvf2v4rU+OaDWp+
 Ss2kMo6IVZCs=; b=SA00P7GxQHrtfFqvW+m7kFvoPx2MD+CjTx3gTQusAuPi1v+
 o+V9MLiL882MpaRZWdcyha7hCJ8dLU3uNxyzSOi96axjvJ/KTyVJ1rAoV/2izbrF
 UzG8w84Yj6vJKOcmEVQjlv6Of1pJtShlVn3TkIcr549T7r6xUL+ZxDMmAXaqyAiO
 ku2F7YICI75WyG6HzmFm0YhEySCiR6n7t8WsRFILj7Yldr4rI9d9woJQLF/Q6UYr
 b9Fg3dr4iXcDutqn4qvbo2wo7kN9xgAdtFm5cJat5+6K2GahJU4G4VsSHrY7NuyG
 TO7Ic/jHqZrVuJOzOdqk/w57ejrF/jiFkuWiYnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CQaGti
 KaZFJhddHZEvf2v4rU+OaDWp+Ss2kMo6IVZCs=; b=IQWeXBM2nZNQ1O/QfqKFn9
 nI+k+eO/smlIBlv/78gmPvuOU9V+6Ov3zo/uMvaDnBsXI3kAAGqcVnjm8VYPLEox
 arlFnFKnpq8P/7syouSurBE4kXV8GMsdH1N5zCBPXtgIpSI3GioKBxMfypDIZokB
 HeQAm7D5PeiwPo0wUpwsu/xeR8osuH5icucJmHIge8bDIpqKXgJHIogbqkQG7fWC
 TRAscnGnG1dkZgkzWI6slAxBZSrH611lafOLtBvtCbDOlGxjjw/MKj69wsebkLE4
 4IgZowGnM0Sh260+tW0K0kgKEPIpK7pNM+2uP3G+AOWtBKipKvPTdzm72OENEzMg
 ==
X-ME-Sender: <xms:6RgTYVdkVTqMHNwXpKnSAv-Rz5MsYiT9_op0s_XwFeylYSdGwRVSwg>
 <xme:6RgTYTP_q8htCYVBa7Lgr_JKBiEq8Z8IU3toB8k-VFm0F1m8UajSdGLAGEd3_UECO
 Xtk4bM5ju3BCLZJug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6hgTYejS52ymUKsEMDRMPh-Nexewh4uRsXv-pnMAzMXRzvm95gQTAg>
 <xmx:6hgTYe-o9IinhgoWJrGolDqiZ4-FjpW5FTU1QO-fcGbF9e915MEjlw>
 <xmx:6hgTYRtsilqCIaAOICu1a6mUL-NBYWtNQQ2hAMQY36eMHG52UxUfqQ>
 <xmx:7BgTYXBFUT-gH886vkzM6ViX413GUYkbmN4pcAweN2MsEJpo_H1AJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EF05DAC0DD0; Tue, 10 Aug 2021 20:25:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-554-g53a5f93b7d-fm-20210809.002-g53a5f93b
Mime-Version: 1.0
Message-Id: <53199b3e-a711-4071-96a3-7836d3323906@www.fastmail.com>
In-Reply-To: <CACRpkdZ4A3Lw2U+_jXfbuXJFhpesi3SzNN1Codqxi4sLNu5zPw@mail.gmail.com>
References: <20210723075858.376378-1-andrew@aj.id.au>
 <20210723075858.376378-2-andrew@aj.id.au>
 <CACRpkdZ4A3Lw2U+_jXfbuXJFhpesi3SzNN1Codqxi4sLNu5zPw@mail.gmail.com>
Date: Wed, 11 Aug 2021 09:54:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 1/6] pinctrl: Add pinctrl_gpio_as_pin()
Content-Type: text/plain
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 10 Aug 2021, at 23:04, Linus Walleij wrote:
> On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > Allow gpiochips to map the GPIO numberspace onto a pin numberspace when
> > the register layout for GPIO control is implemented in terms of the
> > pin numberspace.
> >
> > This requirement sounds kind of strange, but the patch is driven by
> > trying to resolve a bug in the leds-pca955x driver where this mapping is
> > not correctly performed.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> (...)
> 
> Hm  this looks a bit strange...
> 
> > +int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio)
> 
> This is not a good name for this function. Try to come up with
> a name that says exactly what the function does.
> 
> E.g. "apple pear as apple slice" isn't very helpful, the use case for
> this is really hard to understand.

That's probably because I shouldn't be trying to do what I'm doing :)

I'll stop doing that (i.e. rework patch 4/6) and this will go away entirely.

> 
> > +EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);
> 
> This looks completely wrong.

Yeah, whoops. That was an oversight while iterating on the patch.

Andrew
