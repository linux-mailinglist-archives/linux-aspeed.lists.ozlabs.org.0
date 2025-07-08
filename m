Return-Path: <linux-aspeed+bounces-1659-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCEAFC072
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jul 2025 04:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbkxf2lw9z3064;
	Tue,  8 Jul 2025 12:06:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751940406;
	cv=none; b=cZG2b/F3xEO0vBkXmPHRZQ5kSWDqSOHpBDndmT+k3Grs04e2aWbCtDVJigpWs9GlGb5vijjyBd8bvOgAwx4oGFDhgeE1rhPLTHDTB1kqG5xsPaTDjQHJlLX+7hkR7pJN+/OKrPTQv71/ShbsyvqQZaZhVHSg84IjnLrBrfKUQnmT4rWY3rNPnbI0P/URe14Wjr1pvb75eQtK1elpFabkF3t5Y46A6YRkHxDZdYuj3aPTygsw2rzymAedQc2Cg6uJcLlAt5sNTG4OrMD3FSR1WByuGW8TL15p/JnItFQu5+3zARO2jeqGJ6JBPBvqK5BEqhNnK+kzFaqWu0J9RC+JSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751940406; c=relaxed/relaxed;
	bh=J55cKjqJdB/s54ySt3a9A6aU/rgkpjBjIATa2spYydU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aExu46yPWwmoMGYCI9OwbzdXgUz6vXYMc299GH4XzERGUNhy6TeX4CauTBY+Tmbhm3f8YoO5T4nqbimPOUl1czHoxGOnGHEDoUHOzDtf0t+lXstlu1/6VzPg6mz1QJQjNA2l4mNBus6Sm2ec9dJt7h34paqgMZekn75dvnEyVfnE0KSr5b1cqfLAga6mWnTu7ZmZwO0n8htPtmRSa0RSFslZbMf4/43i5eafJ2Sa4LpeRLayxHoeSt/Fjb/HZs26PpzKQCfRQLm8FO1ptNzIkXxfb9YpPiY+t37esnP3ni1OsjFxlBB1DeaN0s0V4ZfxZuRoiG1cWdfj1HIkm2CPGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IJYoMmte; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IJYoMmte;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbkxd18lyz2yFP
	for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jul 2025 12:06:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751940402;
	bh=J55cKjqJdB/s54ySt3a9A6aU/rgkpjBjIATa2spYydU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IJYoMmteYdZnYL0OquHwmK0NgiaYNAHFy7ZXSITie3Aff57LFZ10+VjFGYJo5pgh6
	 +2wZlmQU026XtnxYbNM7ivS4pQN6FE6/BEw12mwgCSeyAtxs8F+w2dEQCp85J1J+Gs
	 Kzfn64K3crWXikXXqxFvqxbS1gjLzh+W5ujytZ4weU3fiuJQQE0EXxWVkNK7qfqxj0
	 ijvNj5Vw1L2hDpWPRT7kPn/lt258fmy8dHx/YfWrn7KHZLGg2njfsM9G4S6e0kfMoO
	 DvEu1YrP2ovT4C+zLLvrR+2vEjQwJRzC9WNMNQfPbBmQqd5Nez6vEvaYXMRHJoNOoe
	 zph9f7ARVn9OQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 25621640B5;
	Tue,  8 Jul 2025 10:06:40 +0800 (AWST)
Message-ID: <f66b8b80d057a095dad3b41f224fb633565313ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters
 in channel paths
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>,  Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 08 Jul 2025 11:36:39 +0930
In-Reply-To: <20250704184408.32227305@endymion>
References: 
	<20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	 <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
	 <20250704184408.32227305@endymion>
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

Hi Jean,

On Fri, 2025-07-04 at 18:44 +0200, Jean Delvare wrote:
> On Mon, 16 Jun 2025 22:43:41 +0930, Andrew Jeffery wrote:
> > Ensure pointers and the channel index are valid before use.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++------=
---
> > =C2=A01 file changed, 16 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed=
/aspeed-lpc-snoop.c
> > index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66=
c1de41c59922c82dc 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -25,7 +25,6 @@
> > =C2=A0
> > =C2=A0#define DEVICE_NAME=C2=A0=C2=A0=C2=A0=C2=A0"aspeed-lpc-snoop"
> > =C2=A0
> > -#define NUM_SNOOP_CHANNELS 2
> > =C2=A0#define SNOOP_FIFO_SIZE 2048
> > =C2=A0
> > =C2=A0#define HICR5=C2=A0=C2=A00x80
> > @@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_hicrb_=
ensnp;
> > =C2=A0};
> > =C2=A0
> > +enum aspeed_lpc_snoop_index {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_0 =3D=
 0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_1 =3D=
 1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_MAX =
=3D ASPEED_LPC_SNOOP_INDEX_1,
> > +};
>=20
> I don't have a strong opinion on this (again, I'm neither the driver
> maintainer nor the subsystem maintainer so my opinion has little
> value), but IMHO the main value of introducing an enum here was to make
> it possible to get rid of the default statement in the switch
> constructs. With switch constructs being gone in patch 10/10 (soc:
> aspeed: lpc-snoop: Lift channel config to const structs), the value of
> this enum seems pretty low now. You could use NUM_SNOOP_CHANNELS
> instead of ASPEED_LPC_SNOOP_INDEX_MAX + 1 and 0 and 1 instead of
> ASPEED_LPC_SNOOP_INDEX_0 and ASPEED_LPC_SNOOP_INDEX_1, respectively,
> and the code would work just the same, while being more simple, with no
> downside that I can see.
>=20

Yeah, I agonised over it a bit before posting. However, I'm on leave,
and I'd like to draw a line under this series. This patch is in the
middle of it, and I'd rather not disrupt it too much and go around
again with a v3. I'm going to keep the enum for now, but if I need to
tidy up the driver down again the track I'll reconsider its worth.

Andrew


