Return-Path: <linux-aspeed+bounces-4047-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGj2B2adCmr84AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4047-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 07:02:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613E565D47
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 07:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJlzM5jbmz2xRw;
	Mon, 18 May 2026 15:02:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779080543;
	cv=none; b=QrERn6Yc3RxWfuZbcPFZtK4QsKFzZ8TOw8e7dC/KNIkYPgVoGKkKMbuTV9q19NHXvurHkUTHJ3hyCt2hapiCFWIJr9vD0mureYqAzohnKakxr/YIP+4F2mdCOf998mjKRpD4RotnGqBsbAD6WzJqC+88Iy6r0oBccFcYVA1LNMzR7NC7xK6rRo+54ZgmhUjVz8Cs5ovND4TYfEAKVnUdZt+dLALhT9inyBrGy2btx18VC4HiON0cD9bEUH5butR1HQhqoQLcd1P5J7TweREmk6YySfMJbtxVTywlheGawoH+0NgKf6RZ1/Q6D4Bp1YjCcI01VENL7/+LglDUFuuB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779080543; c=relaxed/relaxed;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFMzxyGYh/XVRCm4m9Bxw1rUjCD+gh9DgGm3qQVzIJALMUDlTK8nW7hnHqlUfAqnMOXwCJdPIlraZOCEYRblb2rAnk7wQJEqP9oPV0gWPzfZs49PyZ7xq+lKdWBu9eOAqPRv/sgpSXJPMOe40+sKPooJgOXWT/jN8aDe4wwkDWA7C/KfZVU4quX1h6fH20b4q2oNRB+ThgPxRn0okhwdJ80dtvYI8rnVKPikarPPRG+f6FMiewAkmpY7m2k71mcIKD9yUxRICiTm4WV1/yNrS9penL2UXZNhrPooO1T4hkXS/LJR+c8+c0bt8ibp88QYEUvPdIXpUIzNH6eMsShqkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V537ku1D; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V537ku1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJlzM0pysz2xPb
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 15:02:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779080541;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V537ku1DUKlUnpyvBfXQTRmZtwO0M9khnjhFoZkwPTTuzgNGZqasZSPR5Te2AfLL8
	 ItvG8QguMR+XGSAv6MWwz3a0bet/9Lp/HiNboJXGR/8CJ80lkx3QfL3epnsseycq8S
	 0h/zIuGQjFnu8hhGLLhBePg9654iI5vzrPDdYjeRcyX06qP/srM8ht6XAnce+hZAAY
	 Z6xFiVbkR9MFSXnPOsYGwZ2UvL3Nu5uKIvmgXcSTkKsm88+hWVyef070efjPirRHbb
	 XWHGtVvqACFfk4jEQW17pzudzceTavrZNNDrg8d/AtrJ0kpi/Ka7eqeQgBnaeLz2ab
	 cUPr/h6oqO78g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A23266025D;
	Mon, 18 May 2026 13:02:19 +0800 (AWST)
Message-ID: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Lee Jones <lee@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Date: Mon, 18 May 2026 14:32:19 +0930
In-Reply-To: <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
	 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
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
X-Rspamd-Queue-Id: 6613E565D47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4047-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dawid.glazik@linux.intel.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:maciej.lawniczak@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Action: no action

Hi Dawid,

On Mon, 2026-05-11 at 16:14 +0200, Dawid Glazik wrote:
> On 4/24/2026 10:20 PM, Dawid Glazik wrote:
> > This series reworks and resubmits AST2600 I3C DTS updates that were
> > originally posted in 2024, but stalled without further upstream
> > progress.[1] The series was rebased onto the current tree and merge
> > conflicts were resolved.
> >=20
> > The patches first move I2C controller nodes under the APB simple-bus
> > for layout consistency, then document aspeed,ast2600-i3c-global in
> > the syscon binding, and finally add AST2600 I3C controller nodes in
> > aspeed-g6.dtsi.
> >=20
> > Jeremy agreed in a separate email thread that I can continue this
> > series under my authorship.
> >=20
> > Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c=
88e.1714647917.git.jk@codeconstruct.com.au/
> >=20
> > Dawid Glazik (3):
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: move i2c controllers directly into ap=
b node
> > =C2=A0=C2=A0 dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global co=
mpatible
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: Add nodes for i3c controllers
> >=20
> > =C2=A0 .../devicetree/bindings/mfd/syscon.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 543 ++++++++++--------
> > =C2=A0 2 files changed, 318 insertions(+), 227 deletions(-)
> >=20
> >=20
> > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>=20
> Hi all,
>=20
> Gentle ping for this series:
> https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel=
.com/#t
>=20
> I received Reviewed-by from Krzysztof Kozlowski (thank you).
> Could I please get feedback/ack from maintainers on the remaining parts,
> especially ASPEED DTS?
>=20
> If preferred, I can respin/rebase the series.
>=20

Sorry for the delay.

Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.

Cheers,

Andrew

