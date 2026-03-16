Return-Path: <linux-aspeed+bounces-3694-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLShOi80uGmvaAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3694-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 17:47:43 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A929D9E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 17:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZLcC6MwHz2ygh;
	Tue, 17 Mar 2026 03:47:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773679659;
	cv=none; b=dWzSELEoqZd4vHXZZB0zrn8A4dyMC5Cd4WfuSE7yHEU4mOqjF8229ahfZSGe0yOaPSyh4BPD9N1AdI+fMTx8Ukx2hrdbhN5eX0fy+7sATVChL5YuQNWwKcPVY3/V/+85iNTBQRZJQX+3mIiSjl9RR/9xeqQjPsW+N5cjbeleLBuIts9BioKqSsRmQff4/3HtXHeF8xkbpTdMDvt7eaFjuMOkYhcaKGzFknZhcQ8XXFYOTxu7w1/v4OHFc1mKSUp2wY8nAvRria6OyNBpqSCBT6g3Jr1YUZ4O76095+v7JbUfeW3At9ysiDKfIJYM1y50DMRKIPAxfLigllWw82PaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773679659; c=relaxed/relaxed;
	bh=KWa+RXyopymTRjjpFJkMzMT8GIqPd4802R8XJ+/wxvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0j6Ye8nbJRcMRd/N4vjq0hGuKK1ABTfzbPXzOTLatzTsqwCX3q+9um6M0fchjEuAF9TbTCrp9UlcBzFhS/YyunwNTkbrtIhUQ2J14h67kj1ecC1F00n2nV1UKYpqaxNIzPHdaBvNCjb8muV+nDiMBvh9o5uTMDDhOl9vVZNeCL0J99wTgZRavLWjaJc4otIST/cOxQMJt3uNuiWyLmbWeGcRFFlAoqvllqoSq3K7ujZt8fwARU2XoeEiG4Rf+MlC8eZvfuYppys2aKEgs2A+WmsbAPQePeUc/O9IYhj4oUjH7ghNoUP05RyTl+32k4H1Byfz2d9Cbg4dAERQirugA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGtekfTq; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGtekfTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZLcC0Bg8z2yZc
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Mar 2026 03:47:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B0A94441E
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496D8C2BCB2
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773679656;
	bh=+rAbjFpJLF5ELTGsyzXHo5dgEzatb5tWHpqXy6BTmYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cGtekfTqFvVrF7VJ1xDN/03QTDPDcdo5LNi8MIeHSIezK4Gd2z+GQ94TdThe3wfdg
	 6+jwBMmOqzF85kgS9jF7LvwgP5JGWXJpkAzraz3vFcajQZUHBvO0WRYzQJE7J0Ytmi
	 Gwi/li0g/v/vcXP34ZAq++FsOnJ7YYiJJNUFiQULiaw3n4kJ58eE6KrMSVjMGnsO4u
	 IMN7zeBsIcQrt2UTsOQo2nDc2fI+SGolMG21oQW9QYbqop+gZh52CvuNSngMbBymF3
	 pYqZPEns6Yy1LnHWMLVS9x1ZnrWuY6XLupN9bxQWg7FscMFBB3zIghh1qubhnfJmuf
	 WBpxVo36e6R+A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b96f02b4329so860724466b.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2026 09:47:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRfuyTn8wYTqxsexV49rV2br+PgePfBy1vGXutgYUp2EjkVynDCOp6OZKvsktmbKRvalJ0ElhIOTJrEPI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YylJICcvxNQtY0aO0AerOKPO4NGFAXYmn2sZ0iBVM8mP852K1tO
	jYw6Sad11FBClTZ33Z/n+J6Hhwty3daXi/XAHDVKlRaFk4y86yMsYsThiq9/QXVrtuzd0rWdiMN
	OqGXgc/hvWjgd/pLzQdWDLy4s3TNtHg==
X-Received: by 2002:a17:907:708:b0:b8a:f2cb:8088 with SMTP id
 a640c23a62f3a-b9765392113mr794224266b.33.1773679654788; Mon, 16 Mar 2026
 09:47:34 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com> <20260313232125.GA3618633-robh@kernel.org>
 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
In-Reply-To: <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:47:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
X-Gm-Features: AaiRm51ex9uUeaeovsj_EfQkcC7S4igdlkgu0QdNDXmYleGKXTFGbzYmU6uj8IQ
Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3694-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jk@codeconstruct.com.au,m:ryan_chen@aspeedtech.com,m:andriy.shevchenko@linux.intel.com,m:andi.shyti@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:benh@kernel.crashing.org,m:p.zabel@pengutronix.de,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 831A929D9E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 8:50=E2=80=AFPM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Ryan & Rob,
>
> > > > +  aspeed,transfer-mode:
> > > > +    description: |
> > > > +      ASPEED ast2600 platform equipped with 16 I2C controllers eac=
h i2c controller
> > > > +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buff=
er mode), and
> > > > +      share a DMA engine.
> > > > +      Select I2C transfer mode for this controller. Supported valu=
es are:
> > > > +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> > > > +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. =
(default)
> > > > +                    Better performance then byte mode.
> > >
> > > Good, I like worse performance so I can use byte mode.
> > Thanks your review.
> > Will remove performance statement.
>
> I don't think that really addresses Rob's point there.
>
> The selection of mode is somewhat a driver implementation decision (and
> so would not belong in a DT binding) - *except* that there are
> considerations around the use of hardware DMA channels, as covered in
> earlier review.

Am I supposed to go read the prior 25 versions?

> [My understanding is that the mode needs to be defined here to select
> which i2c devices have a DMA channel allocated to them. I also
> think that byte mode may be useful in some scenarios, but that
> consideration certainly does not belong in the DT binding spec]

But this is selecting DMA for the bus, not specific devices. I would
think the decision would be dynamic based on some xfer size. Certainly
if the xfer is less than the buffer size (32bytes), then there is no
advantage of DMA.

Or do you mean some instances of the I2C controllers have DMA and some
do not? If so, then ...

> So, how about we refine this to *just* the hardware-specific component:
> whether a DMA channel is allocated. A driver implementation can then
> select the appropriate mode (dma, byte or buffer), depending on
> implementation-specific details.
>
> In that case, we would just have a boolean property, like:
>
>     aspeed,i2c-dma-enabled;

... yes, this is fine.

>
> - to signify that this controller may use a DMA channel. The choice of
> actual mode is left up to the driver implementation.
>
> Rob, would that suit better?
>
> This way, we don't have ambiguity on "buffer" default vs. absent
> property, and we're no longer specifying actual driver behaviour in the
> DT.
>
> Cheers,
>
>
> Jeremy

