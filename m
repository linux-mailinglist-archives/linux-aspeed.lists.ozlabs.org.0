Return-Path: <linux-aspeed+bounces-3587-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJz8G8abp2ksigAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3587-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Mar 2026 03:41:10 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7F1F9F14
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Mar 2026 03:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQcNy5kSmz30FP;
	Wed, 04 Mar 2026 13:41:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772592066;
	cv=none; b=RD+cwjVKsZGp5MeZyKOUX2OFG32dCRCh8OFjtcmmxjPe1LG68QCKQwEDKelSEmPIqA15b8Lzm9akXz9bNDyE0M3n22r+hbYsH/akPz2tcIK5vi9cExqFkLIdlnDEbaSLoJaWmSCKMoz46xZJhp6GhjHlLrCT4NeldrsWZs8PbvkMXXXJUHrUpmdwI9PpCphMybKApGtn/8gy0PZ1WSu0noy2LKKTqFiBb9EnNOc2VBTK+sebe1TlbnWPiU00Akscgk5bX1XjlIHKxUFuFOe+oDIVt92MQ87FA+YmnBQFXAXh0IM3pv638WrN1NIuwJn1nHSTTvG1/cRYG4RRyaE3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772592066; c=relaxed/relaxed;
	bh=Ih8XBInDkYJdrPvgQj+yzh+6t6OHwUs1ab86hkiTbV4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPWArRlaXyDHAyQ5Kh6vDF+soR+e9ePYvfvS1IDtoeLS4JvmBFdQKBEGyqpDm4qy+XqoAPI2jar8q0oYFKfpjvm2eZ6I0ZTIFRffSLacoaBIukvx7dycoGBozB9JZf6ahRSLQQ+3cc06zSnHyMXVaysGvKu7HmXKaG5jFEHPcZ3qpgppkB4a3slPOrorvKwkX/9+eVDQXUF+b9Lm5SwZ/juAnmEPF7REdlwDboAOpzEwlZy+8VXDvt9WpouSvtelSI9F+wiRUg0IMIpaAjRQKw1Gi96V3IViRq78SBaEn1tZx7/SLr7U7zCKhV9UWAun2qyZ5bBWKCDxmdtTu7JfZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SalvJloe; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SalvJloe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQcNx6KvZz2yLH
	for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Mar 2026 13:41:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772592063;
	bh=Ih8XBInDkYJdrPvgQj+yzh+6t6OHwUs1ab86hkiTbV4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SalvJloerZOYvex+zkrwh5UMW3MGxyhruNDEFL83KHvFNP8bYTJoq3fe1rizA3YJB
	 tms5oPmwKDAxRx2zBqjtQXszG3mgr81wHMWJhjq8O7/cNElXxH0m0vs+mNewFj770X
	 sm+famqvqJ5TG6U1ZCqUwKE1i+rpFx0pdaWjbLyTVEldTLpGyJpJuJcvJ+U02RxTfc
	 f0g0KqrpGfelQXbhMUuJB/w6fuunQ9R5AH2OuqymTxL5mZQw6cqWcq5PyfixqUczAQ
	 JBFvPK2STremjsw79QuSjFU0/iz9oJeVLrTwaJEpnfzGlfI9aRtE7E/LkwsW5Xt9wJ
	 Bjb1FsQoPR9PA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C80C6000D;
	Wed,  4 Mar 2026 10:41:00 +0800 (AWST)
Message-ID: <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>, Daniel Hsu <Daniel-Hsu@quantatw.com>
Date: Wed, 04 Mar 2026 13:10:59 +1030
In-Reply-To: <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
	 <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
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
X-Rspamd-Queue-Id: 89D7F1F9F14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-3587-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:kevin.tung.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:Daniel-Hsu@quantatw.com,m:kevintungopenbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> Add new SGPIO line names for user space monitoring and event logging.
>=20
> Also rename PADDLE_BD_IOEXP_INT to ALERT_IRQ_PMBUS_PWR2_N to match
> hardware naming. The original PADDLE_BD_IOEXP_INT is unused, so this
> change does not affect current system functionality.

Why are these two problems being solved in the one patch?

https://docs.kernel.org/process/submitting-patches.html#split-changes

Essentially, your use of "Also" is a bit of a red flag here.

However, on the specifics, why was the PADDLE_BD_IOEXP_INT hardware
naming wrong to begin with? What changed?

Broadly, it feels a lot like you're revising platform designs, then
trying to make the one devicetree fit the current design, and are not
explicitly communicating that this is what you're doing.

If that _is_ what you're doing, then we can come up with much better
schemes to handle it that aren't a constant stream of compatibility
breaks.

I need you to engage with this concern.

From inspection, I only find patches 1, 4 and 7 of this series to be
something I'd consider applying without further discussion.

Andrew

