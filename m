Return-Path: <linux-aspeed+bounces-4066-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PWgjKNQFC2rt/QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4066-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 14:28:04 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FC56CA0A
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 14:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJxsX6nHCz2xpn;
	Mon, 18 May 2026 22:28:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779107280;
	cv=none; b=jJ3OTushOTLIvU0jtd91PzGu9L5sYqevBJZWn9glgREWYKP6HQdWNiSfMixSPUTnaRbGOjF0S9SAnqzubWCqTUth4UGEnQR5oIUY0Es8NPF0nm/xAT9IGSnutAt7oKLXS/Ks1Sc9AozlFuQ1CVNu8fBz5MCKh6RVsrCxQYmTcVCstAZHDRSkZKevVoffpAoX9AOeeCBCX4Ct3GIS+fe1DOvtPFZqTkN17dPCQhaLDYKZb8EwZauSUWEAciYpt0eAEiJTYeH2feg3CP6Je+iNB0rdR5Z+EauWemhgWbL5rMmRIZxx9CCUG9CA37/qm1h+k6F03iqUZnYttuTOGhktaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779107280; c=relaxed/relaxed;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJRJ6+0hZJHcpL74DitWhwpXRM5fivv0/okVZnczAJb2BcrzyZzPW5AT0K5rHPpMSbdba4Rm4Cvw/S1z5+0m26Ku6sIQ7sl94NRCQHGazQLb2D13m0811M3lOPoKqi0PrrsrgUdzvMevPgdsywkEOmvjLkv+pm/6vJwmuYGXbWFM8Rdi+T6vWonJZSRXekI6/KtHzFB49n4L8aKcDqyMjEkEC1zjLg/29S2MCvdmzasc703jqHE649T0qg7tcVE2xRgz6Z68eX1DgLcPvW6HsdslnX9ri5hBw4GdP61G7XsGefi0Xm3HenlEHXphVqPiYHkQFdDrX51/1TucstQy3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JgiEpNGs; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JgiEpNGs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJxsX3XNPz2xPb
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 22:28:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779107279;
	bh=wj0yR9PYapzRO9WETQEouL8N/6Cx3siFuTTA4xukOso=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JgiEpNGsV/MptSZiLUBCsoKNZCnbg/Pong+ZdioH3V1VMSsXzpLBszyHPglpYeEcu
	 AA4yQrnj8775FFAT69kdOk23mSjjgbjGlDpcGnQeRBk1PS/sNMIoLX3emWPtgQuaqn
	 qfvhc4ndnsfwkJf72cqvekBDXC67fFp4PwHbWmpKi8EejioKsEwUZl2JjroUSqL19X
	 lflx7wLZeHr1i04ctMSPuOy0vrNcSC3iw9tT8M2IUO8+iTlY3dX7RhzKMp7HFsutQ1
	 kYi8C9ccG7DhQC/HcuCfVynQchUH13RHHhCtUMPBuQbQdvezOMrPCM1GOy+WXeoor2
	 BKnxh2aQe9B0Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4F6096024D;
	Mon, 18 May 2026 20:27:59 +0800 (AWST)
Message-ID: <663d06c8c42892586075ddb2ba7111b06c58752f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v13 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "P.K. Lee" <pkleequanta@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Date: Mon, 18 May 2026 21:57:59 +0930
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
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
X-Rspamd-Queue-Id: B45FC56CA0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4066-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,jms.id.au,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:pkleequanta@gmail.com,m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:Jason-Hsu@quantatw.com,m:p.k.lee@quantatw.com,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi P.K.,

On Tue, 2026-04-07 at 16:16 +0800, P.K. Lee wrote:
> Add Linux device tree entry related to Meta (Facebook) Ventura specific
> devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
> detect liquid leakage from all compute trays, switch trays and rack
> sensors within the rack, log the events, and take necessary actions
> accordingly.
>=20

...

> ---
>=20
> P.K. Lee (2):
> =C2=A0 dt-bindings: arm: aspeed: add Meta Ventura board
> =C2=A0 arm: dts: aspeed: ventura: add Meta Ventura BMC

A few things on the commit subjects. Can you please:

- Capitalise the first word of the short description (the word after
the final colon)
- For the DTS patch, capitalise 'ARM' for consistency
- Avoid redundancies

So:

   dt-bindings: arm: aspeed: Add Meta Ventura board
   ARM: dts: aspeed: Add Meta Ventura BMC

Cheers,

Andrew

