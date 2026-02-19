Return-Path: <linux-aspeed+bounces-3527-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPtiM/uUl2nO1QIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3527-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Feb 2026 23:55:55 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0E16365D
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Feb 2026 23:55:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH7yY69XXz2yrl;
	Fri, 20 Feb 2026 09:55:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771541749;
	cv=none; b=SFuwnxENHGSn3EV/FaX0KmL+rZV9D//jRqTIbQ68IjrkqPMTrU2be0t5lPzr7Y+wMt4AXHI6d5BcXIwlMxG9DWL0P/ErlA7u6IuS3Tbx/GeQhVbWFRiKJXEqGpAdF70pPZ4mdN//gvqH2Awn8EabDtye/Th+LbPJCt9Sgpey46xt2oLeKqjpCOT7XYQh2fvBgxuLiCJj1RfDAt1Qfv1VVUH9ZlQP1o8TMdNlMJqcimXgaO21v1dioXOswDC2sCl3kVp4yelsq6q0Ebkt9nt8BWSQdbak46NdJ4yOD6OIg6r6x5evlBq+nL+w8NtP7qn+sqXIJ4XgeeX6mKfMh9N0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771541749; c=relaxed/relaxed;
	bh=SsuYpqBzhHCrA5NOoErB6qWr93G3ME/F8oMqLaTn5dw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uzmo1LgKCRYa8iAmpaRBF/qET4ykbx2qeNy3cBZsO7Nl1mpcgrRBAhNOOrNt5Rr1ofWtyEtKh2cUr/rpm0JKlW/wg9hZmN6ZEziuPdFU786HJdVoh3muzTWnWNIOgAzshfUmhKAbLIzoOWwIJuMi/ib+4wua8L8Qusk1zaozzZOzPwe/LwMNQc1BHq4J5dzIkGnEFve0ufLWru+BVzzbEazVqUBSi9IrnraiuVURjV7hoddus4CGqXC6GWIAqWwvB25QdP5ud9f2X2UytkjaeMBWjs9vjRuYz4y4G5Wur48fGqCN+WlBB7uH1fQSG7yrvCRWwOXQPa8SCm8VNK/Kgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UJ8Qx9VO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UJ8Qx9VO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH7yX3Yzvz2xls
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Feb 2026 09:55:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771541742;
	bh=SsuYpqBzhHCrA5NOoErB6qWr93G3ME/F8oMqLaTn5dw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UJ8Qx9VOxZXNGx2/KPPqarJ91onDtc/c91tR9XStg93O0F1PqgJ+gMaRUYKw8KAG+
	 JdhtuaUIov9nn66tpAvtBOIVvSjTaj+LKGdUseStOl1nbaRROrZt+7HtHWzMmhwA2A
	 XNGS4Ynv4pnpbB03RKhnj3n4C0U1FVQ68TvFvkgKyYlDSn+eKuufiN9va4TuahBbUm
	 cC4wg9fuXIARy+r/3i0NWLUeLEBgqmWx20em5jd2a3xnIP4GJsh973uEurQUmSUEfp
	 v/N05EpZ+l4VNk/PtqsKQGzOhhAe11vAFRUAk/Id4QHlykWQyZ+vlGIAGC1Q1/VwmF
	 qHIPlrhpXS5eQ==
Received: from [192.168.68.114] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 08C16600E1;
	Fri, 20 Feb 2026 06:55:41 +0800 (AWST)
Message-ID: <7fb15c01c586fb7d4a3ee506b17d87151d50bfe6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Chen, Dirk" <Dirk.Chen@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 20 Feb 2026 09:25:41 +1030
In-Reply-To: <MN2PR12MB403103EC90C803E3FA6CE6B9E76BA@MN2PR12MB4031.namprd12.prod.outlook.com>
References: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
	 <6192440acc150d216de5e074299e579e891fc845.camel@codeconstruct.com.au>
	 <MN2PR12MB403103EC90C803E3FA6CE6B9E76BA@MN2PR12MB4031.namprd12.prod.outlook.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3527-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Dirk.Chen@amd.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.50:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.70:email]
X-Rspamd-Queue-Id: D5B0E16365D
X-Rspamd-Action: no action

Hi Dirk,

On Thu, 2026-02-19 at 15:54 +0000, Chen, Dirk wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

Please have a read through [1], in particular:

[1]: https://subspace.kernel.org/etiquette.html

   Do not include =E2=80=9Cconfidentiality disclaimers=E2=80=9D

   When posting to public mailing lists the boilerplate confidentiality
   disclaimers are not only meaningless, they are absolutely wrong for
   obvious reasons.
  =20
   If that disclaimer is automatically inserted by your corporate e-mail
   infrastructure, talk to your manager, IT department or consider using a
   different e-mail address which is not affected by this policy. Many IT
   companies have dedicated e-mail infrastructure for kernel developers to
   specifically avoid this situation.

>=20
> Hi Andrew,
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 eeprom@50 {
> > Please order these nodes by ascending address. The node currently above=
 this one is i2c-mux@70 - eeprom@50 should go before it.
> > https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order=
-of-nodes
>=20
> Thanks for the reminder.
> I've reordered the nodes by ascending address in v3.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "atmel,24c2048";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x50>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pagesize =3D <128>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0};
> > +=C2=A0=C2=A0=C2=A0=C2=A0 eeprom@50 {
> > Same for this one.
>=20
> Fixed in v3 as well.
>=20

Thanks,

Andrew

