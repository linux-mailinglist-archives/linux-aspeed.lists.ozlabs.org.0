Return-Path: <linux-aspeed+bounces-3499-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKdhBfxwiWnl9AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3499-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 06:30:36 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047110BC40
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 06:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8YF24vHbz2yFm;
	Mon, 09 Feb 2026 16:30:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770615030;
	cv=none; b=QiP3GLht0nX64mEoPY0MdMtQGbJ1R9c4yTZ7+tOEAp1VWrk/JSPV3U1S+vQ2DdYIVSlKy4P86vpcWilCDwePSgsoid9T1sby0fkzQIYW4eW4scQ5X0bVrbITaNvJhcgdSbv9jTQi1erD4ictng1+nn2VwrR7GzRABvA1GhRZfgXwntM/pV4kHhEeR5lqvBdSoZ3EdD5Wa68KClDmVBApj44Q4yokWoyKj+DZkjiDM3vI6ow7bRRPmqvcTBWz0TuuFhK4u+xPQXxiqZDCtnmccLLUJh9akXtEIIitZ4xbOZq/UvRFsGYiY7RJ3wmt2EGtn/aeDaVH8fDpviQ9u3qKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770615030; c=relaxed/relaxed;
	bh=6dmrWQTudHpALwT3TawG97teYoHjG5M4aiLA9OioLZY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQFF15EnbSHcSw+DxfIcUJ4q8IkJDsTVEBJ7Gfj4w+841FaRXvqXBOniwgx07UvbILLybWE2pwaj+VnWgcc4pPgR4qSpR6zd97v8HPtosTI1sC/rd8iIiJUyqT9+k/wPhRHxaqKGKsB4m7+46Wbr26YvD0AqoYyN6ILo36j85fraMv5luZoO1VyJpFBNoewOr+kGGZYKsChAeFZv+W4+19oi35rPFt/+eNBzQdN5lhLjL3RqgVfgZgHiUoLnoZO9jRCdr8oVIQaXRopctfgXny2hDaWndA+5dcgOg3G78i+YQ4tqxqLzgXUQJFsmPmpyu7HCI9Rac1UcR4Q2glhdlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l/x8sllc; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l/x8sllc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8YF21HvNz2xHX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 16:30:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770615029;
	bh=6dmrWQTudHpALwT3TawG97teYoHjG5M4aiLA9OioLZY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l/x8sllcZtMauYNiP7i2hFsaDm6Cf4hkRrM8IULcrqfkuZJ20brwg7LMhTDgbjxFa
	 sY1GfpXZaGh0jzfG0fsDpyUS3Z2uRJKntB3NsBYrVKK9DUpNmz8b1FdeuttGWlxUrc
	 sY24n13ylRuropENaRqlC3PbmhWJ6CbrxRYQh5vJSVVWWK8YRh6UMKccWGOs8V6lFN
	 4ET+/+k5uai6rBDyZrBbTJ+6yWmrJvsttjaHo43dkiwGnhWCHOYETWMkQwK3+4sbjZ
	 gYNIR0pCO2Nf99pKcYfhMaJvnB2sxIoiFTdh0t4+icdkwmuVhnqxig6K9Ig2cge0vJ
	 QWpTv/ikTbJ0g==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFE816024E;
	Mon,  9 Feb 2026 13:30:27 +0800 (AWST)
Message-ID: <548c59f97704c934919e6d4f625579f17a350fac.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] Add device tree for Asrock Paul IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zev Weiss
	 <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Date: Mon, 09 Feb 2026 16:00:27 +1030
In-Reply-To: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3499-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:anirudhsriniv@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:zev@bewilderbeest.net,m:renze@rnplus.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.975];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2047110BC40
X-Rspamd-Action: no action

On Sun, 2026-01-25 at 15:00 -0600, Anirudh Srinivasan wrote:
> Adds support for Asrock Paul IPMI Card [1], which is an AST2500 based
> PCIe card that provides BMC functionality. The supported functionality
> is similar to the Asus Kommando IPMI Card, support for which was sent
> previously [2].

Due to ordering wrt other patches on the list this ended up with some
minor conflicts in the binding and Makefile. I've fixed those up and
applied it.

Thanks,

Andrew

