Return-Path: <linux-aspeed+bounces-4128-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMajMgGlE2rbEQcAu9opvQ
	(envelope-from <linux-aspeed+bounces-4128-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 May 2026 03:25:21 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9875C529F
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 May 2026 03:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gNyqc2ymrz2yFP;
	Mon, 25 May 2026 11:25:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779672316;
	cv=none; b=bwcqqTRjzMs/sWRtptcW+2vcozPr+v3Ky8tTB7ma9EOuZT8X9saphX2drU4gU4h8hG7SY4T232ArsL4ANGG7ucEdmUaD51+YfJ4+S74KYfc3Fqq4fq+8gak60jL9+rhrc+0kQmiKYZcinAL3Kx+PFs98CATmazCKi2wtFpYp1DLONV/+4+qBLo7BftMyW/odRmCTbub6f25gKWj+WZ6LMTOoqk0DLbCe25v6O25uKtl8bc+XRGiqihMnzQ30C+1LYMP03tUL1HMR6jXkG8LLOPyhrheFV1Ut8uy/XvYa1S4uzUrb46ImB/ju3WmywVm7/2cN1gbjPlUxaRFdEzCU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779672316; c=relaxed/relaxed;
	bh=EOngXcy4azYbeJnIGGVTceQl/NqW4hHU6sQbR3V0fVQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+zxKmD3yt+teZIr+Vq1oeWwbLgKgnYwM1hcU7pHomNdUv5/u+DMGdcgDJwb5qOk2NYjQ/OBj3OirB9twcN1oNoi+1vblMACTCNk5TBXmkAzsi52aZsa17pk3uJOfWEIIeuHUVDK/yMfatW1a7HJTZDt508ecq0oA/tw2xg8AuOocXGZzKMso2Cun4tiR6yJ7d4RAWPR+hfMA5bPR2Yn4oLcGpBqLVfvE3s03tsy6nElHy9OMNMOWsoL6EsUVTL9OEKRImuEwYqJMbhJzCoaKRJmIteIXl8VgnhAo8a8R/ao0nWPtKHhklQoFMMVhAi42L685X2lp2bEP2N7EoSJVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JffiABGH; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JffiABGH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gNyqZ7585z2xfB
	for <linux-aspeed@lists.ozlabs.org>; Mon, 25 May 2026 11:25:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779672313;
	bh=EOngXcy4azYbeJnIGGVTceQl/NqW4hHU6sQbR3V0fVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JffiABGHYUUHJpRcyq52r58EKKZFnFNOItdblZO26LvoMu6Z1WgbnOWWe98KB9xT/
	 bKMFBaNjgUWO++o3Gn9EFyjUzwsXdXWqHbGcuix0hrx1Xv+arE4nLF7sCJ1sqTJKFG
	 /nLBKqh2IyFzs3DI1zYUXBg3NDsur/c/BDp8TNDDY6OWEKwt0YKhegt0UDB3QwIqGv
	 0dU/ReOxRsH4ImflO2/rX87zzUoPK9y2pP5FLbY+Lu4IxM0dAcGXMIkysgf0zN+8BH
	 ujNT3YpaSY35yasBunE671nwNQefM3HaZ2MoN/9SQpTDdweUe191b7re7LOYTVEFUy
	 pVvXa4PDxStiw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5671B60007;
	Mon, 25 May 2026 09:25:10 +0800 (AWST)
Message-ID: <5e5db092fbf80b88a95d38b3d0b655baac22c711.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus
 Kommando IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Lunn <andrew@lunn.ch>, Anirudh Srinivasan
 <anirudhsriniv@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 May 2026 10:55:09 +0930
In-Reply-To: <d8c7d7c9-6f2f-4d3f-95d4-877e8504a1b6@lunn.ch>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
	 <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
	 <d8c7d7c9-6f2f-4d3f-95d4-877e8504a1b6@lunn.ch>
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
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4128-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:anirudhsriniv@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:joel@jms.id.au,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: BD9875C529F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-05-22 at 14:05 +0200, Andrew Lunn wrote:
> On Thu, May 21, 2026 at 10:49:24PM -0500, Anirudh Srinivasan wrote:
> > Hi Andrew,
> >=20
> > On Tue, Mar 31, 2026 at 9:18=E2=80=AFAM Anirudh Srinivasan
> > <anirudhsriniv@gmail.com> wrote:
> > >=20
> > > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > > phy mode set to rgmii-id.
> > >=20
> > > When this DT was originally added, the phy mode was set to rgmii (whi=
ch
> > > was incorrect). It was suggested to remove networking support from th=
e
> > > DT till the Aspeed networking driver was patched so that the correct =
phy
> > > mode could be used.
> > >=20
> > > The discussion in [1] mentions that u-boot was inserting clk delays t=
hat
> > > weren't needed, which resulted in needing to set the phy mode in linu=
x
> > > to rgmii incorrectly. The solution suggested there was to patch u-boo=
t to
> > > no longer insert these clk delays and use rgmii-id as the phy mode fo=
r
> > > any future DTs added to linux.
> > >=20
> > > This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> > > modified to insert clk delays of 0 (instead of patching u-boot itself=
).
> > > [3] adds a u-boot DT for this device (without networking) and describ=
es
> > > how to patch it to add networking support. If this patched DT is used=
,
> > > then networking works with rgmii-id phy mode in both u-boot and linux=
.
> > >=20
> > > [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5e=
cb9c777a@lunn.ch/
> > > [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> > > [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656=
f8cd314@gmail.com/
> > >=20
> > > Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > > ---
> > > This patch is based off aspeed/arm/dt from bmc tree
> > > ---
> > > Changes in v2:
> > > - Commit message now mentions that the u-boot tested against is the
> > > =C2=A0 openbmc u-boot fork
> > > - Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networ=
king-v1-1-66d308b88536@gmail.com
> > > ---
> > > =C2=A0.../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts=C2=A0 | 1=
8 ++++++++++++++++++
> > > =C2=A01 file changed, 18 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-c=
ard.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c33=
6236c3b9d01b7de1bba 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> > > @@ -107,6 +107,24 @@ &gpio1 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*18E0 32*/ "","","","",""=
,"","","";
> > > =C2=A0};
> > >=20
> > > +&mac2 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&ethphy2>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_rgmii3_=
default>;
> > > +};
> > > +
> > > +&mdio2 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy2: ethernet-phy@0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +};
> > > +
> > > =C2=A0&vhub {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > =C2=A0};
> > >=20
> > > ---
> > > base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
> > > change-id: 20260328-asus-kommando-networking-5c0612aa6b8c
> > >=20
> > > Best regards,
> > > --
> > > Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > >=20
> >=20
> > While we're figuring out what to do with u-boot, what are your
> > thoughts on getting this patch in so that the kernel DTS changes
> > needed for networking land in this cycle?
> >=20
> > The current commit message might become somewhat outdated if the
> > u-boot patch changes though, so not sure if that's okay.
>=20
> The commit message explains "Why?", which is what is important. So it
> should not matter if it becomes outdated. And the DT is correct, no
> matter how the issue is solved.

Yeah, this was my thought too, so I intend to apply it.

>=20
> So i'm O.K. with this.

Thanks

Andrew

