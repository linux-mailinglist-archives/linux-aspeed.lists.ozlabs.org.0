Return-Path: <linux-aspeed+bounces-1582-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94DAEAC69
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jun 2025 03:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSz8s6mZQz2xKh;
	Fri, 27 Jun 2025 11:53:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750989181;
	cv=none; b=DxcCWBwSKP3i48ASmoZ3wt2S32oAAe4wsYAFSvlW+bVrpF8g+yQblQ06rRh9XRCh15JItRhQ3SzkrjPGPsHjmiS4VYWw/7MYkEBw1WU9ex+K60lvkfpEZlRUvG8Quea+VWGAHwaDw4GG3bmIvr+4efbf78ZVQDi0InLCnTMNgCfas/pJ85Yx3bSjukEcdNBRHLPd+PalzzdGYDC6RLtgrY2jJD1GNKPpOde+paon9e5JeaoAtYRBB76xGcfYr8gv4w10//354yjyi5BV7oH4KluD6L1+iyFVNO/f+M9R7fSRcquPJv60uBK2iEQxUppPW3J849KoZf5jIAN5D7av8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750989181; c=relaxed/relaxed;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PV1Hk8mmxqNw2Gf1kQS922KhKdd1sMJ38rCm4t5ujgbcocmLHkzGK1ZnpsGfUnIThVZHTcdj7TPe4Wuit1XKBCdDb7UHjK7BW61MFVitQNV0EfL6J82nNyS4wIu30LGTLp4v5e+Q5CoBZ1gAWNIeE3s9AngYn5TTIl82JGYsPqrACceNnw9n7jx7EDZFeyYwtaeSv9AqVYz0coBWheuyzeDK3Po+mzxOgWjFROgsC9lVP+IVHYIqGGJ5kyrHFztXUEofMZWbXMKgv6jtQo0avqQwMked6LqTDLGY5LmSENh9pPQPtWWPHNQ0JOOhEq1azXjKm5AiS+gBdFhZ/8+QUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LIFew9Pn; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LIFew9Pn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSz8r3kPYz2xJ1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Jun 2025 11:53:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750989179;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LIFew9Pnb2MSiK1ccfZ5i3NSd3zNvworwa5dRBa6r1MGEszTmWLFFBu0kNoTHOQhQ
	 SKd1t4BTH/6zAAsUNtA+JXnzgmR4C4W9lQ+sYcWpI9Q+v6K+jQKG4oBdL5Ijf9Yq4v
	 ri/R6bSB7EOg58uQDErUI4MOMeJHInSnqB+0Ps+uZbWNlkwMQ6awtu6mKzGGqLkECQ
	 T4A11Q4hOxPW2eFGJnRnF0duUWqbITF4C/H+JsdZ7huh0tUv4JwOqvlk8oWiVlOn1d
	 Py5nt7hy42IpoLmRJ8m5rD7LU7hvb/hTWGNeM5W3HJ7xOr6WOAex7IeoTgvKnitUrT
	 Ey6uNEAjklLaw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A87186449F;
	Fri, 27 Jun 2025 09:52:57 +0800 (AWST)
Message-ID: <9efb52255ee55c6300f97c067d8cec606dab0574.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 27 Jun 2025 11:22:56 +0930
In-Reply-To: <20250625155007.GA1489062-robh@kernel.org>
References: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
	 <20250625073417.2395037-2-jammy_huang@aspeedtech.com>
	 <20250625155007.GA1489062-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Wed, 2025-06-25 at 10:50 -0500, Rob Herring wrote:
> On Wed, Jun 25, 2025 at 03:34:16PM +0800, Jammy Huang wrote:
> > Introduce the mailbox module for AST27XX series SoC, which is responsib=
le
> > for interchanging messages between asymmetric processors.
> >=20
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>=20

*snip*

> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Contains the base addresses and sizes o=
f the mailbox controller. 1st one
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is for TX control register; 2nd one is =
for RX control register.
>=20
> Instead, just:
>=20
> items:
> =C2=A0 - description: TX control register
> =C2=A0 - description: RX control register

Maybe also specify reg-names with "tx" and "rx"? That way we can use
devm_platform_ioremap_resource_byname() in the linux driver
implementation, which should look tidier.

Andrew

