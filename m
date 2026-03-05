Return-Path: <linux-aspeed+bounces-3593-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIVGK3XKqGlBxQAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3593-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 05 Mar 2026 01:12:37 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C678E20959F
	for <lists+linux-aspeed@lfdr.de>; Thu, 05 Mar 2026 01:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR9356ngmz3bf8;
	Thu, 05 Mar 2026 11:12:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772669553;
	cv=none; b=OsvAhlgbHOkGC3PLnv1E+SLZClFMlo+VTS+rbhla5MJlDBmdXyYnXQHLnRuqXo47O8VRB2vPeDV6Ez67fYc/YuwmTVr2JqPrJ0f84XHGX6mDGO0/xq+20Mcn0IkXrizVEHH2KCqWGUipLCKbdWEbOnwg8K5qMCTHFG9yhqdwb/sEoHaWACQniyXV2eBbw3Q3gDPx2g9BJaIA2r0VmVaKR3e5zwiM/rZmwY5E4PnhsI66t1Ww6s7+89kPBjmAk5jyGeps+8eZSEw1rTTs/CTl8WC9RGW7AH1uxtQcv9qWaCG81HSR+MDMpkNdjsf46zMgLxmQ66eWdeNVLGS9uRGmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772669553; c=relaxed/relaxed;
	bh=VhY75jogzIbjhIU27lFiOoKUr7croBBqbus1UG6As90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QjpytnF482I9nRWU95wjGeLkhOEEw9IY0ov2L2svauM6tE2/FCzqgNIYhjRZHnZfAXO9m7il37BixSsLxSfKDUcL+8E0GumqrSqDrjtJBaEBl0v82kd63zzy4/tZ8ijNU1s0NaeeAD7QfTcIObJ7h9z6yDeDFb/UHyBE+GE2j/Sh0ymGBft7+Cqo/UEjuHCAgSnDQD8zzLtLH4xFZpdFfNn9HhN+oUj9ReRqjytMT2EEir1bGPn7HMOg2d291dnB1GEMZXVa5dzsuqEk5zNWkeowfbc8nLP+b4BYL60Sb8nR896Sx4UygKrcZNFyld6FaSD8T3O8tdwlV8UWjWsdiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eNz3NS9/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eNz3NS9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fR9353H0Tz30FF
	for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Mar 2026 11:12:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772669552;
	bh=VhY75jogzIbjhIU27lFiOoKUr7croBBqbus1UG6As90=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eNz3NS9/mqu22kQpJvGSvcfTjFkgM9K80QAyI675eZTCeg0UZADIuFVg+7wB2B/bB
	 i/cO7wIIsMAjX0iquAGV+hse58/7N1tbGTi81IH/W7GdjG8f1AlQSXN4qUoIFhz41c
	 8ZAmaCkV7EFpU/O0rBBtTPMy/5AnBvWWrFvV4N99HIvyYFJuWg88qSlMPdfWlyHnLq
	 DbXrFt572dt3X7gT2iprl1tBlRvR/Lez3favGPZcjVsr0JdxSlkLhS7danAQqDPfEx
	 2obVBaa/neFVE1l2O6pzzJ0YoRGdcEkHpunSaRSgFhgnq8qO/XXK22+RaqHlBUJ872
	 Ot1S8wUQ2NsUg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8733060C90;
	Thu,  5 Mar 2026 08:12:32 +0800 (AWST)
Message-ID: <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com
Date: Thu, 05 Mar 2026 10:42:32 +1030
In-Reply-To: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
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
X-Rspamd-Queue-Id: C678E20959F
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
	TAGGED_FROM(0.00)[bounces-3593-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Action: no action

On Mon, 2026-03-02 at 12:20 +0800, Colin Huang wrote:
> eeprom address changed (0x50 to 0x51) in DCSCM rev D
> To support previous rev (B/C) and rev D,
> add eeprom device node for DCSCM rev D.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> DCSCM rev D changed the eeprom address from 0x50 t0 0x51
> To support previous rev(B/C) and rev D.
> add new eeprom node for devscm rev d.

I feel different hardware revisions may deserved different devicetrees.
What are the trade-offs that lead you to avoiding that?

Why is it better to cause driver bind errors on both revisions?

Andrew

