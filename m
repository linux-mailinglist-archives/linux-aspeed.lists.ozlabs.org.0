Return-Path: <linux-aspeed+bounces-4059-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEBVJV/2CmpZ+QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4059-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:22:07 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55156B727
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJwPR6fpHz2xpn;
	Mon, 18 May 2026 21:22:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779103323;
	cv=none; b=a3fzRv3CghThEQF+PKposH/tmJcN0InVqGMFXF4lL5TaIAe4ELwKMQ97Nz3/8J0q7OIYki8u4GHxwWg0DOmuREHSeL4xpqYs2/dtfwENhpadMzP8DC4qB69Aj5vvT5x0DDUzeusyvvOXwKWIGyQGiIFwbqGEWaw4EkZ9V4knO0qHzorM1FbUzMM6JKkggBT6o15rtWKqV1SdXvxpvfconE+Pj39UT0zmpa22snXajppHA38hvZU37qN28jnTEO/Qcwyig691j2Ip8C8EnKSwL6VN2g1qhQOfCmNVMBBVaHrGVf7kpbPQ9eJ5GQ63/HxcOfbLkH4XzHrhkKSirD4k+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779103323; c=relaxed/relaxed;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZapZ3fLwdo8gNSHGhAH6mxILe/vq2N67lbU1qKdIsyKKFIPP5OWfMOykvR8xl3kUtWo4lRa+e0melI6X1pQaB2IRR53+dlh6INw+4CxJwaNez96Tcj0ndgVQekVEbhJOduAUoYLINJgDJNtjxHduMSWS6+EmRuB0ocDSPEfoBQPW3ROMXE2vqzL+LtcsV33P5q3qsKxCg0C9jpH89/U90FTXoOI33efoyrA/uCiH/Yt19bfsQusQKOJ+v1ArdObv1LR5woPcBL+8EcNqbZv5MRSYT0EPG34Y3CC93Rb4TX9Xe2QhhYMS+M2HZeuOppG4FkvMVi4M8NGstE8WA8nuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=myqoaJPz; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=myqoaJPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJwPR33Krz2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 21:22:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779103322;
	bh=w2n0G2+Jazj7BtyrJBZLOCheDF0NMvvyn9XJCPYHCN0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=myqoaJPzPyi+al1ubYSV7anQy9yZQTl1plzyC4g+tWiGfye3dcGdVLplqjgQJ73NO
	 qXaY1nm0hrrXiVov2hXCCZYBLMZa0LY11XCaVutXw0bCkmNwizNfInjC5d9ythy+4+
	 coIQVM5ddaRgAmttQpeKxosnh1Ub4ijCFfhhBSEAdFx/2jAbbHMjl2xnFAEBh7ayxB
	 18LWYKqiio2Ug5Jdk5VWe+q/zusQiUta4iwjmoSoElSxROC97srr4qI9pZ2Bt3f7GX
	 p0Cvo1uBUfOP7kGNCab0sRT4ettc/oU71nbxM5GvJkwA8Fa9TTzaUNKaS+UUTU5FTG
	 2lc06OwsWtWsg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67FB76054D;
	Mon, 18 May 2026 19:22:02 +0800 (AWST)
Message-ID: <88d92981e89a9c6c62b6ddc2fa4af51dcc32c276.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/1] ARM: dts: aspeed: santabarbara: Add system
 monitoring GPIOs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 20:52:02 +0930
In-Reply-To: <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
References: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
	 <20260421130344.2751662-2-fredchen.openbmc@gmail.com>
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
X-Rspamd-Queue-Id: BD55156B727
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
	TAGGED_FROM(0.00)[bounces-4059-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fredchen.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:fredchenopenbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

Hi Fred,

On Tue, 2026-04-21 at 21:03 +0800, Fred Chen wrote:
> Add several GPIO expanders to the Santabarbara platform, with ioexp0
> (0x20) configured to aggregate interrupt signals from downstream
> expanders to optimize sideband pin usage.

Can you provide a bit more context? Is this the result of a broader
design change? Or is it a case of adding descriptions of hardware that
was already present in the design?

Andrew

