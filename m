Return-Path: <linux-aspeed+bounces-3300-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C11D1618E
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Jan 2026 01:57:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqrSZ4Lqsz2yFb;
	Tue, 13 Jan 2026 11:57:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768265854;
	cv=none; b=ENmy165I3f7ZsIQlXPgqW/3fmq1cKIPOgWfBTC8dZzE/p9moSxiltovC37Bsg1GZ1aIt6vV3QPcKP5fAjsSzIcouNeHy1TYpfSt6Le9OrppW6cXTggwIZ8aDx4obO1HEbFwAQbviFXYt2hvAT0pZCMZTF49Hu6O/iWoMv6zpX5MMP3XxVaeQxL3QV7WzJuXPpJvBfLyXamT3CY0cytrwmqC+hL50EVLXXACJeVxcAb34LGLjcrlKIhkPziT52Rv1aRBng2s0eFhpBAvrSyzog9sBOy4AzSw90IHMZiQZKWXWogkFVeAI9hKiPJOZ1Q9Nqh8FNFgZr23ZEuQvoF113g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768265854; c=relaxed/relaxed;
	bh=SVaR7pDXKQQZrzQCpbAsKQEkeRYpez2j/VHjvnBNbww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFGb8cy5nJc+jdQ5qRJoiPOOG3JkVOQOwPDqs7fWV9hMvJ7C4wq4r+WjrOqKfNwxwos+IhJJpzgl1tQn8MtMAGfQwSKqOmTlvD0TYMnMCxovVEbSSvu00kpnNoSoJZX/IVLG40e+NnY7Tc5sB5gG1G5gYdR5LL0Mpla076sZ2VNP55kJCy0bP4tTBMBMtClWSC0fPFloO3sAG4orLNlCnE0yWOuzVvpkoSig4kOLQTYB0IzEw+BW7U9UIJkl+f3H9+TFNdvU3f10FVF//4gD7NiI7KBIAQfB0/6/wdAs3LvjvVQrO+rMJmzM2raL6g8sQDbxGfLqROIi/Mn7FW076w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H7mvQPUX; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H7mvQPUX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqrSX649tz2yFY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Jan 2026 11:57:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768265850;
	bh=SVaR7pDXKQQZrzQCpbAsKQEkeRYpez2j/VHjvnBNbww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H7mvQPUX98ELFBCpdHBxurf7rawwayXoOHboAkmLIBW+BXVZ4/NNmuT+79S12Tiqf
	 qSQbCuLyfQzuLPneT4m0i00TtwWrVy7MMszQhS98zxQm/z5Sy4oCmWzrQxEVQxOJJG
	 L4eDSDR2+/M8Jyodgbwmw3U68FhvN8fn+ZwV/seDPzDzcduuwTvmH0GIoK5U5FEOmq
	 LwpLp5zufMPe7YK7Hsu/vbU22lkrVxGp7L5ugBOnSXmvRrP5xXl9xk1VWxgv3ceSSf
	 LdY6E6JKAkNGlc4rK4u6Szzg93gaoV2taKf0KEQrsgXsfB9DBldwTRvwYflgJZFZ0f
	 80zGvtm+44vsg==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 52C3864706;
	Tue, 13 Jan 2026 08:57:29 +0800 (AWST)
Message-ID: <e97b7a193f8bbfca9ec00037808ad80a5baf9f00.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Tue, 13 Jan 2026 11:27:28 +1030
In-Reply-To: <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
	 <20260111201040.162880-2-anirudhsriniv@gmail.com>
	 <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
	 <20260112-whimsical-annoying-fulmar-25e4d9@quoll>
	 <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2026-01-12 at 15:21 -0600, Anirudh Srinivasan wrote:
> Hi Krzysztof,
>=20
> On Mon, Jan 12, 2026 at 5:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >=20
> > >=20
> > > It's a bit bike-sheddy, however: the pattern tends to be
> > > ${vendor},${platform}-bmc, but as the platform can't be specified and
> > > the card's function is the BMC itself, I'd go with "asus,ipmi-
> > > expansion-card" (I couldn't immediately find a useful identifier othe=
r
> > > than the product name).
> >=20
> > This should include some model name or at least soc. What if you have
> > IPMI card for ast2600 and later completely different for ast2700?
>=20
> Personally, I was okay with Andrew's suggestion of naming it
> "asus,ipmi-expansion-card" because that's the official product name
> and that exact term works well for online searches.
>=20
> This seems like a pretty niche product Asus announced 4 years ago and
> made in very low volumes. I'm not sure if they'll make a new one with
> an ast2700, given how the modern trend is to have BMCs on
> motherboards. What do you think about the naming Andrew?

I agree that the product seems niche. There's practically nothing on
their website on the marketing side - from searching around the details
are pretty much limited to the support pages. I can't really speak to
future stuff like an AST2700-based design though, who knows.

A couple of numbers turned up that might be helpful:

   1. The Quick Start Guide[1] seems to use "E21524", which is also
      used by some random blog[2] to identify it.=C2=A0
   2. There's "R1.04" on the silkscreen.=C2=A0

Perhaps we could incorporate either of those?

 * asus,e21524-ipmi-expansion-card
 * asus,ipmi-expansion-card-r1-04

However, they're not without some risk:

   1. It's hard to tell whether E21524 is properly representative
   2. R1.04 may also problematic as an AST2700-based card will likely
      restart the numbering and risk a collision

Otherwise, I guess there's:

 * asus,ipmi-expansion-card-ast2600

Andrew

[1]: https://www.asus.com/us/supportonly/ipmi%20expansion%20card/helpdesk_m=
anual/
[2]: https://blog.liaosirui.com/%E7%B3%BB%E7%BB%9F%E8%BF%90%E7%BB%B4/A.%E6%=
9C%8D%E5%8A%A1%E5%99%A8/%E5%B9%B3%E5%8F%B0%E7%AE%A1%E7%90%86/BMC%E5%BA%95%E=
6%9D%BF%E7%AE%A1%E7%90%86%E6%8E%A7%E5%88%B6%E5%99%A8/IPMI%E8%BF%9C%E7%A8%8B=
%E7%AE%A1%E7%90%86%E5%8D%A1.html

