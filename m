Return-Path: <linux-aspeed+bounces-3784-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GaDAlTTxGnk4AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3784-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 07:33:56 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63E32FE52
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 07:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fhDWN5tCPz2yS4;
	Thu, 26 Mar 2026 17:33:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774506832;
	cv=none; b=Zn8mjOfXH+4V/pQoAvMp4ORT9bk5EkhDLJf+uVSieKzn7vxxW2BpKUSezIv9Xni+0WpyXTU7NOhPvTN8INU/osy4IupHt0poXIggoC2IMp254OBdeW3OZaSduQKbB7JX7Jk3xv9Dbbz/RdRUf7KLnVKeUh3F+jsGlOuNL+G1OWsb552mFHxeUyyd2f15JbYDZjw4v6TX8kTuUNbPRq8iVoLpS80XDaauP55rsxFjFDOgTlfSW6NkF/bgY6wZWgN0cHG9exPbMtJitl0VD8UqSXAkMVl2wDmwKUJ70560dyFf6xjFUVNmvbpPNrVxzy53uH20ZZSqo/u33kgcMiDd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774506832; c=relaxed/relaxed;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zqi/PySJ/o4XCPL96/kSKPpWBO7hc7UHhciSyRv4L/G+WMYEwGWZKIeA/HNTPIGdq4eISVF1AwLxxkGFfqO7aoBHN38osFuU+z5+TjHoZAHDpryAJ5SlSSo558OK7eGasj1gwOwn0B7ll3hp2k6NawopJ3Yb+KrAtgGox0CbYQvMVgJxPsZnRMX4KIJDW67tiBLxOaB5yshDaMXmL8X9vz16CIreU5Y8pVUv7uhj5IitWX9D4Ntc4Tb9Ghdds+lbQT5vvTe8+j0QBgktkDEjsvLmtR7NikCXb8/Brb44wAG748F6WoivX92pkSmXqUC0T+HJe6GZpldFAI87Ps5mBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RVchZcSx; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RVchZcSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fhDWN00zwz2xS5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Mar 2026 17:33:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774506830;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RVchZcSxXPFdsmnvH4AnQkN2+1gupNkeRKHB4UHoEkEzw6Fy9/wccbzesTahCb74v
	 fFVTp01572MGe129MFl9h0qdwaG8L8FM57vgieBVBIQ3OfjyDj1PM0EcXma98VM1Es
	 6sSVHur16IsQVaJahX3t+3cTBeWUleQWGaEZyM7jN/9Q/ubIr+TdApYHdwJKKNEBHp
	 rss334e0TEB5gA+Insa7bE/hIDbhw7M2kqr0cvGCPORbmRBwVa0Erx3+VEkYP0BVrf
	 96Rm1Na7Zy9HCT43XSST04jQzJcJjvr9kU45Z5dLezfk9MgjCVSlALzF/Ln2hInT7w
	 6M0alBAbbVcDQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF6326597C;
	Thu, 26 Mar 2026 14:33:49 +0800 (AWST)
Message-ID: <0f98ee4fcc662e80160026208b18e655eeb50ad1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 colin.huang2@amd.com
Date: Thu, 26 Mar 2026 17:03:49 +1030
In-Reply-To: <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
	 <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
	 <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-3784-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1F63E32FE52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-06 at 14:06 +0800, Colin Huang wrote:
> Hi Andrew,
>=20
> Thanks for the feedback.
>=20
> In our case the only functional difference between DCSCM rev=E2=80=AFB/C =
and
> rev=E2=80=AFD is the EEPROM I=C2=B2C address change (0x50 =E2=86=92 0x51)=
.
> Other than this, the hardware is identical and all device-tree
> described components share the same wiring and behaviour.
>=20
> Maintaining two separate devicetrees for a single=E2=80=91byte address sh=
ift
> doesn=E2=80=99t scale well for us.=20

I disagree that there's a problem of scale. The kernel's dts files are
processed with the C pre-processor - you can #include one file from
another. .dtsi files work this way, and as a related example, we
maintain two devicetrees for the AST2600 EVB where -A1 had some minor
differences in the regulator configuration:

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts?h=3Dv7.0-rc5
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts?h=3Dv7.0-rc5

See also my response to Kevin Tung earlier:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Andrew

