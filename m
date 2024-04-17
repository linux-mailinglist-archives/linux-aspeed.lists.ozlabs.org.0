Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436578A7CA8
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 09:02:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IhnlJG9Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKBg70LjQz3dwG
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 17:02:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IhnlJG9Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKBfm35bxz3d2S;
	Wed, 17 Apr 2024 17:02:07 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AD9D62014E;
	Wed, 17 Apr 2024 15:02:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713337326;
	bh=ZxepRbuU81znKKBJUp2an9YnHRJEcdcrvB5/JBfkBzc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IhnlJG9QuuY++62V4r6ZIvAabso2ciO40kxF5/EipC4mSAph3Yo6yuvZNTSOH27Nu
	 80qpLqBSdJtHHvytffJeIZRufLdXguUy0PMwzM5fwBGRYyalXiOWuTPdPiqtJ2VpMh
	 9WjT0HZAyTSzDTbi6VfQdTaT/MryGKNeNBS+z/24icWi3TDbv2QcfOmcIO3B6StNe7
	 aT3msUfqQUfqL72SIV5XjwRlHbE1P3yXLex9EoSN7uZkk7/sgxADyulPs3r9CWDjCV
	 MdiXt57U6zhI/xbfDzT4NI384gsv6HCNzv4Is3o6sRTsUMLL+MhDtQJKkLQbp+IO8h
	 6GKSbvqUCgmrw==
Message-ID: <a935d2a6ec3b0ab847b662d05bcea8408077511d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Update Odyssey SBEFIFO compatible
 strings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Wed, 17 Apr 2024 16:32:01 +0930
In-Reply-To: <2ee4084d-1891-4ea4-ba3d-b99ee1d7b5fb@linux.ibm.com>
References: <20240412144358.204129-1-eajames@linux.ibm.com>
	 <20240412144358.204129-4-eajames@linux.ibm.com>
	 <5c6f58cc13492988d307504d55cc5d31a512ab8c.camel@codeconstruct.com.au>
	 <0363badd-f5b0-42bd-bdd5-de6e7b5ee8c6@linux.ibm.com>
	 <90ced7e271213da481f7c0ec883d0189671563e8.camel@codeconstruct.com.au>
	 <2ee4084d-1891-4ea4-ba3d-b99ee1d7b5fb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-16 at 09:48 -0500, Eddie James wrote:
> On 4/15/24 19:06, Andrew Jeffery wrote:
> > On Mon, 2024-04-15 at 09:59 -0500, Eddie James wrote:
> > > On 4/14/24 19:54, Andrew Jeffery wrote:
> > > > On Fri, 2024-04-12 at 09:43 -0500, Eddie James wrote:
> > > > > Set the new compatible string for Odyssey SBEFIFOs so that they
> > > > > don't collect async FFDC.
> > > > >=20
> > > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > > > ---
> > > > >    .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 64 +++++++++--=
--------
> > > > >    .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 64 +++++++++--=
--------
> > > > >    2 files changed, 64 insertions(+), 64 deletions(-)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> > > > > index 214b2e6a4c6d..3a2bfdf035cb 100644
> > > > > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> > > > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> > > > > @@ -2545,7 +2545,7 @@ scom500: scom@1000 {
> > > > >    						};
> > > > >   =20
> > > > >    						sbefifo500: sbefifo@2400 {
> > > > > -							compatible =3D "ibm,p9-sbefifo";
> > > > > +							compatible =3D "ibm,ody-sbefifo";
> > > > >    							reg =3D <0x2400 0x400>;
> > > > >    							#address-cells =3D <1>;
> > > > >    							#size-cells =3D <0>;
> > > > Bit of a drive-by comment as I'm not really holding any stakes here=
,
> > > > but did the hardware actually change?
> > >=20
> > > Yes, the hardware did change in the Odyssey version.
> > Should there not be a new platform DTS then? Seems a bit puzzling, but
> > again this is a bit of a drive-by comment.
>=20
>=20
> Ah, I should clarify. The SBE hardware was changed between P9/P10 and=20
> Odyssey versions. The Odyssey hasn't changed. The difference in the SBE=
=20
> wasn't apparent when we initially added support for Odyssey, so this is=
=20
> effectively a bug fix on the new hardware. There is no new platform.

That sounds like good info for the commit message. Do you mind updating
it?

Andrew
